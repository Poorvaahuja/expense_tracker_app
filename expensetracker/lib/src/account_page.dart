import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/services/auth.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}
class _AccountPageState extends State<AccountPage>{
  final AuthService _auth = AuthService();
  String uid = FirebaseAuth.instance.currentUser!.uid ?? '';
  
  get email => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: Column(
          children: [
            Center(
              child: 
              Text(uid as String, style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            Center(
              child: 
              Text('Email: $email', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: const Text('Logout', style: TextStyle(fontSize: 24)),
              ),
            )
          ],
        ),
      ),
    );
  }
}