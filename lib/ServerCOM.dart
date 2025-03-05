import 'package:flutter/material.dart';
import 'Icon_Content.dart';
import 'InputPage.dart';
import 'Reusable_card.dart';
import 'Control_Page.dart';
import 'controlling.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

const activecardcolor = Color(0xe80c266b);
const inactivecardcolor = Color(0xFF1D1E33);
const containercolor = Color.fromARGB(79, 15, 6, 44);

enum server {
  send,
  exit,
}

class servercom extends StatelessWidget {
  servercom({super.key, required this.label, required this.username});
  final _firestore = FirebaseFirestore.instance;
  final String label;
  final _auth = FirebaseAuth.instance;
  final String username;
  final databaseReference = FirebaseDatabase.instance.ref('StoreData');
  

  @override
  Widget build(BuildContext context) { 
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/server.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Server Communication',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              child: Text(
                'Send Data',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Reusablecard(
                  colour: containercolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Command',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        label,
                        style: const TextStyle(
                            fontSize: 75.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 200.0,
                child: GestureDetector(
                  
                  onTap: () {
                    _firestore.collection('Commands').add({
                      'text': label,
                      'sender': username,
                    });
                    databaseReference
                        .child('Users ').push()
                        .set({'Sender': username,
                         'Command':label,
                         'id':DateTime.now().toString()});
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Controll_page();
                    }));
                  },
                  child: Controlcard(
                    colour: activecardcolor,
                    controlchild: controlIcon(
                      label: 'Send to Server',
                      icon: Icons.beenhere_outlined,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 200.0,
                child: GestureDetector(
                  onTap: () {
                    _auth.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InputPage();
                    }));
                  },
                  child: Controlcard(
                    colour: activecardcolor,
                    controlchild: controlIcon(
                      label: 'Exit',
                      icon: Icons.cancel,
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
