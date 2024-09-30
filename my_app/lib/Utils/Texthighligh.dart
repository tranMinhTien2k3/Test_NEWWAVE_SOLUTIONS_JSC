import 'package:flutter/material.dart';

Widget highlightKeyword(String text, String keyword) {
  if (keyword.isEmpty) return Text(text);

  final RegExp regex = RegExp('($keyword)', caseSensitive: false);
  final matches = regex.allMatches(text);

  if (matches.isEmpty) return Text(text);

  List<TextSpan> children = [];
  int lastMatchEnd = 0;

  for (final match in matches) {
    if (match.start > lastMatchEnd) {
      children.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
    }
    children.add(TextSpan(
      text: match.group(0)!,
      style: TextStyle(color: Colors.black),
    ));
    lastMatchEnd = match.end;
  }

  if (lastMatchEnd < text.length) {
    children.add(TextSpan(text: text.substring(lastMatchEnd)));
  }

  return RichText(
    text: TextSpan(
        children: children,
        style: TextStyle(
          color: Colors.grey,
        )),
  );
}
