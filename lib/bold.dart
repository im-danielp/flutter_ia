import 'package:flutter/material.dart';

class BoldTextParser extends StatelessWidget {
  final String text;

  const BoldTextParser({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: const TextStyle(
        fontSize: 16,
      ),
      parseBoldText(text),
    );
  }

  TextSpan parseBoldText(String text) {
    final RegExp regex = RegExp(r'\*(.*?)\*'); // Captura texto entre * *
    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final match in regex.allMatches(text)) {
      // Adiciona o texto antes do negrito
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
      }
      // Adiciona o texto em negrito
      spans.add(TextSpan(
        text: match.group(1),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
      lastMatchEnd = match.end;
    }

    // Adiciona o restante do texto após a última ocorrência
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd)));
    }

    return TextSpan(children: spans);
  }
}
