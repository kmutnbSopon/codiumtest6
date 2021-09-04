import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:codiumtest6/utility/theme_color.dart';
import 'package:codiumtest6/utility/normal_dialog.dart';
import 'package:codiumtest6/screens/suscessPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/c.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(),
                  )
                ],
              ),
            ),
            Positioned(
              left: -140,
              top: -270,
              child: CircleAvatar(
                radius: 190,
                backgroundColor: LightColor.lightBlue2,
              ),
            ),
            Positioned(
              left: -130,
              top: -300,
              child: CircleAvatar(
                radius: 190,
                backgroundColor: LightColor.lightBlue1,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .4,
              right: -150,
              child: CircleAvatar(
                radius: 130,
                backgroundColor: LightColor.yellow2,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .4,
              right: -180,
              child: CircleAvatar(
                radius: 130,
                backgroundColor: LightColor.yellow,
              ),
            ),
            Positioned(
                left: 0,
                top: 40,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    Text(
                      'login page',
                      style: GoogleFonts.prompt(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            // _loginButton(),
            _buttonWidget(),
          ],
        ),
      ),
    );
  }

  Align _buttonWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            _userForm(),
            SizedBox(
              height: 20,
            ),
            _passwordForm(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "If you aren't member ? Please ",
                  style: GoogleFonts.prompt(
                      fontSize: 12, color: LightColor.lightblack),
                ),
                Text(
                  "Register",
                  style: GoogleFonts.prompt(
                      fontSize: 12, color: LightColor.lightblack
                      ,decoration: TextDecoration.underline),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            // _transferButton()
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _transferButton() {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            color: LightColor.navyBlue2,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Wrap(
          children: <Widget>[
            Transform.rotate(
              angle: 70,
              child: Icon(
                Icons.swap_calls,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Pay',
              style: GoogleFonts.prompt(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }

  Widget _userForm() => Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 48.0,
        child: TextField(
          onChanged: (value) => email = value.trim(),
          decoration: InputDecoration(
            labelText: 'E-mail',
            labelStyle: GoogleFonts.prompt(
              textStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent)),
          ),
        ),
      );

  Widget _passwordForm() => Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 48.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true, 
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: GoogleFonts.prompt(
              textStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent)),
          ),
        ),
      );

  Widget _loginButton() => Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 48.0,
        child: RaisedButton(
          color: LightColor.navyBlue2,
          onPressed: () {
            if (email == null ||
                email.isEmpty ||
                password == null ||
                password.isEmpty) {
              normalDialog(context, 'Have space please fill the blank');
            } else {
              checkAuthen(email, password);
            }
          },
          child: Text(
            'login',
            style: GoogleFonts.prompt(
              textStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      );

  Future<Null> checkAuthen(String user, String password) async {
    String userCheck = 'CODIUM';
    String passCheck = 'CODIUM';
    try {
      if (user == userCheck && password == passCheck) {
        MaterialPageRoute route = MaterialPageRoute(
            builder: (value) => SuscessPage()); //วิธีเชื่อมหน้า
        Navigator.push(context, route);
      } else {
        normalDialog(context, 'Email or Password wrong, Please try again.');
      }
    } catch (e) {
      print('error');
      normalDialog(context, 'Email or Password wrong, Please try again.');
    }
  }
}
