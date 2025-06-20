import 'package:flutter/material.dart';
import '../utils/ui_helpers.dart'; // Tus utilidades

// Este widget ahora contendrá un TabBar y TabBarView para los pisos
class Building453Details extends StatelessWidget {
  const Building453Details({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // "General" + Piso 1 + Piso 2 + Piso 3 + Piso 4
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: buildSectionTitle('Historia del edificio'),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Nombrado en honor a GUILLERMINA URIBE BONE, la primera mujer egresada de la Facultad de Ingeniería de Bogotá. Su construcción se llevó a cabo entre 1969 y 1970 bajo la dirección del arquitecto Francisco Rojas Sánchez, con modificaciones posteriores en 1981 para mejorar su funcionalidad.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 20),

          // Pestañas de navegación para los pisos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TabBar(
              isScrollable: true,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey[600],
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: 'General'),
                Tab(text: 'Piso 1'),
                Tab(text: 'Piso 2'),
                Tab(text: 'Piso 3'),
                Tab(text: 'Piso 4'),
              ],
            ),
          ),
          const Divider(height: 0),
          // Contenido de cada pestaña
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5, // Ajusta esta altura
            child: TabBarView(
              children: [
                // Contenido General del Edificio 453 (servicios generales)
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('Servicios Generales'),
                      const SizedBox(height: 12),
                      buildListTile(Icons.meeting_room, 'Auditorios', 'Auditorio A, Auditorio B, y Auditorio C Antonio María Gómez M.'),
                      buildListTile(Icons.wc, 'Baños', 'Baños de mujeres a la derecha de la entrada. Baños de hombres al fondo de la entrada principal.'),
                      buildListTile(Icons.water_drop, 'Bebederos', 'Dispensadores de agua potable disponibles en varios puntos.'),
                      buildListTile(Icons.charging_station, 'Puntos de Carga', 'Zonas con tomas eléctricas para dispositivos móviles.'),
                    ],
                  ),
                ),
                // Contenido del Piso 1
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('Primer Piso'),
                      const SizedBox(height: 12),
                      buildListTile(Icons.apartment, 'Dirección Dpto. de Sistemas e Industrial (Aula 101)'),
                      buildListTile(Icons.tv, 'Sala Multimedios Sistemas e Industrial (Aula 101A)'),
                      buildListTile(Icons.laptop_mac, 'Unidad de Informática (Aula 119)'),
                      const Divider(indent: 16, endIndent: 16),
                      buildSubtitle('Aulas del Primer Piso:'),
                      ...buildAulaListTiles(
                        {
                          '100': null, '102': 'Héctor Cifuentes Aya / Luis Gerardo Astaiza Amado', '103': null, '104': 'Jorge Eliecer Camargo Mendoza / Carlos Eduardo Moreno', '105': null, '106': 'Juan Carlos Torres Pardo / Carlos Orlando Robles Roa', '107': null, '108': 'Ismael Castañeda Fuentes / Jonatan Gómez Perdomo', '109': null, '110': 'Joger Eduardo Ortiz Triviño / Libia Denise Cangrejo Aljurr', '111': null, '112': 'Cesar Augusto Pedraza Bonilla / Sandra Liliana Rojas Martínez', '113': null, '114': 'Fabio Augusto Gonzales Osorio / Felipe Restrepo Calle', '115': null, '116': 'Edgar Miguel Vargas C / Feliz Antonio Cortes Aldana', '118': 'Luis Fernando Niño Vasquez / Germán Jairo Hernández Pérez', '120': 'Profesor Jean Pierre Charlamos / Iván Mauricio Rueda Caceres',
                        },
                      ),
                    ],
                  ),
                ),
                // Contenido del Piso 2
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('Segundo Piso'),
                      const SizedBox(height: 12),
                      buildListTile(Icons.apartment, 'Dirección Dpto. de Ingeniería Civil y Agrícola (Aula 201)'),
                      buildListTile(Icons.apartment, 'Dirección Área Curricular de Ingeniería de Sistemas e Industrial (Aula 209)'),
                      buildListTile(Icons.apartment, 'Dirección de Ingeniería Eléctrica y Electrónica (Aula 222)'),
                      buildListTile(Icons.apartment, 'Dirección de Posgrados, Registro y Programación Académica (Aula 226)'),
                      buildListTile(Icons.person_pin, 'Oficina de Estudiantes (Aula 228)'),
                      buildListTile(Icons.admin_panel_settings, 'Administración del Edificio (Aula 230)'),
                      buildListTile(Icons.science, 'Laboratorio de Bases de Datos y Sistemas de Información (Aula 203)'),
                      buildListTile(Icons.science, 'Laboratorio de Ingeniería Industrial (Aula 213)'),
                      buildListTile(Icons.science, 'Laboratorio de Ingeniería de Software y Arquitectura (Aula 224)'),
                      buildListTile(Icons.local_library, 'MDLYGE Grupo de Investigación (Aula 211)', 'Mecanismo de Desarrollo Limpio y Gestión Energética'),
                      buildListTile(Icons.school, 'Sala de Postgrados de Sistemas (Aula 221)'),
                      buildListTile(Icons.chair, 'Sala de Descanso', 'Con puertos de carga, sillas y máquina expendedora.'),
                      buildListTile(Icons.people, 'Sala de Profesores'),
                      const Divider(indent: 16, endIndent: 16),
                      buildSubtitle('Aulas del Segundo Piso:'),
                      ...buildAulaListTiles(
                        {
                          '200': 'Profe César Manuel Lovera Cabrera / Helga Duarte Amaya', '202': 'Óscar Germán Duarte Velasco', '204': 'Javier Leonardo Araque Quijano / Sergio Raúl Rivera Rodríguez', '205': null, '206': 'Elizabeth León Guzmán / Frank Alexander Ballesteros Riveros', '207': null, '208': 'Jesús Alberti Delgado Rivera / Javier Alveiro Rosero García', '210': 'Germán Andrés Ramos Fuentes / Jhon Jairo Ramírez Echeverry', '212': 'Jesús María Quintero Quintero / Eduardo Alirio Mojica Nava', '214': 'Puerta Misteriosa: Óscar Julián Perdomo Charry / Camilo Andrés Cortes Guerrero', '215': null, '216': 'Ingrid Patricia Páez Parra', '217': 'Mario Alberto Pérez Rodríguez / Jesús Guillermo Tovar Rache / Pedro Agustín Pérez Torres', '218': 'Francisco Meluk Orozco', '220': 'Alfonso Herrera Jiménez / Giovanni Muñoz Puerta',
                        },
                      ),
                    ],
                  ),
                ),
                // Contenido del Piso 3
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('Tercer Piso'),
                      const SizedBox(height: 12),
                      buildListTile(Icons.apartment, 'Dirección Dpto. Ingeniería Química y Ambiental (Aula 301)'),
                      const Divider(indent: 16, endIndent: 16),
                      buildSubtitle('Aulas del Tercer Piso (Impares) / Oficinas (Pares):'),
                      ...buildAulaListTiles(
                        {
                          '300': 'Carlos A. Martínez Riascos / Néstor Algeciras Enciso', '302': 'Julio César Vargas Sáenz / Mario Andrea Noriega Valencia', '303': null, '304': 'Hugo Alberto Herrera Fonseca', '305': 'Sala L.M Broniewski', '306': 'Luis Carlos Belalcázar Cerón / Gustavo Adolfo Orozco Alvarado', '307': null, '308': 'Jairo Ernesto Perilla Perilla / Hugo M. Galindo Valbuena', '309': null, '310': 'Sofía Esperanza Monroy Varela / David Alberto Herrera Alvarez', '311': null, '312': 'Jaime León Aguilar Arias / Armando Espinosa Hernández', '313': null, '314': 'Dolly Santos Barbosa. Gabriel E. Rocha Camino', '315': null, '316': 'Rodrigo Jiménez Pizarro / Javier Andrea Dávila Rincón', '317': null, '318': 'Juan G. Cadavid Estrada / Ivan Dario Gil Chaves', '319': null, '320': 'Juan Carlos Serrato Bermúdez / Luis Alejandro Boyaca M',
                        },
                        hasCustomIcon: (aula) => aula == '305' ? Icons.desktop_windows : null,
                      ),
                    ],
                  ),
                ),
                // Contenido del Piso 4
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('Cuarto Piso'),
                      const SizedBox(height: 12),
                      buildListTile(Icons.apartment, 'Dirección Dpto. Ingeniería Mecánica y Mecatrónica (Aula 401)'),
                      const Divider(indent: 16, endIndent: 16),
                      buildSubtitle('Aulas del Cuarto Piso:'),
                      ...buildAulaListTiles(
                        {
                          '400': 'Sonia Lucía Rincón Prat / Nhora Acuña', '402': 'Luis En. Benítez Hernández / Carlos A. Narváez Tovar', '403': null, '404': 'Flavio Augusto Prieto Ortiz / Víctor Hugo Grisales Palacio', '405': null, '406': 'César Augusto Sánchez Correa / Carlos Alberto Duque Daza', '407': null, '408': 'Nicolás Giraldo Peralta / Adriana Fernanda Sierra / Freddy Alejandro Orjuela', '409': null, '410': 'Jaime G. Guerrero Casariego / Carlos H. Galeano Urueña', '411': null, '412': 'María Alejandra Guzmán / Liz Karen Herrera Quintero', '413': null, '414': 'Juan Edilberto Rincón Pardo / Óscar Yesid Suárez Palacios', '415': null, '416': 'Aldo G. Benavides M. / Henry Octavio Cortés Ramos', '417': null, '418': 'Fernando Rodríguez /',
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}