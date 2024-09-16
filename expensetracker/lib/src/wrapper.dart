import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/user.dart';
import 'package:flutter_expense_tracker/src/MainPage.dart';
import 'package:flutter_expense_tracker/src/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final user = Provider.of<myUser?>(context);
    if(user == null){
      return Authenticate();
    }
    else{
      return MainPage(uid: user.uid);
    }
  }
}