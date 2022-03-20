import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proochat/constants.dart';
import 'package:proochat/loginPage.dart';
import 'package:proochat/welcomePage.dart';
import 'package:proochat/signup.dart';
import 'package:proochat/forgotPassword.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proochat/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProChat',
      theme: ThemeData(
        primaryColor: MyTheme.kPrimaryColor,
        accentColor: MyTheme.kAccentColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        ForgotPage.id: (context) => ForgotPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
