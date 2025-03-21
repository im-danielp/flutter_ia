import 'package:flutter/material.dart';
import 'package:teste_ia/home/home_controller/home_notifier.dart';
import 'package:teste_ia/ia/ia_source.dart';

class InputPrompt extends StatefulWidget {
  final HomeNotifier homeNotifier;

  const InputPrompt({
    super.key,
    required this.homeNotifier,
  });

  @override
  State<InputPrompt> createState() => _InputPromptState();
}

class _InputPromptState extends State<InputPrompt> {
  final iaSource = IASource();
  final textController = TextEditingController();
  final focusNode = FocusNode();
  bool digitando = false;

  // Envia o prompt para a IA e armazena a resposta no ChangeNotifier.
  void enviaPrompt(String promp) async {
    textController.clear();
    focusNode.unfocus();
    final respostaIA = await iaSource.interagir(promp);
    widget.homeNotifier.armazenaResposta(respostaIA);
  }

  // Libera ou não o botão de enviar. Atualiza o estado somente quando tem 1 ou 0 caracteres.
  void desbloqueiaEnvio(String text) {
    if (text.length == 1) {
      setState(() => digitando = true);
    } else if (text.isEmpty) {
      setState(() => digitando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            focusNode: focusNode,
            maxLines: null,
            textCapitalization: TextCapitalization.sentences,
            controller: textController,
            decoration: const InputDecoration(),
            onChanged: (text) => desbloqueiaEnvio(text),
          ),
        ),
        IconButton(
          onPressed: digitando ? () async => enviaPrompt(textController.text) : null,
          icon: const Icon(Icons.send),
          color: Colors.amber,
        ),
      ],
    );
  }
}
