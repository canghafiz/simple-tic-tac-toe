import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tic_tac_toe/cubit/export_cubit.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';
import 'dart:math' as math;

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    Key? key,
    required this.url,
    required this.isPlayer1,
    required this.isDark,
  }) : super(key: key);
  final String url;
  final bool isPlayer1, isDark;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PlayerCubit, PlayerState, PlayerState>(
      selector: (state) => state,
      builder: (context, state) => Column(
        crossAxisAlignment:
            (isPlayer1) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          // Aavatar | Score
          SizedBox(
            height: MediaQuery.of(context).size.height * 13 / 100,
            child: Stack(
              children: [
                // Image
                Align(
                  alignment: (isPlayer1)
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight,
                  child: Image.asset(url),
                ),
                // Score
                Align(
                  alignment: (isPlayer1)
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConfig.lightTheme1,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Text(
                      (isPlayer1)
                          ? state.player1Score.toString()
                          : state.player2Score.toString(),
                      style: FontConfig.style(
                        size: 24,
                        color: ColorConfig.darkTheme1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Turn
          Row(
            children: [
              SizedBox(width: (isPlayer1) ? 28 : 0),
              (isPlayer1) ? const SizedBox() : const Spacer(),
              (isPlayer1)
                  ? (state.player1Turn)
                      ? Transform.rotate(
                          angle: 90 * math.pi / 180,
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 36,
                            color: (isDark)
                                ? ColorConfig.lightTheme1
                                : ColorConfig.darkTheme1,
                          ),
                        )
                      : const SizedBox(height: 36)
                  : (state.player2Turn)
                      ? Transform.rotate(
                          angle: 90 * math.pi / 180,
                          child: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 36,
                            color: ColorConfig.red,
                          ),
                        )
                      : const SizedBox(height: 36),
              SizedBox(width: (isPlayer1) ? 0 : 28),
            ],
          ),
        ],
      ),
    );
  }
}
