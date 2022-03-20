import 'dart:core';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'info_screen.dart';
import 'package:proochat/infoconstant.dart';
import 'package:proochat/my_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'home_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              textTop: "Hello",
              textBottom: user!.displayName,
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Courses",
                    style: kHeadingTextStyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        PreventCard(
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoScreen(
                                          index: 1,
                                        )),
                              );
                            },
                            title: 'Arts',
                            text:
                                'Art and crafts help young children explore and express their emotions, share how they relate to their family and friends, talk about their difficulties, their future dreams and aspirations, even if they have not yet developed a full vocabulary to do so. It also develops courage and a healthy self-esteem.',
                            image: 'images/art.jpg'),
                        SizedBox(height: 15),
                        PreventCard(
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoScreen(
                                          index: 2,
                                        )),
                              );
                            },
                            title: 'Dance',
                            text:
                                'Dance can effectively promote good health by improving cardiovascular fitness, strengthening the muscles, increasing circulation, decreasing blood pressure, lowering the risk of coronary heart disease, reducing stress, and many other positive benefits.',
                            image: 'images/dance.jpg'),
                        SizedBox(height: 15),
                        PreventCard(
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoScreen(
                                          index: 3,
                                        )),
                              );
                            },
                            title: 'Music',
                            text:
                                'Characters of varying degree that are found in music, can affect one\'s mood. Music can raise someone\'s mood, get them excited, or make them calm and relaxed. Music also - and this is important - allows us to feel nearly or possibly all emotions that we experience in our lives.',
                            image: 'images/music.jpg'),
                        SizedBox(height: 15),
                        PreventCard(
                          title: 'Sports',
                          text:
                              'Sports help control diabetes, manage weight, enhance blood circulation, and manage levels of stress. Through sports, there is a good balance of physical and mental growth, which helps tone muscles and makes bones strong. Sports inculcates in students the importance of a healthy lifestyle.',
                          image: 'images/sports.jpg',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoScreen(
                                        index: 4,
                                      )),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
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
  final String image;
  final String title;
  final String text;
  dynamic onPress;
  PreventCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 126,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                height: 136,
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
              ),
              Image.asset(image),
              Positioned(
                left: 155,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 136,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: kTitleTextstyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          text,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
