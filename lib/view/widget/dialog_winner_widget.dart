import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tic_tac_toe/cubit/export_cubit.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';

class DialogWinnerWidget extends StatelessWidget {
  const DialogWinnerWidget({
    Key? key,
    required this.board,
    required this.forRound,
  }) : super(key: key);
  final BoardState board;
  final bool forRound;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, ThemeState, bool>(
      selector: (state) => state.isDark,
      builder: (context, isDark) => BlocSelector<BoardCubit, BoardState, int>(
        selector: (state) => state.round,
        builder: (context, round) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo
            Image.asset(
              (board.winner == WinnerRoundStatus.player1)
                  ? (isDark)
                      ? ImageConst.profilePlayer1Light
                      : ImageConst.profilePlayer1Dark
                  : (board.winner == WinnerRoundStatus.none)
                      ? ImageConst.draw
                      : ImageConst.profilePlayer2Red,
              width: 72,
            ),
            const SizedBox(height: 12),
            Text(
              (forRound)
                  ? (board.winner == WinnerRoundStatus.none)
                      ? "Round $round Is Draw"
                      : "Win Round $round"
                  : (board.winner == WinnerRoundStatus.none)
                      ? "This Game Is Draw"
                      : "Win This Game",
              style: FontConfig.style(
                size: 16,
                color:
                    (isDark) ? ColorConfig.lightTheme1 : ColorConfig.darkTheme1,
              ),
            ),
            const SizedBox(height: 36),
            ElevatedButton(
              onPressed: () {
                if (forRound) {
                  Navigator.pop(context);

                  // Update Board State
                  BoardCubitHandle.read(context).clear(board.round + 1);
                  // Update Player State
                  PlayerCubitHandle.read(context).updatePlayer1Turn(true);
                  PlayerCubitHandle.read(context).updatePlayer2Turn(false);

                  return;
                }
                // Navigate
                RouteHandle.toHomePage(context);
              },
              child: Text(
                (forRound) ? "Next" : "Ok",
              ),
              style: ElevatedButton.styleFrom(
                primary: ColorConfig.red,
                onPrimary: ColorConfig.lightTheme1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
