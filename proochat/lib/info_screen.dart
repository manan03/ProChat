import 'package:proochat/infoconstant.dart';
import 'package:proochat/my_header.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proochat/constants.dart';
import 'package:proochat/courses.dart';
import 'package:proochat/clg/clgHome.dart';

class InfoScreen extends StatefulWidget {
  static String id = 'info_screen';
  final int index;
  InfoScreen({Key? key, required this.index}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _InfoScreenState(this.index);
  }
}

class _InfoScreenState extends State<InfoScreen> {
  int index;
  _InfoScreenState(this.index);
  College course = College();
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
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "images/3855345.png",
              textTop: "Get to know",
              textBottom: "About Course",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Course Details",
                    style: kHeadingTextStyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        PreventCard(
                          image: course.courseBank[index - 1].urlx,
                        ),
                        SizedBox(height: 15),
                        Text(
                          course.courseBank[index - 1].titlex,
                          style: kHeadingTextStyle,
                        ),
                        SizedBox(height: 10),
                        Text(course.courseBank[index - 1].subtextx),
                        SizedBox(height: 10),
                        Text(course.courseBank[index - 1].textx),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 20.0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CollegeScreen(
                                        index: index,
                                        pass: course
                                            .courseBank[index - 1].colleges,
                                      )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Find Colleges Near Me',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          color: Colours.orangyish,
                          padding: EdgeInsetsDirectional.all(2.0),
                        ),
                      ),
                    ],
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

class PreventCard extends StatelessWidget {
  dynamic image;
  PreventCard({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: <Widget>[
          Container(
            height: 205,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  color: kShadowColor,
                ),
              ],
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
