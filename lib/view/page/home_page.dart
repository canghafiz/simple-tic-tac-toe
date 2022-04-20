import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tic_tac_toe/cubit/export_cubit.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';
import 'package:simple_tic_tac_toe/view/export_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocSelector<ThemeCubit, ThemeState, bool>(
        selector: (state) => state.isDark,
        builder: (context, isDark) => Column(
          children: [
            // Logo
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: logoWidget(
                  size: 96,
                  firstDark: ColorConfig.darkTheme1,
                  secondLight: ColorConfig.lightTheme1,
                  second: ColorConfig.red,
                ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(VariableConst.margin),
                child: Column(
                  children: [
                    // Play Game
                    CardContentWidget(
                      onTap: () {
                        // Navigate
                        RouteHandle.toGamePlay(context);
                      },
                      icon: logoWidget(
                        size: 20,
                        firstDark: (isDark)
                            ? ColorConfig.darkTheme1
                            : ColorConfig.lightTheme1,
                        secondLight: (isDark)
                            ? ColorConfig.darkTheme1
                            : ColorConfig.lightTheme1,
                        second: (isDark)
                            ? ColorConfig.darkTheme1
                            : ColorConfig.lightTheme1,
                      ),
                      text: "PLAY GAME",
                      color: (isDark)
                          ? ColorConfig.lightTheme1
                          : ColorConfig.darkTheme1,
                      fontColor: (isDark)
                          ? ColorConfig.darkTheme1
                          : ColorConfig.lightTheme1,
                      fontSize: 22,
                    ),
                    const SizedBox(height: 16),
                    // Theme
                    CardContentWidget(
                      onTap: () {
                        // Show Dialog
                        showDialog(
                          context: context,
                          builder: (context) =>
                              justDialog(const DialogThemeWidget()),
                        );
                      },
                      icon: const Icon(
                        Icons.brightness_high,
                        color: ColorConfig.lightTheme1,
                        size: 36,
                      ),
                      text: "THEME",
                      color: ColorConfig.red,
                      fontColor: ColorConfig.lightTheme1,
                      fontSize: 22,
                    ),
                    const SizedBox(height: 16),
                    // About Developer
                    CardContentWidget(
                      onTap: () {
                        // Navigate
                        RouteHandle.toAboutDeveloper(context);
                      },
                      icon: Icon(
                        Icons.language,
                        color: (isDark)
                            ? ColorConfig.darkTheme1
                            : ColorConfig.lightTheme1,
                        size: 36,
                      ),
                      text: "ABOUT DEVELOPER",
                      color: (isDark)
                          ? ColorConfig.lightTheme1
                          : ColorConfig.darkTheme1,
                      fontColor: (isDark)
                          ? ColorConfig.darkTheme1
                          : ColorConfig.lightTheme1,
                      fontSize: 22,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
