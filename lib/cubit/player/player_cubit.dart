import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'player_state.dart';

class PlayerCubitHandle {
  static PlayerCubit read(BuildContext context) {
    return context.read<PlayerCubit>();
  }

  static PlayerCubit watch(BuildContext context) {
    return context.watch<PlayerCubit>();
  }
}

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit()
      : super(
          PlayerState(
            player1Score: 0,
            player2Score: 0,
            player1Turn: true,
            player2Turn: false,
          ),
        );

  void updatePlayer1Score() {
    emit(
      PlayerState(
        player1Score: state.player1Score + 1,
        player2Score: state.player2Score,
        player1Turn: state.player1Turn,
        player2Turn: state.player2Turn,
      ),
    );
  }

  void updatePlayer2Score() {
    emit(
      PlayerState(
        player1Score: state.player1Score,
        player2Score: state.player2Score + 1,
        player1Turn: state.player1Turn,
        player2Turn: state.player2Turn,
      ),
    );
  }

  void updatePlayer1Turn(bool value) {
    emit(
      PlayerState(
        player1Score: state.player1Score,
        player2Score: state.player2Score,
        player1Turn: value,
        player2Turn: state.player2Turn,
      ),
    );
  }

  void updatePlayer2Turn(bool value) {
    emit(
      PlayerState(
        player1Score: state.player1Score,
        player2Score: state.player2Score,
        player1Turn: state.player1Turn,
        player2Turn: value,
      ),
    );
  }

  void clear() {
    emit(
      PlayerState(
        player1Score: 0,
        player2Score: 0,
        player1Turn: true,
        player2Turn: false,
      ),
    );
  }
}
