import 'package:always_listening/common/assets_manager.dart';
import 'package:always_listening/common/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/strings_manager.dart';
import 'app_bar_leading_icon_button.dart';
import 'app_bar_trailing_image.dart';
import 'custom_app_bar.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 60.w,
    leading: AppbarLeadingIconbutton(
      imagePath: AssetsManager.profilePlaceHolder,
      margin: EdgeInsets.only(
        left: 20.w,
        top: 8.h,
        bottom: 8.h,
      ),
    ),
    title: Padding(
      padding: const EdgeInsets.only(left: 9.0),
      child: Text(
        StringsManager.appBarText,
       style: StyleManager.appBarTextStyle(),
      ),
    ),
    actions: [
      AppbarTrailingImage(
        imagePath: AssetsManager.trailingForHomeAppBar,
        margin: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 17.h),
      ),
    ],
  );
}