import 'package:flutter/material.dart';
import 'package:plusfit/authentication.dart';
import 'package:plusfit/widgets/TextFormFieldContainer.dart';
import 'package:plusfit/widgets/TextField.dart';
import 'package:plusfit/components/constants.dart';
import 'package:provider/provider.dart';
import '../components/constants.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();

  var _viewpass = Icons.visibility_off;
  bool _obscureText = true;
  var _viewpass1 = Icons.visibility_off;
  bool _obscureText1 = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText) {
        _viewpass = Icons.visibility_off;
      } else {
        _viewpass = Icons.visibility;
      }
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
      if (_obscureText1) {
        _viewpass1 = Icons.visibility_off;
      } else {
        _viewpass1 = Icons.visibility;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

          decoration: BoxDecoration(
                  image: DecorationImage(
                          image: AssetImage("assets/sign_up_background.png"),
                          fit: BoxFit.cover)
          ),

          child: 
                  ListView(
                          children: <Widget>[
                                  IconButton(
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                          alignment: Alignment.topLeft,
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_back_ios),
                                          splashRadius: 20,
                                          onPressed: () {
                                                  Navigator.pop(context);
                                          },
                                    ),

                                    SizedBox(
                                            height: 30,
                                    ),

                                    SizedBox(
                                            height: 150,
                                            width: 150,
                                            child: Image.asset("assets/Plusfit_logo.png")
                                    ),

                                    Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                                            child: Container(
                                                    height: 320,
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(20)),
                                                    child: Column(
                                                            mainAxisSize: MainAxisSize.max,
                                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: <Widget>[
                                                                    SizedBox(
                                                                            height: 10,
                                                                    ),
                                                                    DefaultTextField(
                                                                            controler: emailController,
                                                                            obscureText: false,
                                                                            text: "Email",
                                                                            prefixicon: Icons.account_circle_sharp,
                                                                    ),
                                                                    SizedBox(
                                                                            height: paddefault,
                                                                    ),
                                                                    TextFieldContainer(
                                                                            child: TextField(
                                                                                    controller: passwordController,
                                                                                    obscureText: _obscureText,
                                                                                    style: new TextStyle(
                                                                                            color: Colors.black, 
                                                                                            fontSize: 18
                                                                                    ),
                                                                                    decoration: InputDecoration(
                                                                                            border: OutlineInputBorder(
                                                                                            borderRadius: BorderRadius.circular(35)
                                                                                            ),
                                                                                            prefixIcon: Icon(Icons.lock_outline),
                                                                                            suffixIcon: IconButton(
                                                                                                    onPressed: _toggle,
                                                                                                    icon: Icon(_viewpass),
                                                                                            ),
                                                                                            labelText: 'Senha',
                                                                                            labelStyle: TextStyle(
                                                                                                    color: pgreytextfield
                                                                                            )
                                                                                    ),
                                                                            ),
                                                                    ),
                                                                  SizedBox(
                                                                          height: paddefault,
                                                                  ),
                                                                TextFieldContainer(
                                                                        child: TextField(
                                                                                obscureText: _obscureText1,
                                                                                style: new TextStyle(color: Colors.black, fontSize: 18),
                                                                                decoration: InputDecoration(
                                                                                        border: OutlineInputBorder(
                                                                                                borderRadius: BorderRadius.circular(30)
                                                                                        ),
                                                                                        prefixIcon: Icon(Icons.lock_outline),
                                                                                        suffixIcon: IconButton(
                                                                                                onPressed: _toggle1,
                                                                                                icon: Icon(_viewpass1),
                                                                                        ),
                                                                                        labelText: 'Confirmar Senha',
                                                                                        labelStyle: TextStyle(color: pgreytextfield)
                                                                                ),
                                                                        ),
                                                                ),
                                                                SizedBox(
                                                                        height: padbutton,
                                                                 ),
                                                                Container(
                                                                        child: Column(
                                                                                children: <Widget>[
                                                                                        ElevatedButton(
                                                                                                style: ElevatedButton.styleFrom(
                                                                                                        primary: porange,
                                                                                                        textStyle: TextStyle(
                                                                                                                fontSize: 20, 
                                                                                                                fontWeight: FontWeight.bold
                                                                                                        ),
                                                                                                        minimumSize: Size(320, 50),
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                                borderRadius: BorderRadius.circular(25)
                                                                                                        ),
                                                                                                ),

                                                                                                onPressed: () { 
                                                                                                        if (passwordController.text.trim() == passwordController1.text.trim()){
                                                                                                                context.read<AuthenticationService>().singUp(
                                                                                                                email: emailController.text.trim(),
                                                                                                                password: passwordController.text.trim(),
                                                                                                                );
                                                                                                        }else{
                                                                                                                AlertDialog(
                                                                                                                        title: Text(''),
                                                                                                                );
                                                                                                        }
                                                                                                },
                                                                                        ),
                                                                                ],
                                                                        ),
                                                                ),
                                                                SizedBox(
                                                                        height: 65,
                                                                ),
                                                                Container(
                                                                        height: 32,
                                                                        child: Row(
                                                                                children: [
                                                                                        SizedBox(
                                                                                                width: 110,
                                                                                        ),
                                                                                        Text(
                                                                                                "Possui uma Conta?",
                                                                                                textAlign: TextAlign.right,
                                                                                                style: TextStyle(color: pyellow),
                                                                                        ),
                                                                                Container(
                                                                                        alignment: Alignment.topLeft,
                                                                                        width: 80,
                                                                                        child: TextButton(
                                                                                                onPressed: () {
                                                                                                        Navigator.pop(context);
                                                                                                        Navigator.pushNamed(context, '/login');
                                                                                                },
                                                                                                child: Text(
                                                                                                        "Entrar",
                                                                                                        style: TextStyle(
                                                                                                                color: pyellow, 
                                                                                                                fontWeight: FontWeight.bold
                                                                                                        ),
                                                                                                ),
                                                                                        ),
                                                                                ),
                                                                                ],
                                                                        ),
                                                                ),
                                                    ])
                                            ),
                                    ),
                          ]
                          )
      )
      );
  }
}
