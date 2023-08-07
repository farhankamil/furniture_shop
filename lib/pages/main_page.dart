import 'package:flutter/material.dart';
import 'package:furniture_shop/pages/home/cart_page.dart';
import 'package:furniture_shop/pages/home/home_page.dart';
import 'package:furniture_shop/pages/home/profile_page.dart';
import 'package:furniture_shop/pages/home/wishlist_page.dart';
import 'package:furniture_shop/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget customAppBar() {
    return AppBar(
      title: Text(
        'Home',
        style: primaryTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
      ),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(
          left: defaultPadding,
        ),
        child: Icon(
          Icons.menu,
          size: 23,
          color: primaryColor,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: defaultPadding,
          ),
          child: Icon(
            Icons.search,
            size: 23,
            color: primaryColor,
          ),
        ),
      ],
      backgroundColor: backgroundColor6,
    );
  }

  Widget customBottomNav() {
    return ClipRRect(
      // borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        // notchMargin: 12,
        // clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: currentIndex == 0
                      ? const Color(0xff9A9390)
                      : Colors.transparent,
                ),
                height: 42,
                width: 42,
                margin: const EdgeInsets.only(top: 10, bottom: 0.1),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 20,
                    color: currentIndex == 0
                        ? Colors.white
                        : const Color(0xff808191),
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: currentIndex == 1
                      ? const Color(0xff9A9390)
                      : Colors.transparent,
                ),
                height: 42,
                width: 42,
                margin: const EdgeInsets.only(top: 10, bottom: 0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/icon_trolley.png',
                    width: 25,
                    color: currentIndex == 1
                        ? Colors.white
                        : const Color(0xff808191),
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: currentIndex == 2
                      ? const Color(0xff9A9390)
                      : Colors.transparent,
                ),
                height: 42,
                width: 42,
                margin: const EdgeInsets.only(top: 10, bottom: 0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/icon_star.png',
                    width: 20,
                    color: currentIndex == 2
                        ? Colors.white
                        : const Color(0xff808191),
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: currentIndex == 3
                      ? const Color(0xff9A9390)
                      : Colors.transparent,
                ),
                height: 42,
                width: 42,
                margin: const EdgeInsets.only(top: 10, bottom: 0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/icon_user.png',
                    width: 20,
                    color: currentIndex == 3
                        ? Colors.white
                        : const Color(0xff808191),
                  ),
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      // case 0:
      //   return const HomePage();
      // case 1:
      //   return const CartPage();
      // case 2:
      //   return const WishlistPage();
      // case 3:
      //   return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), child: customAppBar()),
      backgroundColor: const Color(0xffF2F2F2),
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
