import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaoPerdidoDialog extends StatelessWidget {
  const CaoPerdidoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Por favor informe sobre o cão perdido"),
      contentPadding: const EdgeInsets.all(16.0),
      children: [
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: 'Nome',
          ),
        ),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: 'Local',
          ),
        ),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: 'Contato',
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFFA35005)),
          ),
          onPressed: () {},
          child: Text(
            "Confirmar",
            style: GoogleFonts.underdog(
              fontSize: 36,
              color: Color(0xFFCE8D0F),
            ),
          ),
        ),
      ],
    );
  }
}
