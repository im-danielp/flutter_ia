import 'package:flutter/material.dart';
import 'package:teste_ia/ia/ia_source.dart';

class HomeDialogMudaInstrucao extends StatelessWidget {
  HomeDialogMudaInstrucao({super.key});

  final iaSource = IASource();
  final textController = TextEditingController();

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
          spacing: 24,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textController,
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Fale com gírias e ...',
                hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
              ),
            ),
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
