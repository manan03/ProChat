import 'dart:async';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PlacePage extends StatefulWidget {
  static String id = 'home_page';
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _collegeName = TextEditingController();
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
    _collegeName = new TextEditingController();
  }

  @override
  void dispose() {
    _collegeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _message = '';
    String course = '';
    String location = 'Near Me';
    DateTime now = DateTime.now();
    String _currentHour = DateFormat('kk').format(now);
    int hour = int.parse(_currentHour);

    setState(
      () {
        if (hour >= 5 && hour < 12) {
          _message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          _message = 'Good Afternoon';
        } else {
          _message = 'Good Evening';
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[Container()],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //width: MediaQuery.of(context).size.width/1.3,
                alignment: Alignment.center,
                child: Text(
                  _message,
                  style: GoogleFonts.lato(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 55,
              ),
            ],
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    "Hello " + user!.displayName!,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 23, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "We care for you",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   child: Carouselslider(),
                // ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Places",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  padding: EdgeInsets.only(top: 14),
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 14),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 4.0,
                                spreadRadius: 0.0,
                                offset: Offset(3, 3),
                              ),
                            ]
                            // image: DecorationImage(
                            //   image: AssetImage(cards[index].cardImage),
                            //   fit: BoxFit.fill,
                            // ),
                            ),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ExploreList(
                            //             type: cards[index].doctor,
                            //           )),
                            // );
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 29,
                                    child: Icon(
                                      Icons.phone,
                                      size: 26,
                                      color: Colors.blue,
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'ndkm',
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
