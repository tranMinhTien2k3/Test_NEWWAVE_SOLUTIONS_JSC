import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_app/Model/Address.dart';
import 'package:my_app/ViewModel/Addressview.dart';
import 'package:my_app/Views/Widgets/SearchBar.dart';
import 'package:my_app/Views/Widgets/Searchlist.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Address> _searchResults = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AddressViewModel>(context, listen: false).fetchAddresses('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Searchbar(onSearch: (query) async {
            await Provider.of<AddressViewModel>(context, listen: false)
                .fetchAddresses(query);
            List<Address> filteredAddresses =
                Provider.of<AddressViewModel>(context, listen: false)
                    .addresses
                    .where((address) => address.label
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();

            setState(() {
              _searchResults = filteredAddresses;
            });
          }),
          Expanded(
            child: Consumer<AddressViewModel>(
              builder: (context, viewModel, child) {
                final addressesToDisplay = _searchResults.isNotEmpty
                    ? _searchResults
                    : viewModel.addresses;
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (viewModel.error != null) {
                  return const Center();
                }
                return Searchlist(
                    items:
                        addressesToDisplay.map((address) => address).toList());
              },
            ),
          ),
        ],
      ),
    );
  }
}
