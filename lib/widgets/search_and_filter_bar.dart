import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchAndFilterBar extends StatefulWidget {
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onCategorySelected;

  const SearchAndFilterBar({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
    required this.categories,
    required this.selectedCategory,
    required this.onSearchChanged,
    required this.onCategorySelected,
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
        _speech.listen(
          onResult: (result) {
            final recognized = result.recognizedWords;
            widget.searchController.text = recognized;
            widget.onSearchChanged(recognized);
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo acceder al micrófono')),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      widget.onCategorySelected(category);
                    }
                  },
                  selectedColor:
                  Theme.of(context).primaryColor.withOpacity(0.2),
                  elevation: 2,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
