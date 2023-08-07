import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 20.0;
double defaultPadding = 20.0;

// 0x = untuk mengindikasikan kita akan menggunakan kode HEX
// ff = opacity 100%
Color primaryColor = const Color(0xff000000);
Color secondaryColor = const Color(0xff9A9390);
Color starColor = const Color(0xffEEA427);
Color alertColor = const Color(0xffED6363);
Color priceColor = const Color(0xffBBBBBB);
Color backgroundColor1 = const Color(0xff1F1D2B);
Color backgroundColor2 = const Color(0xff2B2937);
Color backgroundColor3 = const Color(0xff242231);
Color backgroundColor4 = const Color(0xff252836);
Color backgroundColor5 = const Color(0xff2B2844);
Color backgroundColor6 = const Color(0xffFFFFFF);
Color primaryTextColor = const Color(0xff000000);
Color secondaryTextColor = const Color(0xffffffff);
Color subtitleColor = const Color(0xff504F5E);
Color transparentColor = Colors.transparent;
Color blackColor = const Color(0xff2E2E2E);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: backgroundColor6,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: subtitleColor,
);

TextStyle priceTextStyle = GoogleFonts.poppins(
  color: secondaryColor,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle alertTextStyle = GoogleFonts.poppins(
  color: alertColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
