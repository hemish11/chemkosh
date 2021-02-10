import 'package:chemkosh/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WikiButton extends StatelessWidget {
  final bool hasData;
  final String title;

  const WikiButton({Key key, @required this.hasData, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return hasData
        ? SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: CustomColors.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Material(
                  color: CustomColors.transparent,
                  child: InkWell(
                    onTap: () async {
                      final url = 'https://en.wikipedia.org/wiki/$title';

                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          'More info? Open',
                          style: TextStyle(
                            fontSize: 26,
                            color: CustomColors.backgroundColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Image.asset(
                          'assets/wiki_logo.png',
                          color: CustomColors.backgroundColor,
                          height: 32,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
