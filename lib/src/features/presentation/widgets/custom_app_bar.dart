import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:country_list_app/src/features/presentation/widgets/app_logo.dart';
import 'package:country_list_app/src/theme/toggle_theme_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.3, // Optional: Customize the height
        flexibleSpace: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.p20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppLogo(),
              ToggleThemeIcon(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>  const Size.fromHeight(Sizes.p48);
}
