import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tic_tac_toe/cubit/export_cubit.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';

class DialogExitGamePlayWidget extends StatelessWidget {
  const DialogExitGamePlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, ThemeState, bool>(
      selector: (state) => state.isDark,
      builder: (context, isDark) => alertDialog(
        text: Text(
          "Are you sure want end this game ?",
          style: FontConfig.style(
            size: 16,
            color: (isDark) ? ColorConfig.lightTheme1 : ColorConfig.darkTheme1,
          ),
        ),
        actions: [
          // Yes
          ElevatedButton(
            onPressed: () {
              // Navigate
              RouteHandle.toHomePage(context);
            },
            child: const Text("Yes"),
            style: ElevatedButton.styleFrom(
              primary: ColorConfig.red,
              onPrimary: ColorConfig.lightTheme1,
            ),
          ),
          // Cancel
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: FontConfig.style(
                size: 16,
                color: ColorConfig.red,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: ColorConfig.red),
            ),
          )
        ],
      ),
    );
  }
}
