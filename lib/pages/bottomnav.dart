import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quickfoodie/pages/home_page.dart';
import 'package:quickfoodie/pages/order.dart';
import 'package:quickfoodie/pages/profile.dart';
import 'package:quickfoodie/pages/wallet.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTapIndex = 0;
  late List<Widget> pages;
  late Widget currentpages;
  late HomeScreen homepage;
  late Profile profilepage;
  late OrderPage orderpage;
  late WalletPage walletpage;

  @override
  void initState() {
    homepage = const HomeScreen();
    profilepage = const Profile();
    orderpage = const OrderPage();
    walletpage = const WalletPage();
    pages = [homepage, orderpage, walletpage, profilepage];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.transparent,
          color: Colors.black,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTapIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 28,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 28,
            ),
            Icon(
              Icons.wallet,
              color: Colors.white,
              size: 28,
            ),
            Icon(
              Icons.person_outlined,
              color: Colors.white,
              size: 28,
            )
          ]),
      body: pages[currentTapIndex],
    );
  }
}
