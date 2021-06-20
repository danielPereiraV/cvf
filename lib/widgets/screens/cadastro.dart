import 'package:cvf/widgets/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CVF",
              style: GoogleFonts.underdog(
                color: Colors.brown,
                fontSize: 50,
              ),
            ),
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                filled: true,
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                filled: true,
              ),
            ),
            TextFormField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha',
                filled: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFA35005)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Entrar",
                    style: GoogleFonts.underdog(
                      fontSize: 36,
                      color: Color(0xFFCE8D0F),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
