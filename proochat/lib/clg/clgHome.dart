import 'package:flutter/material.dart';
import 'package:proochat/infoconstant.dart';
import 'package:proochat/my_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proochat/courses.dart';
import 'package:proochat/clg/components/clgCarousel.dart';

class CollegeScreen extends StatefulWidget {
  final int index;
  List<dynamic> pass;
  CollegeScreen({Key? key, required this.index, required this.pass})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CollegeScreenState(this.index, this.pass);
  }
}

class _CollegeScreenState extends State<CollegeScreen> {
  int index;
  List pass;
  _CollegeScreenState(this.index, this.pass);
  College cour = College();
  final controller = ScrollController();
  double offset = 0;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  Future _signOut() async {
    await _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    _getUser();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "images/3855345.png",
              textTop: "Welcome To ",
              textBottom: "${cour.courseBank[index - 1].titlex} Colleges",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "College Details",
                    style: kHeadingTextStyle,
                  ),
                  SizedBox(height: kDefaultPadding),
                  CollegeCarousel(
                    pass: pass,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
