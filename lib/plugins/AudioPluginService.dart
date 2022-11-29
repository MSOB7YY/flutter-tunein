import 'dart:convert';
import 'dart:isolate';

import 'package:flutter_tunein_attempt3/services/locator.dart';
import 'package:flutter_tunein_attempt3/services/isolates/musicServiceIsolate.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AudioPluginService {
  final MusicServiceIsolate = locator<musicServiceIsolate>();

  Future sendNewIsolateCommand({required String command, String message = ""}) {
    ReceivePort tempPort = ReceivePort();
    MusicServiceIsolate.sendCrossPluginIsolatesMessage(
        CrossIsolatesMessage<String>(
            sender: tempPort.sendPort, command: command, message: message));
    return tempPort.forEach((data) {
      if (data != "OK") {
        tempPort.close();
        return data;
      }
    });
  }

  Future playSong(String uri,
      {required String album,
      required String title,
      required String artist,
      required String albumArt}) {
    return sendNewIsolateCommand(
        command: "playMusic",
        message: json.encode({
          'uri': uri,
          'album': album,
          'title': title,
          'artist': artist,
          'albumArt': albumArt,
        }));
  }

  Future pauseSong() {
    return sendNewIsolateCommand(command: "pauseMusic");
  }

  Future stopSong() {
    return sendNewIsolateCommand(command: "stopMusic");
  }

  Future seek(double seconds) {
    return sendNewIsolateCommand(
        command: "seekMusic", message: seconds.toString());
  }

  Future useNotification({bool? useNotification, bool? cancelWhenNotPlaying}) {
    return sendNewIsolateCommand(
        command: "useAndroidNotification",
        message: json.encode({
          'useNotification': useNotification,
          'cancelWhenNotPlaying': cancelWhenNotPlaying
        }));
  }

  Future showNotification() {
    return sendNewIsolateCommand(
        command: "showAndroidNotification", message: "");
  }

  Future hideNotification() {
    return sendNewIsolateCommand(
        command: "hideAndroidNotification", message: "");
  }

  Future setItem(
      {required String album,
      required String title,
      required String artist,
      required String albumArt,
      required String uri}) {
    return sendNewIsolateCommand(
        command: "setItem",
        message: json.encode({
          'uri': uri,
          'album': album,
          'title': title,
          'artist': artist,
          'albumArt': albumArt,
        }));
  }

  BehaviorSubject<Duration> subscribeToPositionChanges() {
    ReceivePort tempPort = ReceivePort();
    MusicServiceIsolate.sendCrossPluginIsolatesMessage(
        CrossIsolatesMessage<String>(
            sender: tempPort.sendPort,
            command: "subscribeToPosition",
            message: ""));

    BehaviorSubject<Duration> returnedSubject =
        new BehaviorSubject<Duration>.seeded(Duration(milliseconds: 0));
    tempPort.forEach((data) {
      if (data != null && data != "OK") {
        returnedSubject.add(data);
      }
    });

    return returnedSubject;
  }

  BehaviorSubject<AudioPlayerState> subscribeToStateChanges() {
    ReceivePort tempPort = ReceivePort();
    MusicServiceIsolate.sendCrossPluginIsolatesMessage(
        CrossIsolatesMessage<String>(
            sender: tempPort.sendPort,
            command: "subscribeToState",
            message: ""));

    BehaviorSubject<AudioPlayerState> returnedSubject =
        new BehaviorSubject<AudioPlayerState>.seeded(null);
    tempPort.forEach((data) {
      if (data != null && data != "OK") {
        returnedSubject.add(_deserializeAudioPlayerStateEnum(data));
      }
    });

    return returnedSubject;
  }

  BehaviorSubject<PlayBackKeys> subscribeToPlaybackKeys() {
    ReceivePort tempPort = ReceivePort();
    MusicServiceIsolate.sendCrossPluginIsolatesMessage(
        CrossIsolatesMessage<String>(
            sender: tempPort.sendPort,
            command: "subscribeToplaybackKeys",
            message: ""));

    BehaviorSubject<PlayBackKeys> returnedSubject =
        new BehaviorSubject<PlayBackKeys>.seeded(null);
    tempPort.forEach((data) {
      if (data != null && data != "OK") {
        returnedSubject.add(_deserializePlaybackKeysEnum(data));
      }
    });

    return returnedSubject;
  }

  AudioPlayerState _deserializeAudioPlayerStateEnum(String entry) {
    List<String> enumStringList = entry.split(".");
    switch (enumStringList[1]) {
      case "COMPLETED":
        {
          return AudioPlayerState.COMPLETED;
        }
      case "PLAYING":
        {
          return AudioPlayerState.PLAYING;
        }
      case "PAUSED":
        {
          return AudioPlayerState.PAUSED;
        }
      case "STOPPED":
        {
          return AudioPlayerState.STOPPED;
        }
    }
    throw Exception;
  }

  PlayBackKeys _deserializePlaybackKeysEnum(String entry) {
    List<String> enumStringList = entry.split(".");
    switch (enumStringList[1]) {
      case "PAUSE_KEY":
        {
          return PlayBackKeys.PAUSE_KEY;
        }
      case "PLAY_KEY":
        {
          return PlayBackKeys.PLAY_KEY;
        }
      case "NEXT_KEY":
        {
          return PlayBackKeys.NEXT_KEY;
        }
      case "REWIND_KEY":
        {
          return PlayBackKeys.REWIND_KEY;
        }
      case "STOP_KEY":
        {
          return PlayBackKeys.STOP_KEY;
        }
      case "SEEK_KEY":
        {
          return PlayBackKeys.SEEK_KEY;
        }
      case "FAST_FORWARD_KEY":
        {
          return PlayBackKeys.FAST_FORWARD_KEY;
        }
    }
    throw Exception;
  }
}
