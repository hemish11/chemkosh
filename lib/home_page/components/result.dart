import 'package:chemkosh/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class Result extends StatefulWidget {
  final String title;
  final String data;

  const Result({Key key, this.data, this.title}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return widget.data != null
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.6,
              width: size.width * 0.9,
              margin: EdgeInsets.only(bottom: size.height * 0.15),
              decoration: BoxDecoration(
                color: CustomColors.accentColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    Html(
                      data: widget.data,
                      style: {
                        "body": Style(
                          fontSize: FontSize(22.0),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: Text(
              'You have not searched\nanything yet',
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ),
          );
  }
}
