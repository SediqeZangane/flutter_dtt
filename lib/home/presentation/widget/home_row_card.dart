import 'package:flutter/material.dart';
import 'package:flutter_dtt/core/constants.dart';
import 'package:flutter_dtt/core/presentation/card_details_widget.dart';
import 'package:flutter_dtt/core/presentation/price_widget.dart';
import 'package:flutter_dtt/home/domain/model/house_model.dart';

class HomeRowCard extends StatelessWidget {
  final HouseModel houseModel;

  const HomeRowCard({super.key, required this.houseModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(Constants.baseUrl + houseModel.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriceWidget(price: houseModel.price),
                  Text(houseModel.zip,
                      style: Theme.of(context).textTheme.bodyLarge),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 18.0, bottom: 18, right: 12),
                      child: CardDetailsWidget(houseModel: houseModel)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
