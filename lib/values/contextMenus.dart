import 'package:flutter_tunein_attempt3/models/ContextMenuOption.dart';
import 'package:flutter/material.dart';

///The context menu for the regular song cards found on tracks page, album page and queue
final songCardContextMenulist = [
  ContextMenuOptions(
    id: 8,
    title: "Album",
    icon: Icons.play_circle_outline,
    function: () {},
  ),
  ContextMenuOptions(
      id: 9, title: "Artist", icon: Icons.play_circle_outline, function: () {}),
  ContextMenuOptions(
      id: 1,
      title: "Play one",
      icon: Icons.play_circle_outline,
      function: () {}),
  ContextMenuOptions(
      id: 4, title: "Play Album", icon: Icons.album, function: () {}),
  ContextMenuOptions(
      id: 2, title: "Shuffle next queue", icon: Icons.shuffle, function: () {}),
  ContextMenuOptions(
      id: 3, title: "Shuffle next album", icon: Icons.shuffle, function: () {}),
  ContextMenuOptions(
      id: 5, title: "Cast", icon: Icons.cast_connected, function: () {}),
  ContextMenuOptions(
      id: 6, title: "Cast to new Device", icon: Icons.cast, function: () {}),
  ContextMenuOptions(
      id: 7,
      title: "Song information",
      icon: Icons.info_outline,
      function: () {}),
  ContextMenuOptions(
      id: 10, title: "Edit Tags", icon: Icons.edit, function: () {}),
];

///The context menu for the regular artist card found in the artists page
final artistCardContextMenulist = [
  ContextMenuOptions(
      id: 1,
      title: "Play All",
      icon: Icons.play_circle_outline,
      function: () {}),
  ContextMenuOptions(
      id: 2, title: "Shuffle", icon: Icons.shuffle, function: () {}),
];

///The context menu for the regular Album card found in the albums page
final albumCardContextMenulist = [
  ContextMenuOptions(
      id: 1,
      title: "Play Album",
      icon: Icons.play_circle_outline,
      function: () {}),
  ContextMenuOptions(
      id: 2, title: "Shuffle", icon: Icons.shuffle, function: () {}),
];

///The context menu for the regular playlist card foudn in the playlists page
final playlistCardContextMenulist = [
  ContextMenuOptions(
      id: 1, title: "Add new Songs", icon: Icons.add, function: () {}),
  ContextMenuOptions(
      id: 2,
      title: "Play All",
      icon: Icons.play_circle_outline,
      function: () {}),
  ContextMenuOptions(
      id: 3, title: "Shuffle", icon: Icons.shuffle, function: () {}),
  ContextMenuOptions(
      id: 4,
      title: "Edit playlist",
      icon: Icons.edit_attributes,
      function: () {}),
  ContextMenuOptions(
      id: 5, title: "Delete playlist", icon: Icons.delete, function: () {}),
];

///The context menu for the song cards found on a single playlist page
final playlistSongCardContextMenulist = [
  ContextMenuOptions(
      id: 1,
      title: "Play one",
      icon: Icons.play_circle_outline,
      function: () {}),
  ContextMenuOptions(
      id: 2,
      title: "Shuffle next playlist",
      icon: Icons.shuffle,
      function: () {}),
  ContextMenuOptions(
      id: 3, title: "Shuffle next album", icon: Icons.shuffle, function: () {}),
];

///The context menu for the song cards found on the search page for playlists
final playlistSearchSongCardContextMenulist = [
  ContextMenuOptions(
      id: 1,
      title: "Add one",
      icon: Icons.play_circle_outline,
      function: () {}),
  ContextMenuOptions(
      id: 2, title: "Add entire album", icon: Icons.shuffle, function: () {}),
];

///The context menu for the song cards found on the Edit Playlist page
final editPlaylistSongCardContextMenulist = [
  ContextMenuOptions(
      id: 1, title: "delete song", icon: Icons.delete, function: () {}),
];
