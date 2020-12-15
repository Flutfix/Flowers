import 'package:flowers/parse_flower_home/flowers_home_model.dart';
import 'package:flutter/material.dart';

Padding buildFlowersRowCard(context, FlowersHome db, int i, int listLength) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          buildSmallGrid(context, db, i * 2),
          listLength % 2 == 0
              ? buildSmallGrid(context, db, (i * 2) + 1)
              : (i * 2) + 1 == listLength
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.34,
                      width: MediaQuery.of(context).size.width * 0.44,
                    )
                  : buildSmallGrid(context, db, (i * 2) + 1)
        ],
      ));
}

Widget buildSmallGrid(context, FlowersHome db, int i) {
  return Padding(
    padding: const EdgeInsets.only(right: 7.0, left: 13.0),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.34,
      width: MediaQuery.of(context).size.width * 0.44,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFF6579BB)),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(4.0, 4.0),
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5)
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.21,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.fill,
                  placeholder: 'assets/gif/loading.gif',
                  image: db.data[i].image,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                child: Text(
                  db.data[i].name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xFF6579BB),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 7.0, left: 10.0),
                child: Text(
                  db.data[i].category,
                  style: TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 10,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                children: [
                  Text(db.data[i].price.toString() + ' ₽',
                      style: TextStyle(fontSize: 13, fontFamily: 'Montserrat')),
                  // SvgPicture.asset('')
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
