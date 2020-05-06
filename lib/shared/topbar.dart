import 'package:flutter/material.dart';
import 'package:layout/shared/colors.dart';

class Topbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.fromLTRB(
          22.0,
          22.0 + MediaQuery.of(context).padding.top,
          22.0,
          22.0,
        ),
        //height: 122.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
          color: MyColors.niceBlue,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "Search Flight",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "13 results",
                  style: TextStyle(
                    color: MyColors.softPurple,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
