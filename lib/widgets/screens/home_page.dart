import 'package:cvf/widgets/TelaDinamica/cao_perdido.dart';
import 'package:cvf/widgets/TelaDinamica/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              Post(
                autor: "Lele",
                legenda: "Corridinha matinal",
                imagem:
                    "https://i.pinimg.com/236x/d5/b2/04/d5b204066572c122016a038db180fea4--funny-pets-golden-retriever.jpg",
              ),
              Post(
                autor: "Matheus",
                legenda: "Alcool ou gasolina patrão? kkkkk #caoFrentista",
                imagem: "https://pbs.twimg.com/media/C4ZKOwGWEAA5-NN.jpg",
              ),
              Post(
                autor: "Rafael",
                legenda: "Mais que irmãos, 'brothers' ",
                imagem:
                    "https://vidasimples.co/wp-content/uploads/2019/08/Vida-simples-ter-um-cachorro-1160x523.jpg",
              ),
              Post(
                autor: "Luis",
                legenda: "Diga o por que devo te contratar?. #entrevista #Job",
                imagem:
                    "https://www.vetquality.com.br/wp-content/uploads/2020/09/escola-para-cachorro.jpg",
              ),
              Post(
                autor: "Gabriel",
                legenda:
                    "!Cão Perdido! Nome: Sansão , Local: Praça da Sé, contato: 43 9999999 ",
                imagem:
                    "https://photos.enjoei.com.br/roupa-tubarao-gg-45964868/1200xN/czM6Ly9waG90b3MuZW5qb2VpLmNvbS5ici9wcm9kdWN0cy8xNDY5MjU3Ni9jZTg0MWY1ZWM2NzVjMmMwMjhhNTExYmUzZWJiMGUxNy5qcGc",
              ),
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
