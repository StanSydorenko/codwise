import 'package:codwise/app/router.dart';
import 'package:codwise/constants.dart';
import 'package:codwise/pages/view_utils/screen_size_util.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    final double horizontalPadding = isSmallScreen ? 16 : 160;
    return Container(
      height: preferredSize.height,
      decoration: _appBarDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: horizontalPadding),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _logo(context),
                  _divider(visible: !isSmallScreen),
                  _slogan(visible: !isSmallScreen),
                ],
              ),
              _about(context),
            ]),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return InkWell(
      onTap: () => _onHomeClicked(context),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 24,
            fontFamily: AppFonts.playfairDisplay,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _divider({required bool visible}) {
    return Visibility(
      visible: visible,
      child: const SizedBox(
        width: 2,
        height: 24,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.appBarDividerGray,
          ),
        ),
      ),
    );
  }

  Widget _slogan({required bool visible}) {
    return Visibility(
      visible: visible,
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
        child: Text(
          AppStrings.appSlogan,
          style: TextStyle(
            color: AppColors.textGray,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _about(BuildContext context) {
    return InkWell(
      onTap: () => _onAboutClicked(context),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Text(
          "About",
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  _onHomeClicked(BuildContext context) {
    RegisteredRoutes.home.navigate(context);
  }

  _onAboutClicked(BuildContext context) {
    RegisteredRoutes.about.navigate(context);
  }

  Decoration _appBarDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 4,
          spreadRadius: 2,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
