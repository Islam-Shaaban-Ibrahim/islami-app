import 'package:flutter/material.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/providers/settings_provider/settings_provider_calss.dart';
import 'package:provider/provider.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Provider.of<SettingProvider>(context).isDark()
            ? MyAppTheme.white
            : MyAppTheme.primaryLightColor,
      ),
    );
  }
}
