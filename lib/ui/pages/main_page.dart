import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/page_cubit.dart';
import 'package:travel_app/shared/theme.dart';
import 'package:travel_app/ui/pages/home_page.dart';
import 'package:travel_app/ui/pages/setting_page.dart';
import 'package:travel_app/ui/pages/transaction_page.dart';
import 'package:travel_app/ui/pages/wallet_page.dart';
import 'package:travel_app/ui/widgets/custom_bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingPage();
        default:
          return const HomePage();
      }
    }

    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.1),
                blurRadius: 50,
                offset: const Offset(0, -10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/icon_booking.png',
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/icon_card.png',
              ),
              CustomBottomNavigationItem(
                index: 3,
                imageUrl: 'assets/icon_setting.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
