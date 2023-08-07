import 'package:flutter/material.dart';
import 'package:furniture_shop/model/furniture.dart';
import 'package:furniture_shop/theme.dart';

class DetailPage extends StatefulWidget {
  final Furniture? furniture;

  const DetailPage({Key? key, this.furniture}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int currentIndex = 0;

  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccesDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success.png',
                    color: primaryColor,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: (() {}),
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'View My Cart',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : const Color(0xffc4c4c4),
        ),
      );
    }

    Widget appBar() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.chevron_left,
                size: 24,
              ),
            ),
            Text(
              'Detail',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Icon(
              Icons.share,
              size: 24,
              color: backgroundColor1,
            ),
          ],
        ),
      );
    }

    Widget header() {
      return Image.asset(
        widget.furniture!.pictureId,
        width: MediaQuery.of(context).size.width,
        // height: 200,
        fit: BoxFit.cover,
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 400),
        width: double.infinity,
        // margin: const EdgeInsets.only(
        //   top: -17,
        // ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(
              24,
            ),
          ),
          color: backgroundColor6,
        ),
        child: Column(
          children: [
            // todo header
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.furniture!.name,
                          style: primaryTextStyle.copyWith(
                            fontSize: 33,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 23,
                              color: starColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 23,
                              color: starColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 23,
                              color: starColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 23,
                              color: starColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 23,
                              color: secondaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          isWishlist = !isWishlist;
                        },
                      );

                      if (isWishlist) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: const Text(
                              'Has been added to the Whislist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: const Text(
                              'Has been removed from the Wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      isWishlist
                          ? 'assets/button_wishlist_red.png'
                          : 'assets/button_wishlist_grey.png',
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),

            //todo price
            Container(
              // padding: const EdgeInsets.all(16),
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              decoration: BoxDecoration(
                color: transparentColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    '\$ ${widget.furniture!.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            // todo DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.furniture!.description,
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            //Todo : Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(
                defaultMargin,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/button_chat.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          showSuccesDialog();
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          backgroundColor: secondaryColor,
                        ),
                        child: Text(
                          'Add to Cart',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    // Widget content() {
    //   return Container(
    //     width: double.infinity,
    //     margin: const EdgeInsets.only(
    //       top: 17,
    //     ),
    //     decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.vertical(
    //         top: Radius.circular(
    //           24,
    //         ),
    //       ),
    //       color: backgroundColor6,
    //     ),
    //     child: Column(
    //       children: [
    //         Container(
    //           margin: EdgeInsets.only(
    //             top: defaultMargin,
    //             left: defaultMargin,
    //             right: defaultMargin,
    //           ),
    //           child: Row(children: [
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     furniture!.name,
    //                     style: primaryTextStyle.copyWith(
    //                       fontSize: 18,
    //                       fontWeight: semiBold,
    //                     ),
    //                   ),
    //                   Text(
    //                     'Hiking',
    //                     style: secondaryTextStyle.copyWith(
    //                       fontSize: 12,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ]),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            header(),
            appBar(),
            content(),
          ],
        ),
      ),
    );

  }
}
