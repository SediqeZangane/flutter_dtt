import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dtt/home/domain/model/house_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailsWidget extends StatelessWidget {
  final HouseModel houseModel;

  const CardDetailsWidget({super.key, required this.houseModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCardDetail(bedIcon, '${houseModel.bedrooms}', context),
        _buildCardDetail(bathIcon, '${houseModel.bathrooms}', context),
        _buildCardDetail(layersIcon, '${houseModel.size}', context),
        _buildCardDetail(locationIcon,
            (houseModel.distance / 1000).toStringAsFixed(0) + '  Km', context),
      ],
    );
  }

  Widget _buildCardDetail(String svg, String text, BuildContext context) {
    return Row(children: [
      SvgPicture.asset(
        svg,
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.surfaceTint, BlendMode.srcIn),
      ),
      Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ]);
  }
}

const String bathIcon = 'assets/icons/ic_bath.svg';
const String bedIcon = 'assets/icons/ic_bed.svg';
const String layersIcon = 'assets/icons/ic_layers.svg';
const String locationIcon = 'assets/icons/ic_location.svg';
