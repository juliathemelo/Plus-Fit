import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/exercise/cardiovascular/exerciseList/view.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';
import 'package:plusfit/widgets/animations.dart';

class CardiovascularPage extends StatefulWidget {
  CardiovascularPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CardiovascularPageState createState() => _CardiovascularPageState();
}

class _CardiovascularPageState extends State<CardiovascularPage> {
  double _minutoscardio = 0;
  double _intervalocardio = 0;
  String _cursor = "minutos";

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      var nome = document['Nome'];
      var nivel = document['Nivel'];
      var image = document['image'];

      return ExerciseContainer(
          color: dificult(nivel),
          width: 1,
          height: 100,
          top: 20,
          left: 20,
          right: 20,
          bottom: 0.0,
          text: "$nome",
          subtext: "Nivel: $nivel",
          image: 'assets/cardio/$image',
          action: () {
            Navigator.push(
                context,
                transitionAnimation(
                    ExercisesCardio(
                        documentId: (document['doc'].toString()),
                        image: (document['image'].toString())),
                    1.0,
                    0.0));
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController cont = ScrollController();
    void scroll() {
      cont.animateTo(0,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Treinos Cardiovasculares',
            style: defaultFont(18, FontWeight.bold, Colors.white)),
        actions: [],
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/back_treinos.png"),
                fit: BoxFit.cover)),
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: 100,
            child: Image.asset('assets/Cardio_2.png'),
          ),
          Flexible(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('treinos')
                    // .where('Nivel', isEqualTo: nivel)
                    .where('Tipo', isEqualTo: 'cardio')
                    .snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return ListView(children: makeListWidget(snapshot));
                  }
                }),
          ),
        ]),
      ),
    );
  }
}
