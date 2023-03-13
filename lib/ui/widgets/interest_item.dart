import 'package:flutter/material.dart';
import 'package:travel_app/shared/theme.dart';

class InterestItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  const InterestItem({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            name,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
