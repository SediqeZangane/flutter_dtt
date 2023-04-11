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
        _buildCardDetail(bedIcon, '${houseModel.bedrooms}'),
        _buildCardDetail(bathIcon, '${houseModel.bathrooms}'),
        _buildCardDetail(layersIcon, '${houseModel.size}'),
        _buildCardDetail(locationIcon, (houseModel.distance/1000).toStringAsFixed(0)),
      ],
    );
  }

  Widget _buildCardDetail(String svg, String text) {
    return Row(children: [
      SvgPicture.asset(
        svg,
      ),
      Text(text),
    ]);
  }
}

const String bathIcon = 'assets/icons/ic_bath.svg';
const String bedIcon = 'assets/icons/ic_bed.svg';
const String layersIcon = 'assets/icons/ic_layers.svg';
const String locationIcon = 'assets/icons/ic_location.svg';
