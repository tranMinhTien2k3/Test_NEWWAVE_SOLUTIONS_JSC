import 'package:flutter/material.dart';

class Searchlist extends StatefulWidget {
  const Searchlist({super.key});

  @override
  State<Searchlist> createState() => _SearchlistState();
}

class _SearchlistState extends State<Searchlist> {
  final List<String> _items = [
    'A',
    'B',
    'C',
    'D',
    'E',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _items
          .map(
            (item) => Container(
              height: 70.0,
              child: ListTile(
                title: Text(item),
                leading: const Icon(Icons.location_on_outlined),
                trailing: IconButton(
                  icon: const Icon(Icons.directions),
                  onPressed: () {},
                ),
                tileColor: Colors.white,
              ),
            ),
          )
          .toList(),
    );
  }
}
