import 'package:codwise/constants.dart';
import 'package:codwise/pages/view_utils/screen_size_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayDate extends StatelessWidget {
  const TodayDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMMEEEEd().format(DateTime.now());
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    final double dateTextSize = isSmallScreen ? 16 : 20;
    final double dateIconSize = isSmallScreen ? 20 : 24;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.calendar_today,
                color: AppColors.accentColor,
                size: dateIconSize,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            date,
            style: TextStyle(fontSize: dateTextSize),
          ),
        ],
      ),
    );
  }
}
