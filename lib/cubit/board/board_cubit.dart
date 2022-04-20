import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';

part 'board_state.dart';

class BoardCubitHandle {
  static BoardCubit read(BuildContext context) {
    return context.read<BoardCubit>();
  }

  static BoardCubit watch(BuildContext context) {
    return context.watch<BoardCubit>();
  }
}

class BoardCubit extends Cubit<BoardState> {
  BoardCubit()
      : super(
          BoardState(
            board: [
              TicTac(isSame: false, value: ""),
              TicTac(isSame: false, value: ""),
              TicTac(isSame: false, value: ""),
              TicTac(isSame: false, value: ""),
              TicTac(isSame: false, value: ""),
              TicTac(isSame: false, value: ""),
              TicTac(isSame: false, value: ""),
              TicTac(isSame: false, value: ""),
              TicTac(isSame: false, value: ""),
            ],
            winner: WinnerRoundStatus.none,
            round: 1,
          ),
        );

  void updateBoard({
    required int index,
    required String value,
    required bool isSame,
  }) {
    state.board[index] = TicTac(isSame: isSame, value: value);
    emit(
      BoardState(
        board: state.board,
        winner: state.winner,
        round: state.round,
      ),
    );
  }

  void updateWinner(WinnerRoundStatus value) {
    emit(
      BoardState(
        board: state.board,
        winner: value,
        round: state.round,
      ),
    );
  }

  void updateRound(int value) {
    emit(
      BoardState(
        board: state.board,
        winner: state.winner,
        round: value,
      ),
    );
  }

  void clear(int round) {
    emit(
      BoardState(
        board: [
          TicTac(isSame: false, value: ""),
          TicTac(isSame: false, value: ""),
          TicTac(isSame: false, value: ""),
          TicTac(isSame: false, value: ""),
          TicTac(isSame: false, value: ""),
          TicTac(isSame: false, value: ""),
          TicTac(isSame: false, value: ""),
          TicTac(isSame: false, value: ""),
          TicTac(isSame: false, value: ""),
        ],
        winner: WinnerRoundStatus.none,
        round: round,
      ),
    );
  }
}
