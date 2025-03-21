import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:teste_ia/ia/ia_info.dart';

class IASource {
  final iaInfo = IAInfo();

  // Recebe o prompt e retorna a resposta.
  Future<String> interagir(String prompt) async {
    final model = iaInfo.getModel();

    final chat = model.startChat();
    final message = prompt;
    final content = Content.text(message);

    final response = await chat.sendMessage(content);

    return response.text!;
  }

  void mudarPersonalidade(String novaInstrucao) {
    iaInfo.instrucaoAdicional = novaInstrucao;
  }
}
