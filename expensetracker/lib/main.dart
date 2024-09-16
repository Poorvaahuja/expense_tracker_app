import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:flutter_expense_tracker/models/user.dart';
import 'package:provider/provider.dart';
// import 'firebase_options.dart';
import 'package:flutter_expense_tracker/src/authenticate/register.dart';
import 'package:flutter_expense_tracker/src/authenticate/signin.dart';
import 'package:flutter_expense_tracker/src/wrapper.dart';
import 'package:flutter_expense_tracker/services/auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return StreamProvider<myUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Campus Splitwise',
        theme: ThemeData(
          brightness: Brightness.dark,
          // primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteMaker.onGenerateRoute,
      ),
    );
  }
}
class RouteMaker{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case Register.id:
        return MaterialPageRoute(builder: (context) => const Register());
      case SignIn.id:
        return MaterialPageRoute(builder: (context) => const SignIn());
      default:
        return _errorRoute();
    }
  }
}
Route<dynamic> _errorRoute(){
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  });
}
