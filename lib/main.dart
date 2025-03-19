import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:teste_ia/bold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 75, 24, 161)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Testando IA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String respostaIA = '';
  final textController = TextEditingController();

  void enviarPrompt(String prompt) async {
    const apiKey = "AIzaSyAisHWHwli8_rHfkaOlQD1vYafsROksXx0";

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
        'Use uma linguagem mais técnica e compreensiva. Você está sendo usado para auxiliar perguntas de eletricistas e faz parte da empresa Dolp Engenharia. Você pode ajudar os usuários e sugerir medidas de segurança para evitar danos. Quando for montar o texto e quiser deixa-lo em negrito, envolva o texto desejado com o caractere *. Quando quiser colocar tópicos não numerados, coloque o caractere - antes do texto',
      ),
    );

    final chat = model.startChat();
    final message = prompt;
    final content = Content.text(message);

    final response = await chat.sendMessage(content);
    log(response.text!);

    setState(() {
      respostaIA = response.text!;
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 15, 202),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
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
                    onPressed: () => enviarPrompt(textController.text),
                    child: const Icon(Icons.speaker_notes),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            BoldTextParser(text: respostaIA)
          ],
        ),
      ),
    );
  }
}
