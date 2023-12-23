import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

class StyleManager{
  static TextStyle appBarTextStyle({Color? preferredColor}) {
    return GoogleFonts.roboto(
      color: preferredColor ?? ColorManager.textColor,
      fontWeight: FontWeight.w500,
      fontSize: 20.sp
    );
  }  static TextStyle appTitleStyle({Color? preferredColor}) {
    return GoogleFonts.roboto(
      color: preferredColor ?? ColorManager.textColor,
      fontWeight: FontWeight.w500,
      fontSize: 20.sp
    );
  }  static TextStyle subHeadersStyle({Color? preferredColor}) {
    return GoogleFonts.roboto(
      color:preferredColor ?? ColorManager.textColor,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp
    );
  }

  static TextStyle promptsStyle({Color? preferredColor}) {
    return GoogleFonts.roboto(
      color: preferredColor ?? ColorManager.textColor,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp
    );
  }
  static TextStyle counterStyle({Color? preferredColor}) {
    return GoogleFonts.roboto(
      color: preferredColor ?? ColorManager.textColor,
      fontWeight: FontWeight.w500,
      fontSize: 40.sp
    );
  }
}