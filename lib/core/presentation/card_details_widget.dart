import 'package:flutter/material.dart';
import 'package:flutter_dtt/home/domain/model/house_info.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailsWidget extends StatelessWidget {
  final HouseInfo houseInfo;

  const CardDetailsWidget({
    super.key,
    required this.houseInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCardDetail(bedIcon, '${houseInfo.houseModel.bedrooms}', context),
        _buildCardDetail(
            bathIcon, '${houseInfo.houseModel.bathrooms}', context),
        _buildCardDetail(layersIcon, '${houseInfo.houseModel.size}', context),
        _buildCardDetail(locationIcon,
            '${(houseInfo.distance / 1000).toStringAsFixed(0)}  Km', context),
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
