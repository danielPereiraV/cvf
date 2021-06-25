import 'package:cvf/widgets/TelaDinamica/cao_perdido.dart';
import 'package:cvf/widgets/TelaDinamica/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pets = [];
  @override
  initState() {
    super.initState();
    getpets();
  }

  Map fromJson(Map<String, dynamic> json) {
    return {
      'autor': json['autor'],
      'legenda ': json['legenda'],
      'imagem ': json['imagem']
    };
  }

  void getpets() async {
    var url =
        Uri.parse('https://cvf-api-default-rtdb.firebaseio.com/pets.json');
    var resposta = await http.get(url);

    final Map<String, dynamic> objeto = json.decode(resposta.body);
    var listapets = objeto['-Md-fFei_3Y63Lm9WFqf'];
    debugPrint(listapets.runtimeType.toString());

    var data = listapets.map((dynamic json) => fromJson(json)).toList();
    debugPrint(data.runtimeType.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadê Você Meu Filho ?",
          style: GoogleFonts.underdog(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            tooltip: 'Criar',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => CaoPerdidoDialog());
            },
          ),
          IconButton(
            icon: const Icon(Icons.message_outlined, color: Colors.black),
            tooltip: 'Chat',
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Post(
                autor: "Daniel",
                legenda: "Meu menino está saudavel",
                imagem:
                    "https://images.unsplash.com/photo-1576201836106-db1758fd1c97?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
              ),
              ...this.pets.map((elemento) {
                return Post(
                  autor: elemento.autor,
                  legenda: elemento.legenda,
                  imagem: elemento.imagem,
                );
              })
            ],
          ),
        ),
      ),
      drawer: MenuDrawer(),
    );
  }
}

class Post extends StatelessWidget {
  final String autor;
  final String legenda;
  final String imagem;

  const Post(
      {Key? key,
      required this.autor,
      required this.legenda,
      required this.imagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.perm_identity_outlined,
                  size: 50,
                ),
              ),
              Text(
                "$autor publicou uma foto",
                style: GoogleFonts.underdog(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                legenda,
                style: GoogleFonts.underdog(),
              ),
            ],
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(imagem)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Comentar",
                style: GoogleFonts.underdog(),
              ),
              Icon(Icons.thumb_up_outlined),
            ],
          )
        ],
      ),
    );
  }
}
