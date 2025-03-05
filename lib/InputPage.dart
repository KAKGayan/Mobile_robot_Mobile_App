import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_Content.dart';
import 'Reusable_card.dart';
import 'intro_video.dart';
import 'Sign_inPage.dart';

const bottomcontainerheight = 50.0;
const inactivecardcolor = Color(0xFF1D1E33);
const activecardcolor = Color(0xe80c266b);

enum HomeButton {
  login,
  intro,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  HomeButton? selectbutton;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/login.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablecard(
                    colour: Colors.transparent,
                    cardChild: const Center(
                      child: Column(
                        children: [
                          Text(
                            "WELCOME!",
                            style: TextStyle(
                              //fontFamily: 'Pacifico',
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  selectbutton = HomeButton.login;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return registerscreen();
                  }));
                });
              },
              child: Reusablecard(
                colour: selectbutton == HomeButton.login
                    ? activecardcolor
                    : inactivecardcolor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.user,
                  label: "Login",
                ),
              ),
            )),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectbutton = HomeButton.intro;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Videointro();
                    }));
                  });
                },
                child: Reusablecard(
                  colour: selectbutton == HomeButton.intro
                      ? activecardcolor
                      : inactivecardcolor,
                  cardChild: IconContent(
                    label: "Intro to Rover Technology",
                    icon: FontAwesomeIcons.play,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomcontainerheight,
            )
          ],
        ),
      ),
    );
  }
}
