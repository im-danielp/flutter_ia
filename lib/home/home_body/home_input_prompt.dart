import 'package:flutter/material.dart';
import 'package:teste_ia/home/home_controller/home_notifier.dart';
import 'package:teste_ia/ia/ia_source.dart';

class InputPrompt extends StatelessWidget {
  final HomeNotifier homeNotifier;

  InputPrompt({
    super.key,
    required this.homeNotifier,
  });

  final iaSource = IASource();
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: TextField(
            focusNode: focusNode,
            maxLines: null,
            textCapitalization: TextCapitalization.sentences,
            controller: textController,
            decoration: const InputDecoration(),
          ),
        ),
        Flexible(
          flex: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              iconColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 84, 15, 202),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () async {
              textController.clear();
              focusNode.unfocus();
              final msg = await iaSource.interagir(textController.text);
              homeNotifier.armazenaResposta(msg);
            },
            child: const Icon(Icons.speaker_notes),
          ),
        ),
      ],
    );
  }
}
