import 'package:flutter/material.dart';
import 'package:flutter_dtt/home/presentation/widget/home_empty_list.dart';
import 'package:flutter_dtt/home/presentation/widget/home_row_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text('DTT REAL ESTATE',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.surfaceTint,
                ),
                hintText: 'Search for a home',
                hintStyle: Theme.of(context).textTheme.bodySmall,
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Expanded(child: _buildList()),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView(children: const [
      HomeRowCard(),
      HomeRowCard(),
      HomeRowCard(),
      HomeRowCard(),
    ]);
  }

  Widget _buildEmpty() {
    return HomeEmptyList();
  }
}
