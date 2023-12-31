import 'package:always_listening/common/style_manager.dart';
import 'package:always_listening/presentation_layer/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/color_manager.dart';
import '../../../common/strings_manager.dart';
import '../../../di/di.dart';
import '../widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeBloc _homeBloc = instance<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => _homeBloc..add(TriggerListenEvent()),
        child: BlocListener<HomeBloc, HomeUpdateState>(
          listener: (context, state) {
            if (state.isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: ColorManager.feedBackError,
                  content: Text(state.errorMessage),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          child: BlocBuilder<HomeBloc, HomeUpdateState>(
            builder: (context, state) {
              return Scaffold(
                appBar: buildAppBar(context),
                body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 19.w,
                    vertical: 22.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsManager.appTitle,
                        style: StyleManager.appTitleStyle(),
                      ),
                      SizedBox(height: 13.h),
                      Container(
                        width: 302.h,
                        margin: EdgeInsets.only(right: 18.h),
                        child: Text(
                          StringsManager.paragraph,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: StyleManager.subHeadersStyle(),
                        ),
                      ),
                      SizedBox(height: 52.h),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  StringsManager.api_counter_prompt,
                                  style: StyleManager.subHeadersStyle(),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  state.counter.toString(),
                                  style: StyleManager.counterStyle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Text(
                          StringsManager.stt_header,
                          style: StyleManager.subHeadersStyle(),
                        ),
                      ),
                      SizedBox(height: 2.h),

                      SizedBox(

                        height: 280.h,
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              Container(
                                margin: EdgeInsets.only(
                                  left: 1.w,
                                  right: 11.w,
                                ),
                                child: Text(
                                  state.transcripts[index],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: StyleManager.promptsStyle(),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return
                                Divider(
                                thickness: 2,
                                color: ColorManager.textColor,
                              );
                            },
                            itemCount: state.transcripts.length
                            ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
}
