import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:simple_tic_tac_toe/utils/const/audio.dart';

class AudioService {
  static final _player = AudioPlayer();

  static Future<bool> _initAudioPlayerFromAsset(String url) async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      debugPrint('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAsset(url);
      return true;
    } catch (e) {
      debugPrint("Error loading audio source: $e");
      return false;
    }
  }

  static void gameDone() {
    _initAudioPlayerFromAsset(AudioConst.gameDone).then(
      (success) {
        if (success) {
          // Play
          _player.play();
        }
      },
    );
  }

  static void playerFirstTurn() {
    _initAudioPlayerFromAsset(AudioConst.playerFirstTurn).then(
      (success) {
        if (success) {
          // Play
          _player.play();
        }
      },
    );
  }

  static void playerSecondTurn() {
    _initAudioPlayerFromAsset(AudioConst.playerSecondTurn).then(
      (success) {
        if (success) {
          // Play
          _player.play();
        }
      },
    );
  }

  static void winner() {
    _initAudioPlayerFromAsset(AudioConst.winner).then(
      (success) {
        if (success) {
          // Play
          _player.play();
        }
      },
    );
  }

  static void dispose() {
    _player.dispose();
  }
}
