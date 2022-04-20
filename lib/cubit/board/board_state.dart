part of 'board_cubit.dart';

class TicTac {
  final String value;
  bool isSame;

  TicTac({
    required this.isSame,
    required this.value,
  });
}

class BoardState {
  BoardState({
    required this.board,
    required this.winner,
    required this.round,
  });

  List<TicTac> board;
  WinnerRoundStatus winner;
  int round;
}
