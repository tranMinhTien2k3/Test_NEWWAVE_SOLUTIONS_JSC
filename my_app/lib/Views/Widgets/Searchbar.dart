import 'package:flutter/material.dart';
import 'package:my_app/Utils/Debouncesearch.dart';

class Searchbar extends StatefulWidget {
  final Function(String) onSearch;

  const Searchbar({super.key, required this.onSearch});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _handleSearch(_searchController.text);
    });
  }

  Future<void> _handleSearch(String query) async {
    setState(() {
      _isLoading = true;
    });

    await debounceSearch((searchQuery) {
      widget.onSearch(searchQuery);
      setState(() {
        _isLoading = false;
      });
    }, query);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        margin: const EdgeInsets.only(top: 30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            hintText: "Enter Keyword",
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIcon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 4.0))
                  : const Icon(Icons.search),
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
