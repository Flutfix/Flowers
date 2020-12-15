import 'package:flowers/pages/flower_page/app_bar.dart';
import 'package:flowers/pages/flower_page/get_product.dart';
import 'package:flowers/pages/flower_page/get_product_serialise.dart';
import 'package:flowers/pages/flower_page/order_product.dart';
import 'package:flowers/pages/flower_page/product_name_funk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Flower extends StatefulWidget {
  @override
  _FlowerState createState() => _FlowerState();
}

class _FlowerState extends State<Flower> {
  GetProduct db;
  bool loading = true;

  void load() async {
    loading = true;

    setState(() {});
    db = await getProduct();

    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(232, 220, 255, 1))))
          : Stack(alignment: Alignment.bottomCenter, children: [
              SingleChildScrollView(
                // Photo and price of product
                child: Column(
                  children: [
                    Container(
                      child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                image: NetworkImage(db.image),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 15.0, right: 20.0),
                              child: Container(
                                child: Center(
                                    child: Text(
                                  db.price.toString() + ' ₽',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                  ),
                                )),
                                height: 30,
                                width: 95,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(252, 220, 255, 1),
                                      Color.fromRGBO(202, 227, 255, 1)
                                    ])),
                              ),
                            )
                          ]),
                    ),

                    // Product info
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          // Product name
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Text(
                                splitName(db.name),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromRGBO(101, 121, 187, 1)),
                              ),
                            ),
                          ),

                          // Product category
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Text(
                                  db.category,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(92, 92, 92, 1)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          // Product description
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Описание:",
                                    style: TextStyle(
                                        color: Color.fromRGBO(101, 121, 187, 1),
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Text(db.description,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromRGBO(56, 56, 56, 1))),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    // Buer Protection
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                        child: Column(
                      children: [
                        Text('Защита покупателя',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                        SizedBox(
                          height: 20,
                        ),
                        SvgPicture.asset('assets/images/protection.svg'),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Text(
                            'Если товар не соответствует заявленному, мы привезем новый, а если это вас не устроит, сломаем вам ебальник.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 25),
                        Text('Бесплатная окрытка',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                        SizedBox(
                          height: 15,
                        ),
                        SvgPicture.asset('assets/images/postcard.svg'),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Просто укажите текст к открытке в заказе, флорист подберёт карточку, впишет текст и приложит её к цветам.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 75)
                      ],
                    )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderProduct()));
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  // width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Заказать',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(252, 220, 255, 0.7),
                    Color.fromRGBO(202, 227, 255, 0.7)
                  ])),
                ),
              )
            ]),
    );
  }
}
