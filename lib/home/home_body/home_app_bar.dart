import 'package:flutter/material.dart';
import 'package:teste_ia/home/home_body/home_dialog_muda_instrucao.dart';
import 'package:teste_ia/home/home_controller/home_notifier.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final HomeNotifier homeNotifier;

  const HomeAppBar({
    super.key,
    this.height = kToolbarHeight,
    required this.homeNotifier,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 84, 15, 202),
      title: const Text(
        'Testando IA',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          // Limpa a resposta da IA.
          onPressed: () async => homeNotifier.armazenaResposta(''),
          icon: const Icon(
            Icons.refresh_outlined,
            color: Colors.white,
          ),
        ),
        // Adicionar instrução.
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => HomeDialogMudaInstrucao(),
            );
          },
          icon: const Icon(
            Icons.engineering,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
