import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeEmptyList extends StatelessWidget {
  const HomeEmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Image.asset('assets/search_state_empty.png'),
        ),
        Text(
          'No results found! \nPerhaps try another search?',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.surfaceTint),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
