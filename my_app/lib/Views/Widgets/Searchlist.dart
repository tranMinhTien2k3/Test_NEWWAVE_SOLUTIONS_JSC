import 'package:flutter/material.dart';

class Searchlist extends StatefulWidget {
  final List<String> items;

  const Searchlist({super.key, required this.items});

  @override
  State<Searchlist> createState() => _SearchlistState();
}

class _SearchlistState extends State<Searchlist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return Container(
          height: 70.0,
          child: ListTile(
            title: Text(item),
            leading: const Icon(Icons.location_on_outlined),
            trailing: IconButton(
              icon: const Icon(Icons.directions),
              color: Colors.grey.shade400,
              onPressed: () {},
            ),
            tileColor: Colors.white,
          ),
        );
      },
    );
  }
}
