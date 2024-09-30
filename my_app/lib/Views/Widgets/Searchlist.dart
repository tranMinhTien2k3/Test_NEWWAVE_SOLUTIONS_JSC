import 'package:flutter/material.dart';

import 'package:my_app/Model/Address.dart';
import 'package:my_app/Utils/Openmap.dart';
import 'package:my_app/Utils/Texthighligh.dart';

class Searchlist extends StatefulWidget {
  final List items;
  final String keyword;

  const Searchlist({super.key, required this.items, required this.keyword});

  @override
  State<Searchlist> createState() => _SearchlistState();
}

class _SearchlistState extends State<Searchlist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final Address item = widget.items[index];
        return Container(
          height: 70.0,
          child: ListTile(
            title: highlightKeyword(item.label, widget.keyword),
            leading: const Icon(Icons.location_on_outlined),
            trailing: IconButton(
              icon: const Icon(Icons.directions),
              onPressed: () {
                Openmap.openGoogleMaps(
                  item.latitude,
                  item.longitude,
                );
              },
            ),
            tileColor: Colors.white,
          ),
        );
      },
    );
  }
}
