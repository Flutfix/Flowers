import 'package:flowers/pages/home/home_one.dart';
import 'package:flowers/pages/login/auth.dart';
import 'package:flowers/pages/login/get_token.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DecoratedBox(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: Center(
                      child: Text(
                    'Войти',
                    style: TextStyle(fontSize: 30),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 365),
                  child: Center(
                      child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                        Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Container(
                                height: 54,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 7.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          '+7',
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: TextField(
                                            controller: _controller,
                                            decoration: InputDecoration(
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                hintText: "Введите номер",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey[350],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 20,
                                        color: Colors.black.withOpacity(0.15),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        // Create Login Button
                        Padding(
                          padding: const EdgeInsets.only(right: 45),
                          child: GestureDetector(
                            onTap: () {
                              final String _number = _controller.text;
                              if (_number.length != 10) {
                                Fluttertoast.showToast(
                                    msg: "Номер телефона введен неверно",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.indigo[200],
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                auth(_number);
                                _confirmNumber(_number, context);
                              }
                            },
                            child: Container(
                              width: 55,
                              height: 55,
                              child: Image(
                                image:
                                    AssetImage('assets/images/login_enter.png'),
                              ),
                            ),
                          ),
                        )
                      ])),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login_image.jpg"),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}

void _confirmNumber(String number, BuildContext context) {
  TextEditingController _confirm_controller = TextEditingController();
  showMaterialModalBottomSheet(
    bounce: true,
    context: context,
    builder: (context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 255.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '+7$number',
                        style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.indigo[300]),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2, top: 15.0),
                  child: SvgPicture.asset(
                    'assets/images/sms_confirm.svg',
                    width: 50,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Подтвердите номер',
                    style: TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        color: Colors.indigo[300]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.5),
                  child: Text(
                    'Смс-код был отправлен на Ваш номер',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Stack(alignment: AlignmentDirectional.centerEnd, children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, bottom: 20, left: 125),
                        child: Container(
                          height: 54,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 20,
                                  color: Colors.black.withOpacity(0.15),
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22.0),
                            child: TextField(
                              controller: _confirm_controller,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey[350]),
                                  hintText: 'Введите код'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25.0, bottom: 20, right: 92),
                    child: GestureDetector(
                      onTap: () async {
                        final String _code = _confirm_controller.text;
                        String userToken = await getToken(number, _code);
                        if (userToken == 'Неверный код подтверждения') {
                          Fluttertoast.showToast(
                              msg: "Код не совпадает",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.indigo[200],
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        child: Image(
                          image: AssetImage('assets/images/login_enter.png'),
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
      );
    },
  );
}
