import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(
            height: 400,
            width: 900,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                'assets/splashSq.jpg',
              )),
            ),
          ),
          Expanded(child: Container(color: Colors.yellow,))
        ],
      ),
    );
  }
}
