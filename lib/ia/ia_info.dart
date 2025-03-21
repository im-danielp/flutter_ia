import 'package:google_generative_ai/google_generative_ai.dart';

class IAInfo {
  // ------------------------- Singleton -------------------------
  static final IAInfo _instance = IAInfo._internal();

  IAInfo._internal();

  factory IAInfo() {
    return _instance;
  }

  // ------------------------- Atributos -------------------------
  // Instrução base da IA, que vai ser padrão independente da instrução passada pelo usuário.
  String instrucaoBase =
      'Quando for montar o texto e quiser deixa-lo em negrito, envolva o texto desejado com o caractere *. Quando quiser colocar tópicos não numerados, coloque o caractere - antes do texto. Não use o caracter * para definir um novo tópico, você pode usar o caractere •';

  // Instrução que pode se informada pelo usuário.
  String instrucaoAdicional = '';

  // ------------------------- Métodos -------------------------
  // Coleta o comportamento da IA.
  String getsystemInstruction() => '$instrucaoBase . $instrucaoAdicional';

  // Coleta a key da API
  String getApiKey() => "AIzaSyAisHWHwli8_rHfkaOlQD1vYafsROksXx0";

  // Coleta o modelo da IA.
  GenerativeModel getModel() {
    final String apiKey = getApiKey();
    final String systemInstruction = getsystemInstruction();

    final model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
      systemInstruction: Content.system(systemInstruction),
    );

    return model;
  }
}
