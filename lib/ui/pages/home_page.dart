import 'package:flutter/material.dart';
import 'package:travel_app/shared/theme.dart';
import 'package:travel_app/ui/widgets/destination_card.dart';
import 'package:travel_app/ui/widgets/destination_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy,\nKezia Anne',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Where to fly today?',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(left: 16),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget popularDestinations() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              DestinationCard(
                name: 'Lake Ciliwung',
                city: 'Tangerang',
                imageUrl: 'assets/image_destination1.png',
                rating: 4.8,
              ),
              DestinationCard(
                name: 'White Houses',
                city: 'Spain',
                imageUrl: 'assets/image_destination2.png',
                rating: 4.7,
              ),
              DestinationCard(
                name: 'Hill Heyo',
                city: 'Monaco',
                imageUrl: 'assets/image_destination3.png',
                rating: 4.8,
              ),
              DestinationCard(
                name: 'Menarra',
                city: 'Japan',
                imageUrl: 'assets/image_destination4.png',
                rating: 5.0,
              ),
              DestinationCard(
                name: 'Payung Teduh',
                city: 'Singapore',
                imageUrl: 'assets/image_destination5.png',
                rating: 4.8,
              ),
            ],
          ),
        ),
      );
    }

    Widget newDestinations() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: const [
                DestinationTile(
                  name: 'Danau Beratan',
                  city: 'Singajara',
                  imageUrl: 'assets/image_destination6.png',
                  rating: 4.5,
                ),
                DestinationTile(
                  name: 'Sydney Opera',
                  city: 'Australia',
                  imageUrl: 'assets/image_destination7.png',
                  rating: 4.7,
                ),
                DestinationTile(
                  name: 'Roma',
                  city: 'Italy',
                  imageUrl: 'assets/image_destination8.png',
                  rating: 4.8,
                ),
                DestinationTile(
                  name: 'Payung Teduh',
                  city: 'Singapore',
                  imageUrl: 'assets/image_destination5.png',
                  rating: 4.5,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularDestinations(),
        newDestinations(),
      ],
    );
  }
}
