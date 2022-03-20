import 'package:flutter/material.dart';
import 'package:proochat/infoconstant.dart';
import 'package:proochat/colleges.dart';

class DetailsScreen extends StatelessWidget {
  final Ques q;
  const DetailsScreen({Key? key, required this.q}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // 40% of our total height
              height: size.height * 0.4,
              child: Container(
                height: size.height * 0.4 - 50,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),
                child: Image.network(
                  q.urlx,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
                horizontal: kDefaultPadding,
              ),
              child: Text(
                q.titlex,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                q.textx,
                style: TextStyle(
                  color: Color(0xFF737599),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
