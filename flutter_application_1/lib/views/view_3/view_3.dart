import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/view_3/widgets/app_button.dart';

class View3 extends StatelessWidget {
  const View3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppButton.white(label: "+ DE DETAILS"),
          const SizedBox(
            width: 20,
          ),
          AppButton.red(label: "ENREGISTRER"),
        ],
      ),
    );
  }
}
