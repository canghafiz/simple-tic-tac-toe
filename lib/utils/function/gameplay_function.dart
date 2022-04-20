import 'package:flutter/material.dart';
import 'package:simple_tic_tac_toe/cubit/export_cubit.dart';
import 'package:simple_tic_tac_toe/services/export_services.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';
import 'package:simple_tic_tac_toe/view/export_view.dart';

class GamePlayFunction {
  static void onTap({
    required bool player1Turn,
    required BuildContext context,
    required int index,
    required BoardState boardState,
  }) {
    BoardCubitHandle.read(context).updateBoard(
      index: index,
      value: (player1Turn) ? "X" : "O",
      isSame: false,
    );

    // Check First Row
    if (boardState.board[0].value == boardState.board[1].value &&
        boardState.board[1].value == boardState.board[2].value &&
        boardState.board[0].value != '') {
      // Update Player State
      if (boardState.board[index].value == "X") {
        PlayerCubitHandle.read(context).updatePlayer1Score();
      } else {
        PlayerCubitHandle.read(context).updatePlayer2Score();
      }
      // Update Board State
      BoardCubitHandle.read(context).updateWinner(
        (boardState.board[index].value == "X")
            ? WinnerRoundStatus.player1
            : WinnerRoundStatus.player2,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 0,
        value: boardState.board[0].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 1,
        value: boardState.board[1].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 2,
        value: boardState.board[2].value,
        isSame: true,
      );

      Future.delayed(const Duration(milliseconds: 300)).then(
        (_) {
          // Check Winner
          checkGameWinner(
            context: context,
            boardState: BoardCubitHandle.read(context).state,
          );
        },
      );

      return;
    }

    // Check Second Row
    if (boardState.board[3].value == boardState.board[4].value &&
        boardState.board[4].value == boardState.board[5].value &&
        boardState.board[3].value != '') {
      // Update Player State
      if (boardState.board[index].value == "X") {
        PlayerCubitHandle.read(context).updatePlayer1Score();
      } else {
        PlayerCubitHandle.read(context).updatePlayer2Score();
      }
      // Update Board State
      BoardCubitHandle.read(context).updateWinner(
        (boardState.board[index].value == "X")
            ? WinnerRoundStatus.player1
            : WinnerRoundStatus.player2,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 3,
        value: boardState.board[3].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 4,
        value: boardState.board[4].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 5,
        value: boardState.board[5].value,
        isSame: true,
      );

      Future.delayed(const Duration(milliseconds: 300)).then(
        (_) {
          // Check Winner
          checkGameWinner(
            context: context,
            boardState: BoardCubitHandle.read(context).state,
          );
        },
      );

      return;
    }

    // Check Third Row
    if (boardState.board[6].value == boardState.board[7].value &&
        boardState.board[7].value == boardState.board[8].value &&
        boardState.board[6].value != '') {
      // Update Player State
      if (boardState.board[index].value == "X") {
        PlayerCubitHandle.read(context).updatePlayer1Score();
      } else {
        PlayerCubitHandle.read(context).updatePlayer2Score();
      }
      // Update Board State
      BoardCubitHandle.read(context).updateWinner(
        (boardState.board[index].value == "X")
            ? WinnerRoundStatus.player1
            : WinnerRoundStatus.player2,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 6,
        value: boardState.board[6].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 7,
        value: boardState.board[7].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 8,
        value: boardState.board[8].value,
        isSame: true,
      );

      Future.delayed(const Duration(milliseconds: 300)).then(
        (_) {
          // Check Winner
          checkGameWinner(
            context: context,
            boardState: BoardCubitHandle.read(context).state,
          );
        },
      );

      return;
    }

    // Check First Column
    if (boardState.board[0].value == boardState.board[3].value &&
        boardState.board[3].value == boardState.board[6].value &&
        boardState.board[0].value != '') {
      // Update Player State
      if (boardState.board[index].value == "X") {
        PlayerCubitHandle.read(context).updatePlayer1Score();
      } else {
        PlayerCubitHandle.read(context).updatePlayer2Score();
      }
      // Update Board State
      BoardCubitHandle.read(context).updateWinner(
        (boardState.board[index].value == "X")
            ? WinnerRoundStatus.player1
            : WinnerRoundStatus.player2,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 0,
        value: boardState.board[0].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 3,
        value: boardState.board[3].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 6,
        value: boardState.board[6].value,
        isSame: true,
      );

      Future.delayed(const Duration(milliseconds: 300)).then(
        (_) {
          // Check Winner
          checkGameWinner(
            context: context,
            boardState: BoardCubitHandle.read(context).state,
          );
        },
      );

      return;
    }

    // Check Second Column
    if (boardState.board[1].value == boardState.board[4].value &&
        boardState.board[4].value == boardState.board[7].value &&
        boardState.board[1].value != '') {
      // Update Player State
      if (boardState.board[index].value == "X") {
        PlayerCubitHandle.read(context).updatePlayer1Score();
      } else {
        PlayerCubitHandle.read(context).updatePlayer2Score();
      }
      // Update Board State
      BoardCubitHandle.read(context).updateWinner(
        (boardState.board[index].value == "X")
            ? WinnerRoundStatus.player1
            : WinnerRoundStatus.player2,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 1,
        value: boardState.board[1].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 4,
        value: boardState.board[4].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 7,
        value: boardState.board[7].value,
        isSame: true,
      );

      Future.delayed(const Duration(milliseconds: 300)).then(
        (_) {
          // Check Winner
          checkGameWinner(
            context: context,
            boardState: BoardCubitHandle.read(context).state,
          );
        },
      );

      return;
    }

    // Check Third Column
    if (boardState.board[2].value == boardState.board[5].value &&
        boardState.board[5].value == boardState.board[8].value &&
        boardState.board[2].value != '') {
      // Update Player State
      if (boardState.board[index].value == "X") {
        PlayerCubitHandle.read(context).updatePlayer1Score();
      } else {
        PlayerCubitHandle.read(context).updatePlayer2Score();
      }
      // Update Board State
      BoardCubitHandle.read(context).updateWinner(
        (boardState.board[index].value == "X")
            ? WinnerRoundStatus.player1
            : WinnerRoundStatus.player2,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 2,
        value: boardState.board[2].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 5,
        value: boardState.board[5].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 8,
        value: boardState.board[8].value,
        isSame: true,
      );

      Future.delayed(const Duration(milliseconds: 300)).then(
        (_) {
          // Check Winner
          checkGameWinner(
            context: context,
            boardState: BoardCubitHandle.read(context).state,
          );
        },
      );

      return;
    }

    // Check Diagonal Left
    if (boardState.board[0].value == boardState.board[4].value &&
        boardState.board[4].value == boardState.board[8].value &&
        boardState.board[0].value != '') {
      // Update Player State
      if (boardState.board[index].value == "X") {
        PlayerCubitHandle.read(context).updatePlayer1Score();
      } else {
        PlayerCubitHandle.read(context).updatePlayer2Score();
      }
      // Update Board State
      BoardCubitHandle.read(context).updateWinner(
        (boardState.board[index].value == "X")
            ? WinnerRoundStatus.player1
            : WinnerRoundStatus.player2,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 0,
        value: boardState.board[0].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 4,
        value: boardState.board[4].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 8,
        value: boardState.board[8].value,
        isSame: true,
      );

      Future.delayed(const Duration(milliseconds: 300)).then(
        (_) {
          // Check Winner
          checkGameWinner(
            context: context,
            boardState: BoardCubitHandle.read(context).state,
          );
        },
      );

      return;
    }

    // Check Diagonal Right
    if (boardState.board[2].value == boardState.board[4].value &&
        boardState.board[4].value == boardState.board[6].value &&
        boardState.board[2].value != '') {
      // Update Player State
      if (boardState.board[index].value == "X") {
        PlayerCubitHandle.read(context).updatePlayer1Score();
      } else {
        PlayerCubitHandle.read(context).updatePlayer2Score();
      }
      // Update Board State
      BoardCubitHandle.read(context).updateWinner(
        (boardState.board[index].value == "X")
            ? WinnerRoundStatus.player1
            : WinnerRoundStatus.player2,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 2,
        value: boardState.board[2].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 4,
        value: boardState.board[4].value,
        isSame: true,
      );

      BoardCubitHandle.read(context).updateBoard(
        index: 6,
        value: boardState.board[6].value,
        isSame: true,
      );

      Future.delayed(const Duration(milliseconds: 300)).then(
        (_) {
          // Check Winner
          checkGameWinner(
            context: context,
            boardState: BoardCubitHandle.read(context).state,
          );
        },
      );

      return;
    }

    // Check Draw
    if (boardState.board.where((ticTac) => ticTac.value == "").isEmpty &&
        boardState.winner == WinnerRoundStatus.none) {
      Future.delayed(const Duration(milliseconds: 300)).then(
        (_) {
          // Check Winner
          checkGameWinner(
            context: context,
            boardState: BoardCubitHandle.read(context).state,
          );
        },
      );
    }
  }

  static void checkGameWinner({
    required BuildContext context,
    required BoardState boardState,
  }) {
    PlayerState state = PlayerCubitHandle.read(context).state;

    if (boardState.round == 5) {
      if (state.player1Score > state.player2Score) {
        // Update Board State
        BoardCubitHandle.read(context).updateWinner(
          WinnerRoundStatus.player1,
        );

        // Play Sound
        AudioService.winner();

        // Show Dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => justDialog(
            DialogWinnerWidget(
              board: BoardCubitHandle.read(context).state,
              forRound: false,
            ),
          ),
        );
        return;
      }

      if (state.player1Score < state.player2Score) {
        // Update Board State
        BoardCubitHandle.read(context).updateWinner(
          WinnerRoundStatus.player2,
        );

        // Play Sound
        AudioService.winner();

        // Show Dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => justDialog(
            DialogWinnerWidget(
              board: BoardCubitHandle.read(context).state,
              forRound: false,
            ),
          ),
        );
        return;
      }

      if (state.player1Score == state.player2Score) {
        // Update Board State
        BoardCubitHandle.read(context).updateWinner(
          WinnerRoundStatus.none,
        );

        // Play Sound
        AudioService.winner();

        // Show Dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => justDialog(
            DialogWinnerWidget(
              board: BoardCubitHandle.read(context).state,
              forRound: false,
            ),
          ),
        );
        return;
      }
    } else {
      // Variable Const
      int scorePlayer1 = 5 - state.player1Score;
      int scorePlayer2 = 5 - state.player2Score;

      if (scorePlayer1 == 2) {
        // Update Board State
        BoardCubitHandle.read(context).updateWinner(
          WinnerRoundStatus.player1,
        );

        // Play Sound
        AudioService.winner();

        // Show Dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => justDialog(
            DialogWinnerWidget(
              board: BoardCubitHandle.read(context).state,
              forRound: false,
            ),
          ),
        );
        return;
      }
      if (scorePlayer2 == 2) {
        // Update Board State
        BoardCubitHandle.read(context).updateWinner(
          WinnerRoundStatus.player2,
        );

        // Play Sound
        AudioService.winner();

        // Show Dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => justDialog(
            DialogWinnerWidget(
              board: BoardCubitHandle.read(context).state,
              forRound: false,
            ),
          ),
        );
        return;
      } else {
        // For Sound
        if (boardState.winner == WinnerRoundStatus.none) {
          AudioService.gameDone();
        }

        // Show Dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => justDialog(
            DialogWinnerWidget(
              board: BoardCubitHandle.read(context).state,
              forRound: true,
            ),
          ),
        );
        return;
      }
    }
  }

  static void updatePlayerTurn({
    required BuildContext context,
    required bool player1Turn,
  }) {
    // Update State
    PlayerCubitHandle.read(context)
        .updatePlayer1Turn((player1Turn) ? false : true);
    PlayerCubitHandle.read(context)
        .updatePlayer2Turn((player1Turn) ? true : false);
  }

  static void playerTurnSound(bool player1Turn) {
    if (player1Turn) {
      AudioService.playerFirstTurn();
      return;
    }
    AudioService.playerSecondTurn();
  }

  static void clear(BuildContext context) {
    // Update Board State
    BoardCubitHandle.read(context).clear(1);
    // Update Player State
    PlayerCubitHandle.read(context).clear();
  }
}
