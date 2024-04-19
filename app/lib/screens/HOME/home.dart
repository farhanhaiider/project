import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/backk.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Container(
                      width: 387,
                      height: 395,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/unt6.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: _width * 0.70,
                          height: _height * 0.24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/unt7.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            'WAVES\n',
                            style: TextStyle(
                              color: Color(0xFF131111),
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0.06,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '50 MCQS',
                            style: TextStyle(
                              color: Color(0xFF737171),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0.10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: _width * 0.70,
                          height: _height * 0.24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/unt7.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'ELECTROLYTES',
                        style: TextStyle(
                          color: Color(0xFF131111),
                          fontSize: 20,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.06,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '50 MCQS',
                        style: TextStyle(
                          color: Color(0xFF737171),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            )));
  }
}
