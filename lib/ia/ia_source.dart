import 'dart:developer';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_ia/ia/ia_info.dart';

// Funções relacionadas a IA.
class IASource {
  final iaInfo = IAInfo();

  // Recebe o prompt e retorna a resposta.
  Future<String> interagir(String prompt) async {
    final model = await iaInfo.getModel();

    final chat = model.startChat();
    final message = prompt;
    final content = Content.text(message);

    final response = await chat.sendMessage(content);

    log(response.text!);
    return response.text!;
  }

  // Altera a instrução da IA, salvando nas preferências.
  void mudarPersonalidade(String novaInstrucao) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('instrucaoAdicional', novaInstrucao);
  }
}
