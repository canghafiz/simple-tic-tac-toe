import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tic_tac_toe/cubit/export_cubit.dart';
import 'package:simple_tic_tac_toe/services/audio/audio_service.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';
import 'package:simple_tic_tac_toe/view/export_view.dart';

class GamePlayPage extends StatefulWidget {
  const GamePlayPage({Key? key}) : super(key: key);

  @override
  State<GamePlayPage> createState() => _GamePlayPageState();
}

class _GamePlayPageState extends State<GamePlayPage> {
  @override
  void initState() {
    super.initState();
    BoardCubitHandle.read(context).stream.listen(
      (state) {
        if (state.board.where((ticTac) => ticTac.isSame).isNotEmpty) {
          // Play Sound
          AudioService.winner();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GamePlayFunction.clear(context);
    return WillPopScope(
      onWillPop: () async {
        // Show Dialog
        showDialog(
          context: context,
          builder: (context) => const DialogExitGamePlayWidget(),
        );
        return false;
      },
      child: Scaffold(
        body: BlocSelector<ThemeCubit, ThemeState, bool>(
          selector: (state) => state.isDark,
          builder: (context, isDark) => Column(
            children: [
              // Round
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: VariableConst.margin,
                  vertical: 14,
                ),
                color: (!isDark)
                    ? ColorConfig.darkTheme1
                    : ColorConfig.lightTheme1,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Center(
                      child: BlocSelector<BoardCubit, BoardState, int>(
                        selector: (state) => state.round,
                        builder: (context, round) => Text(
                          (round == 5) ? "Last Round" : "Round $round",
                          style: FontConfig.style(
                            size: 30,
                            color: (isDark)
                                ? ColorConfig.darkTheme1
                                : ColorConfig.lightTheme1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Score
              Padding(
                padding: const EdgeInsets.all(VariableConst.margin),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PlayerWidget(
                        url: (isDark)
                            ? ImageConst.profilePlayer1Light
                            : ImageConst.profilePlayer1Dark,
                        isPlayer1: true,
                        isDark: isDark,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Image.asset(
                        ImageConst.versus,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 3,
                      child: PlayerWidget(
                        url: ImageConst.profilePlayer2Red,
                        isPlayer1: false,
                        isDark: isDark,
                      ),
                    ),
                  ],
                ),
              ),
              // Board
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(VariableConst.margin),
                  child: BlocSelector<BoardCubit, BoardState, BoardState>(
                    selector: (state) => state,
                    builder: (context, state) => GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      children: List.generate(
                        state.board.length,
                        (index) {
                          // Object
                          final TicTac ticTac = state.board[index];

                          return BlocSelector<PlayerCubit, PlayerState, bool>(
                            selector: (state) => state.player1Turn,
                            builder: (context, player1Turn) => GestureDetector(
                              onTap: () {
                                if (ticTac.value == "") {
                                  GamePlayFunction.onTap(
                                    boardState: state,
                                    player1Turn: player1Turn,
                                    context: context,
                                    index: index,
                                  );
                                  if (state.board
                                      .where((ticTac) => ticTac.value == "")
                                      .isEmpty) {
                                    GamePlayFunction.updatePlayerTurn(
                                      context: context,
                                      player1Turn: false,
                                    );
                                  } else {
                                    GamePlayFunction.updatePlayerTurn(
                                      context: context,
                                      player1Turn: player1Turn,
                                    );
                                  }
                                  GamePlayFunction.playerTurnSound(
                                    player1Turn,
                                  );

                                  return;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: (isDark)
                                      ? ColorConfig.lightTheme1
                                      : ColorConfig.darkTheme1,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                ),
                                child: Center(
                                  child: Text(
                                    ticTac.value,
                                    style: FontConfig.style(
                                        size:
                                            MediaQuery.of(context).size.height *
                                                7 /
                                                100,
                                        color: (ticTac.isSame)
                                            // When Same
                                            ? (isDark)
                                                ? (ticTac.value ==
                                                        VariableConst
                                                            .player1Symbol)
                                                    ? ColorConfig.darkTheme1
                                                        .withOpacity(0.5)
                                                    : ColorConfig.red
                                                        .withOpacity(0.5)
                                                : (ticTac.value ==
                                                        VariableConst
                                                            .player1Symbol)
                                                    ? ColorConfig.lightTheme1
                                                        .withOpacity(0.5)
                                                    : ColorConfig.red
                                                        .withOpacity(0.5)
                                            :
                                            // When Not Same
                                            (isDark)
                                                ? (ticTac.value ==
                                                        VariableConst
                                                            .player1Symbol)
                                                    ? ColorConfig.darkTheme1
                                                    : ColorConfig.red
                                                : (ticTac.value ==
                                                        VariableConst
                                                            .player1Symbol)
                                                    ? ColorConfig.lightTheme1
                                                    : ColorConfig.red),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
