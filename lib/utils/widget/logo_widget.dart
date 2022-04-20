import 'package:flutter/material.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';

Widget logoWidget({
  required double size,
  required Color firstDark,
  required Color secondLight,
  required Color second,
}) {
  return ThemeWidget(
      light: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: "X",
              style: FontConfig.style(
                size: size,
                color: firstDark,
              ),
              children: [
                TextSpan(
                  text: "O",
                  style: FontConfig.style(
                    size: size,
                    color: second,
                  ),
                ),
              ],
            ),
          ),
          Baseline(
            baseline: (size * 58 / 100),
            baselineType: TextBaseline.alphabetic,
            child: RichText(
              text: TextSpan(
                text: "O",
                style: FontConfig.style(
                  size: size,
                  color: second,
                ),
                children: [
                  TextSpan(
                    text: "X",
                    style: FontConfig.style(
                      size: size,
                      color: firstDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      dark: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: "X",
              style: FontConfig.style(
                size: size,
                color: secondLight,
              ),
              children: [
                TextSpan(
                  text: "O",
                  style: FontConfig.style(
                    size: size,
                    color: second,
                  ),
                ),
              ],
            ),
          ),
          Baseline(
            baseline: (size * 58 / 100),
            baselineType: TextBaseline.alphabetic,
            child: RichText(
              text: TextSpan(
                text: "O",
                style: FontConfig.style(
                  size: size,
                  color: second,
                ),
                children: [
                  TextSpan(
                    text: "X",
                    style: FontConfig.style(
                      size: size,
                      color: secondLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ));
}
