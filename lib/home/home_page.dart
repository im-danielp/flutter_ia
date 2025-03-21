import 'package:flutter/material.dart';
import 'package:teste_ia/home/home_body/home_app_bar.dart';
import 'package:teste_ia/home/home_controller/home_notifier.dart';
import 'package:teste_ia/home/home_body/home_input_prompt.dart';
import 'package:teste_ia/home/home_body/home_retorno_resposta_ia.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeNotifier homeNotifier = HomeNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(homeNotifier: homeNotifier),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputPrompt(homeNotifier: homeNotifier),
            const SizedBox(height: 20),
            ListenableBuilder(
              listenable: homeNotifier,
              builder: (context, child) => RetornoRespostaIA(homeNotifier: homeNotifier),
            ),
          ],
        ),
      ),
    );
  }
}
