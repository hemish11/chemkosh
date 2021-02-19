import 'package:chemkosh/colors.dart';
import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final String title;
  final String body;

  const DataTile({Key key, this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        height: 120,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: CustomColors.backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              body,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
