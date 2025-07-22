from machine import I2C, Pin
import time, math, struct
from ssd1306 import SSD1306_I2C
import network
import socket

i2c = I2C(0, scl=Pin(22), sda=Pin(21))
oled = SSD1306_I2C(128, 64, i2c)

SSID = 'EMERSOND'
PASSWORD = '52899922Ed'

print("Conectando al WiFi...")
wifi = network.WLAN(network.STA_IF)
wifi.active(True)
wifi.connect(SSID, PASSWORD)

while not wifi.isconnected():
    pass

print("Conectado a WiFi:", wifi.ifconfig())
oled.fill(0)
oled.text("Conectado",0, 0)
oled.show()

ORIGEN = (4.637285408330863,-74.0828508734894)
DESTINO = (4.639241422613168, -74.08261348560043)
angulo_objetivo = None

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(('', 1234))
server_socket.listen(1)
server_socket.settimeout(0.1)
print("Esperando conexión en puerto 1234...")


def calcular_angulo(lat1, lon1, lat2, lon2):
    lat1_rad = math.radians(lat1)
    lat2_rad = math.radians(lat2)
    dlon_rad = math.radians(lon2 - lon1)
    x = math.sin(dlon_rad) * math.cos(lat2_rad)
    y = math.cos(lat1_rad) * math.sin(lat2_rad) - math.sin(lat1_rad) * math.cos(lat2_rad) * math.cos(dlon_rad)
    angulo_rad = math.atan2(x, y)
    return (math.degrees(angulo_rad) + 360) % 360

def leer_angulo_brujula():
    try:
        i2c.writeto_mem(13, 0x0B, b'\x01')
        i2c.writeto_mem(13, 0x09, b'\x1D')
        raw = i2c.readfrom_mem(13, 0x00, 6)
        x, y, z = struct.unpack('<hhh', raw)
        angulo = math.degrees(math.atan2(y, x))
        if angulo < 0:
            angulo += 360
        return angulo
    except:
        return 0

def direccion_cardinal(angulo):
    """Devuelve N, E, S o W según el ángulo."""
    if 45 <= angulo < 135:
        return 'E'
    elif 135 <= angulo < 225:
        return 'S'
    elif 225 <= angulo < 315:
        return 'O'
    else:
        return 'N'

def dibujar_flecha(angulo):
    centro_x, centro_y = 64, 32
    largo = 20
    rad = math.radians(angulo)
    x_final = int(centro_x + largo * math.cos(rad))
    y_final = int(centro_y + largo * math.sin(rad))
    oled.line(centro_x, centro_y, x_final, y_final, 1)
    punta_rad1 = math.radians(angulo + 150)
    punta_rad2 = math.radians(angulo - 150)
    x1 = int(x_final + 5 * math.cos(punta_rad1))
    y1 = int(y_final + 5 * math.sin(punta_rad1))
    x2 = int(x_final + 5 * math.cos(punta_rad2))
    y2 = int(y_final + 5 * math.sin(punta_rad2))
    oled.line(x_final, y_final, x1, y1, 1)
    oled.line(x_final, y_final, x2, y2, 1)

def mostrar_oled(diff, angulo_sensor):
    oled.fill(0)
    oled.text("Destino", 35, 0)         
    dibujar_flecha(diff)                
    dir_card = direccion_cardinal(angulo_sensor)
    oled.text(f"{dir_card}", 0, 55) 
    oled.text("Mi UNAL", 60, 55)        
    oled.show()


while True:
    try:
        conn, addr = server_socket.accept()
        data = conn.recv(1024)
        if data:
            message = data.decode('utf-8').strip()
            print("Mensaje recibido:", message)
            partes = message.split(',')
            if len(partes) == 4:
                lat1, lon1, lat2, lon2 = map(float, partes)
                ORIGEN = (lat1, lon1)
                DESTINO = (lat2, lon2)
                angulo_objetivo = calcular_angulo(lat1, lon1, lat2, lon2)
                print("Nuevo ángulo objetivo:", angulo_objetivo)
        conn.close()
    except OSError:
        pass

    if angulo_objetivo is not None:
        angulo_sensor = leer_angulo_brujula()
        diff = (angulo_objetivo - angulo_sensor + 360) % 360
        if diff > 180:
            diff -= 360
        print(f"Sensor: {angulo_sensor:.1f}° | Diff: {diff:.1f}° | Dir: {direccion_cardinal(angulo_sensor)}")
        mostrar_oled(diff, angulo_sensor)
    
    time.sleep(0.2)
