import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceWidget extends StatelessWidget {
  final int price;

  const PriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final myFormat = NumberFormat.decimalPattern('en_us');
    final formatPrice = myFormat.format(price);
    return Text(
      "\$$formatPrice",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
