import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tic_tac_toe/cubit/export_cubit.dart';
import 'package:simple_tic_tac_toe/services/export_services.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';

class DialogThemeWidget extends StatelessWidget {
  const DialogThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, ThemeState, bool>(
      selector: (state) => state.isDark,
      builder: (context, isDark) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Light
          RadioListTile<bool>(
            activeColor:
                (isDark) ? ColorConfig.lightTheme1 : ColorConfig.darkTheme1,
            title: Text(
              "Light",
              style: FontConfig.style(
                size: 14,
                color:
                    (isDark) ? ColorConfig.lightTheme1 : ColorConfig.darkTheme1,
              ),
            ),
            value: false,
            groupValue: isDark,
            onChanged: (value) {
              //  Update Local Memory
              SharedPreferencesService.setTheme(
                value ?? false,
              );

              Navigator.pop(context);
            },
          ),
          // Dark
          RadioListTile<bool>(
            activeColor:
                (isDark) ? ColorConfig.lightTheme1 : ColorConfig.darkTheme1,
            title: Text(
              "Dark",
              style: FontConfig.style(
                size: 14,
                color:
                    (isDark) ? ColorConfig.lightTheme1 : ColorConfig.darkTheme1,
              ),
            ),
            value: true,
            groupValue: isDark,
            onChanged: (value) {
              //  Update Local Memory
              SharedPreferencesService.setTheme(
                value ?? true,
              );

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
