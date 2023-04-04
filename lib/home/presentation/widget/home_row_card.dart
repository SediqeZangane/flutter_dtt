import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeRowCard extends StatelessWidget {
  const HomeRowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage(
                  'assets/splashSq.jpg',
                )),
              ),
            ),

          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0,left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text("\$450000",style: Theme.of(context).textTheme.titleMedium),
                   Text('emmasingel31',style: Theme.of(context).textTheme.bodyLarge),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0,bottom: 18,right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCardDetail(bedIcon,'1'),
                        _buildCardDetail(bathIcon,'2'),
                        _buildCardDetail(layersIcon,'45'),
                        _buildCardDetail(locationIcon,'56.9km'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCardDetail(String svg,String text){
    return Row(children: [
      SvgPicture.asset(
        svg,
      ),
      Padding(
        padding:  const EdgeInsets.only(left: 6.0),
        child: Text(text),
      ),
    ]);
  }
}

const String bathIcon = 'assets/icons/ic_bath.svg';
const String bedIcon = 'assets/icons/ic_bed.svg';
const String layersIcon = 'assets/icons/ic_layers.svg';
const String locationIcon = 'assets/icons/ic_location.svg';
