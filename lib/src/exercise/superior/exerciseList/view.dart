import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';
import 'package:plusfit/widgets/animations.dart';

class ExercisesSuperior extends StatefulWidget {
  ExercisesSuperior(
      {Key key, this.title, this.nome, @required this.documentId, this.image})
      : super(key: key);

  final String title;
  final String documentId;
  final String nome;
  final String image;

  @override
  _ExercisesSuperiorState createState() =>
      _ExercisesSuperiorState(documentId, nome, image);
}

class _ExercisesSuperiorState extends State<ExercisesSuperior> {
  final String documentId;
  final String nome;
  final String image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    expansion();
  }

  expansion() {}

  _showDialog(context, widget) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FadeAnimation(0.5, 1, 10.0, 0.0, widget);
        });
  }

  _ExercisesSuperiorState(this.documentId, this.nome, this.image);

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      var nome = document['nome'];
      var series = document['series'];
      var repeticoes = document['repeticoes'];

      return WorkoutContainer(
          action: () {
            //_showDialog(context, exerciseInfo(context, nome, series, repeticoes));
          },
          width: 1,
          height: 100,
          top: 0,
          left: 30,
          right: 30,
          bottom: 20,
          text: "$nome",
          subtext: "$series series de $repeticoes repetições",
          image: "assets/signup.jpg");
    }).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/sign_up_background.png"),
              fit: BoxFit.cover)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/superior/$image"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      '$nome',
                      style: defaultFont(30, FontWeight.bold, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('treinos/$documentId/exercicios')
                  .snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    return ListView(
                        padding: EdgeInsets.only(top: 20),
                        children: makeListWidget(snapshot));
                }
              }),
        ),
      ]),
    ));
  }
}
