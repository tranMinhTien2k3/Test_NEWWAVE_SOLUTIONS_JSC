import 'package:flutter/material.dart';
import 'package:my_app/Views/Widgets/SearchBar.dart';
import 'package:my_app/Views/Widgets/Searchlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Searchbar(),
          Expanded(
            child: Searchlist(),
          )
        ],
      ),
    );
  }
}
