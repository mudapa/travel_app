import 'package:flutter/material.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/shared/theme.dart';
import 'package:travel_app/ui/pages/detail_page.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destination;

  const DestinationTile(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destination),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(
                    destination.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.city,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(
                    right: 2,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon_star.png'),
                    ),
                  ),
                ),
                Text(
                  destination.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
