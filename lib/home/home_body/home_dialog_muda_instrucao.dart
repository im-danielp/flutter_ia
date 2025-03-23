import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_ia/ia/ia_source.dart';

class HomeDialogMudaInstrucao extends StatelessWidget {
  HomeDialogMudaInstrucao({super.key});
  final iaSource = IASource();
  final textController = TextEditingController();

  // Coleta a instrução passada pelo usuário anteriormente.
  Future<String> buscaInstrucaoAdicional() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('instrucaoAdicional') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      icon: const Icon(
        Icons.auto_fix_high,
        color: Colors.amber,
      ),
      title: const Text(
        'Mude a personalidade da IA',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      content: SizedBox(
        width: size.width * 0.75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder(
              future: buscaInstrucaoAdicional(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Erro ao carregar instrução');
                } else {
                  textController.text = snapshot.data ?? '';
                  return TextField(
                    controller: textController,
                    maxLines: 4,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite uma nova instrução...',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  iaSource.mudarPersonalidade(textController.text);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
