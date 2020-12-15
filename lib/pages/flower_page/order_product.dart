import 'package:flowers/pages/flower_page/flower_page.dart';
import 'package:flowers/pages/flower_page/get_product.dart';
import 'package:flowers/pages/flower_page/get_product_serialise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderProduct extends StatefulWidget {
  @override
  _OrderProductState createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
  GetProduct db;
  bool loading = true;
  int _animatedController = 0;
  PageController _pageController;

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
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      if (_pageController.page.round() != _animatedController) {
        _animatedController = _pageController.page.round();
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: orderAppBar(context),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(232, 220, 255, 1))))
          : Column(
              children: [
                SizedBox(height: 20),

                //Product image
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(db.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //Product name
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(db.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(101, 121, 187, 1),
                        fontWeight: FontWeight.w600,
                      )),
                ),

                //Product type
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    db.category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17, color: Color.fromRGBO(92, 92, 92, 1)),
                  ),
                ),

                // Order details
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(21),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                            'Кому доставить?',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ))),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 239, 244, 1),
                            borderRadius: BorderRadius.circular(5)),
                        // deliver to who
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            height: 25,
                            width: MediaQuery.of(context).size.width * 0.76,
                            child: Stack(children: [
                              // White transported container
                              AnimatedPositioned(
                                  curve: Curves.ease,
                                  left: _animatedController == 1
                                      ? MediaQuery.of(context).size.width * 0.39
                                      : 0.0,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.385,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  duration: Duration(microseconds: 400)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _pageController.animateToPage(0,
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.ease);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.385,
                                      child: Center(child: Text('Мне')),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _pageController.animateToPage(1,
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.ease);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.385,
                                      child: Center(
                                          child: Text('Другому человеку')),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                      ),
                      // PageView(
                      //   controller: _pageController,
                      //   children: [
                      //     Container(
                      //       height: 15,
                      //       width: 15,
                      //       color: Colors.green,
                      //     ),
                      //     Container(
                      //       height: 15,
                      //       width: 15,
                      //       color: Colors.red,
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Выберите город',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

AppBar orderAppBar(context) {
  return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(252, 220, 255, 1),
            Color.fromRGBO(202, 227, 255, 1)
          ]),
        ),
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Flower()));
            },
            child: SvgPicture.asset('assets/images/back_button.svg')),
        Text('Оформление заказа',
            style: TextStyle(
              color: Color.fromRGBO(28, 39, 75, 1),
              fontSize: 32,
            )),
        SizedBox(
          width: 10,
        )
      ]));
}
