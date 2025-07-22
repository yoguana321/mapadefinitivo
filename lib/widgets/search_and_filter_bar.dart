// lib/widgets/search_and_filter_bar.dart

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchAndFilterBar extends StatefulWidget {
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final List<String> categories; // mainBuildingCategories
  final Map<String, List<String>> facultySubcategories; // NUEVO: Para las subcategorías de Facultades
  final String? selectedCategory;
  final String? selectedSubCategory; // NUEVO: Para la subcategoría seleccionada
  // MODIFICADO: El callback de selección de categoría ahora puede recibir una subcategoría.
  final Function(String category, {String? subCategory}) onCategorySelected;
  final ValueChanged<String> onSearchChanged;

  const SearchAndFilterBar({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
    required this.categories,
    required this.facultySubcategories, // AÑADIDO
    required this.selectedCategory,
    required this.selectedSubCategory, // AÑADIDO
    required this.onSearchChanged,
    required this.onCategorySelected, // MODIFICADO
  });

  @override
  State<SearchAndFilterBar> createState() => _SearchAndFilterBarState();
}

class _SearchAndFilterBarState extends State<SearchAndFilterBar> {
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _toggleListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('Status: $status'),
        onError: (error) => print('Error: $error'),
      );
      if (available) {
        setState(() => _isListening = true);
        widget.searchFocusNode.requestFocus(); // Enfocar el campo de búsqueda al empezar a escuchar
        _speech.listen(
          onResult: (result) {
            final recognized = result.recognizedWords;
            widget.searchController.text = recognized;
            widget.onSearchChanged(recognized);
            if (result.finalResult) {
              setState(() => _isListening = false); // Detener la escucha al obtener el resultado final
            }
          },
          listenFor: const Duration(seconds: 5), // Opcional: tiempo máximo de escucha
          pauseFor: const Duration(seconds: 3), // Opcional: tiempo de pausa antes de finalizar
          partialResults: true, // Para obtener resultados intermedios
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo acceder al micrófono. Verifica los permisos.')),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void dispose() {
    _speech.stop(); // Asegúrate de detener la escucha al desechar el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtener las subcategorías de facultades si la categoría actual es "Facultades"
    List<String> currentSubcategories = [];
    if (widget.selectedCategory == 'Facultades' && widget.facultySubcategories.containsKey('Facultades')) {
      currentSubcategories = widget.facultySubcategories['Facultades']!;
    }

    return Column(
      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: widget.searchController,
              focusNode: widget.searchFocusNode,
              decoration: InputDecoration(
                hintText: 'Buscar edificio o aula...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.searchController.text.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          widget.searchController.clear();
                          widget.onSearchChanged('');
                          widget.searchFocusNode.requestFocus();
                        },
                      ),
                    IconButton(
                      icon: Icon(
                        _isListening ? Icons.mic : Icons.mic_none,
                        color: _isListening ? Colors.red : null,
                      ),
                      onPressed: _toggleListening,
                    ),
                  ],
                ),
                border: InputBorder.none,
              ),
              onChanged: widget.onSearchChanged,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // PRIMERA FILA DE CATEGORÍAS PRINCIPALES
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              final category = widget.categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip(
                  label: Text(category),
                  selected: widget.selectedCategory == category,
                  onSelected: (bool selected) {
                    if (selected) {
                      // Al seleccionar una categoría principal:
                      // Si es "Facultades", pasa null para la subcategoría (MapScreen lo manejará a "Todos")
                      // Si no es "Facultades", pasa null para la subcategoría (no aplica)
                      widget.onCategorySelected(category, subCategory: category == 'Facultades' ? null : null);
                    }
                  },
                  selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                  elevation: 2,
                ),
              );
            },
          ),
        ),
        // SEGUNDA FILA DE SUBCATEGORÍAS (SOLO SI "FACULTADES" ESTÁ SELECCIONADO)
        if (widget.selectedCategory == 'Facultades' && currentSubcategories.isNotEmpty)
          Column(
            children: [
              const SizedBox(height: 8), // Espacio entre las filas de chips
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: currentSubcategories.length,
                  itemBuilder: (context, index) {
                    final subCategory = currentSubcategories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text(subCategory),
                        selected: widget.selectedSubCategory == subCategory,
                        onSelected: (bool selected) {
                          if (selected) {
                            // Al seleccionar una subcategoría, pasa la categoría principal actual
                            // y la nueva subcategoría.
                            widget.onCategorySelected(widget.selectedCategory!, subCategory: subCategory);
                          }
                        },
                        selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                        elevation: 2,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
      ],
    );
  }
}