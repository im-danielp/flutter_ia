import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:teste_ia/ia/ia_info.dart';

class IASource {
  Future<String> interagir(String prompt) async {
    final model = IAInfo().getModel();

    final chat = model.startChat();
    final message = prompt;
    final content = Content.text(message);

    final response = await chat.sendMessage(content);
    log(response.text!);

    return response.text!;
  }
}
