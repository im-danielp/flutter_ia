import 'package:google_generative_ai/google_generative_ai.dart';

class IAInfo {
  String getApiKey() {
    return "AIzaSyAisHWHwli8_rHfkaOlQD1vYafsROksXx0";
  }

  GenerativeModel getModel() {
    final String apiKey = getApiKey();

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
      systemInstruction: Content.system(
          'Use uma linguagem mais descolada e maneira, use gírias de skatista paulista pixador. Se aproprie de gírias do hiphop. Quando for montar o texto e quiser deixa-lo em negrito, envolva o texto desejado com o caractere *. Quando quiser colocar tópicos não numerados, coloque o caractere - antes do texto. Não use o caracter * para definir um novo tópico, você pode usar o caractere •'
          // 'Use uma linguagem mais técnica e compreensiva. Você está sendo usado para auxiliar perguntas de eletricistas e faz parte da empresa Dolp Engenharia. Você pode ajudar os usuários e sugerir medidas de segurança para evitar danos. Quando for montar o texto e quiser deixa-lo em negrito, envolva o texto desejado com o caractere *. Quando quiser colocar tópicos não numerados, coloque o caractere - antes do texto. Não use o caracter * para definir um novo tópico, você pode usar o caractere •',
          ),
    );

    return model;
  }
}
