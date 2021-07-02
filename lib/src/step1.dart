import 'dart:io';

import 'package:first/src/data/stepdata.dart';
import 'package:first/src/factory/photo.dart';
import 'package:first/src/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first/src/nextbtn.dart';
import 'package:first/src/step2.dart';
import 'package:provider/provider.dart';

_Step1State wrapper = new _Step1State();

class Step1 extends StatefulWidget {
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  StepData? _stepData;
  String gender = '';
  bool isPolicy = false;
  bool isNext = false;
  String name = '';
  dynamic profileimage;
  int birth = 0;
  PageController _pageController = new PageController();

  @override
  void initState() {
    _stepData = new StepData();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => PhotoFactory(),
        transitionsBuilder: (c, animation, a2, child) => SlideTransition(
          position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
              .animate(animation),
          child: child,
        ),
        transitionDuration: Duration(milliseconds: 250),
      ),
    );
    setState(() {
      profileimage = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider = CounterProvider();
    counterProvider = Provider.of<CounterProvider>(context);
    bool checkAll() => (counterProvider.step == 1
        ? isPolicy && birth > 0 && gender.isNotEmpty && name.isNotEmpty
        : false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            if (counterProvider.step == 1) {
              Navigator.pop(context);
            } else {
              counterProvider.stepchange();
              _pageController.previousPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeOutBack);
            }
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Nextbtn(
          isNext: checkAll(),
          pagecontrol: _pageController,
          coprovider: counterProvider,
          stepdata: _stepData),
      body: PageView(
        controller: _pageController,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: (e) => {},
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/green_back.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                      top: 110,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 17,
                              ),
                              Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                width: 17,
                              ),
                              Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 37),
                            child: Text(
                              'STEP 01',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              '아이의 기본정보를\n입력해주세요',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                _navigateAndDisplaySelection(context);
                              },
                              child: profileimage != null
                                  ? Container(
                                      width: 227,
                                      height: 227,
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                        color: Color(0xfff4f4f4),
                                        borderRadius:
                                            BorderRadius.circular(227),
                                        image: new DecorationImage(
                                            image: FileImage(profileimage),
                                            fit: BoxFit.cover),
                                      ))
                                  : Container(
                                      width: 227,
                                      height: 227,
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(227),
                                        color: Color(0xfff4f4f4),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset('assets/heart.svg'),
                                          SizedBox(
                                            height: 11,
                                          ),
                                          Text(
                                            '우리아이 사진을\n 등록해주세요',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffafafaf),
                                                height: 1.3),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ))
                        ],
                      )),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 53.5, left: 30, right: 30, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '아기 이름',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7, bottom: 36),
                      height: 48,
                      child: TextField(
                        onChanged: (String value) {
                          setState(() => {name = value});
                        },
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 0, bottom: 0, left: 16, right: 16),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff42dd84))),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xffd5d5d5))),
                        ),
                      ),
                    ),
                    Text(
                      '생년월일',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7, bottom: 36),
                      height: 48,
                      child: TextField(
                        onChanged: (String value) {
                          setState(() {
                            birth = value.length > 0 ? int.parse(value) : 0;
                          });
                        },
                        maxLength: 6,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        style: TextStyle(fontSize: 15),
                        decoration: new InputDecoration(
                            counterText: '',
                            contentPadding: EdgeInsets.only(
                                top: 0, bottom: 0, left: 16, right: 16),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff42dd84))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Color(0xffd5d5d5))),
                            hintText: 'YY-MM-DD'),
                      ),
                    ),
                    Text(
                      '성별',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => {setState(() => gender = 'man')},
                          child: Container(
                              width: 146,
                              height: 149,
                              padding: EdgeInsets.only(top: 27.6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: gender == 'man' ? 2 : 1,
                                      color: gender == 'man'
                                          ? Color(0xff42dd84)
                                          : Colors.grey)),
                              child: Column(
                                children: [
                                  SvgPicture.asset(gender == 'man'
                                      ? 'assets/maleactive.svg'
                                      : 'assets/male.svg'),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    '남자아이',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: gender == 'man'
                                            ? Color(0xff42dd84)
                                            : Colors.grey),
                                  )
                                ],
                              )),
                        ),
                        InkWell(
                          onTap: () => {
                            setState(() => {gender = 'girl'})
                          },
                          child: Container(
                              width: 146,
                              height: 149,
                              padding: EdgeInsets.only(top: 33.5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: gender == 'girl' ? 2 : 1,
                                      color: gender == 'girl'
                                          ? Color(0xff42dd84)
                                          : Colors.grey)),
                              child: Column(
                                children: [
                                  SvgPicture.asset(gender == 'girl'
                                      ? 'assets/femaleactive.svg'
                                      : 'assets/female.svg'),
                                  SizedBox(
                                    height: 14.7,
                                  ),
                                  Text(
                                    '여자아이',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: gender == 'girl'
                                            ? Color(0xff42dd84)
                                            : Colors.grey),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Text(
                      '출산여부',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    InkWell(
                      onTap: () => {
                        setState(() => {isPolicy = !isPolicy})
                      },
                      child: Container(
                        padding: EdgeInsets.all(14),
                        margin: EdgeInsets.only(top: 7),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color:
                                    isPolicy ? Color(0xff42dd84) : Colors.grey,
                                width: isPolicy ? 2 : 1)),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  width: 21,
                                  height: 21,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      // borderRadius: BorderRadius.circular(21),
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                ),
                                isPolicy
                                    ? SvgPicture.asset('assets/check.svg')
                                    : Container()
                              ],
                            ),
                            Text(
                              '아직 출산 전입니다',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
          Step2()
        ],
      ),
    );
  }
}
