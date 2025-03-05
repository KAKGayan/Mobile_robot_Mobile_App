import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobileapp/ServerCOM.dart';
import 'controlling.dart';
import 'Icon_Content.dart';
import 'sendcommand.dart';

const inactivecardcolor = Color(0xFF1D1E33);
const activecardcolor = Colors.blue;
const labelcardcolor = Color(0xe03c0b73);

enum ControlButton {
  forward,
  backward,
  turnleft,
  turnright,
  stop,
  confirm,
}

class Controll_page extends StatefulWidget {
  @override
  State<Controll_page> createState() => _Controll_pageState();
}

class _Controll_pageState extends State<Controll_page> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  ControlButton? selectcontrolbutton;
  ControlButton? selectcard;
  String? labelcommand;
  ControlButton? confirmbutton;
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        loggedInUser = user;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/control_img.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "Main Controlling Page",
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectcard = ControlButton.forward;
                    });
                  },
                  child: Controlcard(
                    colour: selectcard == ControlButton.forward
                        ? activecardcolor
                        : inactivecardcolor,
                    controlchild: controlIcon(
                      label: 'Forward',
                      icon: FontAwesomeIcons.arrowUp,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectcard = ControlButton.turnleft;
                  });
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Controlcard(
                        colour: selectcard == ControlButton.turnleft
                            ? activecardcolor
                            : inactivecardcolor,
                        controlchild: controlIcon(
                          icon: FontAwesomeIcons.arrowLeft,
                          label: 'Turn Left',
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectcard = ControlButton.stop;
                          });
                        },
                        child: Controlcard(
                          colour: selectcard == ControlButton.stop
                              ? activecardcolor
                              : inactivecardcolor,
                          controlchild: controlIcon(
                            label: 'Stop',
                            icon: FontAwesomeIcons.circle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectcard = ControlButton.turnright;
                          });
                        },
                        child: Controlcard(
                          colour: selectcard == ControlButton.turnright
                              ? activecardcolor
                              : inactivecardcolor,
                          controlchild: controlIcon(
                              label: 'Turn Right',
                              icon: FontAwesomeIcons.arrowRight),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectcard = ControlButton.backward;
                    });
                  },
                  child: Controlcard(
                    colour: selectcard == ControlButton.backward
                        ? activecardcolor
                        : inactivecardcolor,
                    controlchild: controlIcon(
                      label: 'Backward',
                      icon: FontAwesomeIcons.arrowDown,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Controlcard(
                  colour: labelcardcolor,
                  controlchild: SizedBox(
                    width: 200,
                    child: controlIcon(
                        icon: Icons.build_sharp,
                        label: selectcard == ControlButton.forward
                            ? 'Forward'
                            : selectcard == ControlButton.backward
                                ? 'Backward'
                                : selectcard == ControlButton.turnleft
                                    ? 'Turn Left'
                                    : selectcard == ControlButton.turnright
                                        ? 'Turn Right'
                                        : selectcard == ControlButton.stop
                                            ? 'Stop'
                                            : ''),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    sendcmd cmd = sendcmd(commandmove: selectcard);
                    setState(() {
                      confirmbutton = ControlButton.confirm;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return servercom(
                          label: cmd.updatecommand(),
                          username: loggedInUser.toString(),
                        );
                      }));
                    });
                  },
                  child: SizedBox(
                    width: 200,
                    child: Controlcard(
                      colour: Colors.black,
                      controlchild: controlIcon(
                        label: 'Confirm',
                        icon: Icons.verified_rounded,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
