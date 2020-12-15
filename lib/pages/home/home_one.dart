import 'package:flowers/pages/home/home_one_big_grid.dart';
import 'package:flowers/pages/home/home_one_small_grid.dart';
import 'package:flowers/parse_flower_home/func_get_flowers_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../parse_flower_home/flowers_home_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  PageController _pageController;
  int _animetedController = 0;
  String _viewController = 'SmallGrid';
  Color colorCategoryForBouquests = Colors.black;
  Color colorCategoryForFlowers = Colors.black38;
  double topLeft = 0.0;
  double topRight = 10.0;
  bool loading = true;
  FlowersHome allDB;
  FlowersHome bouquetsDB;
  FlowersHome flowersDB;

  void loadFunc() async {
    loading = true;
    setState(() => null);
    allDB = await getAllDBForFlowersHome();
    bouquetsDB = await getBouqetsForFlowersHome();
    flowersDB = await getFlowersForFlowersHome();
    loading = false;
    setState(() => null);
  }

  void changeViewController(String trigger) {
    setState(() {
      if (_viewController != trigger) {
        _viewController = trigger;
      }
    });
  }

  @override
  void initState() {
    loadFunc();
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      if (_pageController.page.round() != _animetedController) {
        _animetedController = _pageController.page.round();
        if (_animetedController == 0) {
          colorCategoryForBouquests = Colors.black;
          colorCategoryForFlowers = Colors.black38;
          topLeft = 0.0;
          topRight = 10.0;
        } else {
          colorCategoryForBouquests = Colors.black38;
          colorCategoryForFlowers = Colors.black;
          topLeft = 10.0;
          topRight = 0.0;
        }
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(children: [
            Container(
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(252, 220, 255, 1),
                  Color.fromRGBO(202, 227, 255, 1)
                ]))),
            SafeArea(
              child: SizedBox(
                height: 100,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(252, 220, 255, 1),
                      Color.fromRGBO(202, 227, 255, 1)
                    ]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child:
                                    SvgPicture.asset('assets/images/menu.svg'),
                              ),
                              SvgPicture.asset('assets/images/flower.svg'),
                              SizedBox(width: 35)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                curve: Curves.ease,
                                duration: Duration(milliseconds: 400),
                                width: MediaQuery.of(context).size.width / 2,
                                left: _animetedController == 1
                                    ? MediaQuery.of(context).size.width / 2
                                    : 0.0,
                                child: SizedBox(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Container(
                                      decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(topLeft),
                                        topRight: Radius.circular(topRight)),
                                  )),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _pageController.animateToPage(0,
                                            duration:
                                                Duration(milliseconds: 400),
                                            curve: Curves.ease);
                                      },
                                      child: SizedBox(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text('Букеты',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color:
                                                    colorCategoryForBouquests,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w300)),
                                      )),
                                  GestureDetector(
                                      onTap: () {
                                        _pageController.animateToPage(1,
                                            duration:
                                                Duration(milliseconds: 400),
                                            curve: Curves.ease);
                                      },
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text('Цветы',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: colorCategoryForFlowers,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w300)),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: GestureDetector(
                            onTap: () {
                              changeViewController('BigGrid');
                            },
                            child: SvgPicture.asset(
                                'assets/images/smallGrid.svg'))),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                          onTap: () {
                            changeViewController('SmallGrid');
                          },
                          child: SvgPicture.asset('assets/images/bigGrid.svg')),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    children: [
                      Text('ФИЛЬТР',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF7C7C7C))),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SvgPicture.asset('assets/images/filter.svg'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.77,
            width: MediaQuery.of(context).size.width,
            child: PageView(controller: _pageController, children: [
              loading
                  ? Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(232, 220, 255, 1))))
                  : buildListView(bouquetsDB, bouquetsDB.data.length),
              loading
                  ? Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(232, 220, 255, 1))))
                  : buildListView(flowersDB, flowersDB.data.length)
            ]),
          )
        ],
      ),
    );
  }

  Widget buildListView(FlowersHome db, int lengthDB) {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: (lengthDB / 2).round(),
            itemBuilder: (context, i) {
              return _viewController == 'SmallGrid'
                  ? buildFlowersRowCard(context, db, i, lengthDB)
                  : buildBigGrid(context, db, i);
            }));
  }
}
