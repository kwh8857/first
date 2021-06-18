import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme:
        ThemeData(scaffoldBackgroundColor: Colors.white, fontFamily: 'Gmarket'),
    title: 'Navigation Basics',
    home: Test(),
  ));
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.brown,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          widthFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 80, left: 30),
                child: Text(
                  '로그인하기',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gmarket'),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 54, bottom: 7),
                      child: Text(
                        '이메일',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Gmarket',
                        ),
                      ),
                    ),
                    TextField(
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff42dd84))),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xffd5d5d5))),
                          hintText: '이메일을 입력해주세요'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, bottom: 7),
                      child: Text(
                        '비밀번호',
                        style: TextStyle(fontSize: 13, fontFamily: 'Gmarket'),
                      ),
                    ),
                    TextField(
                      onChanged: (value) => {print(value)},
                      obscureText: true,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff42dd84))),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xffd5d5d5))),
                          hintText: '비밀번호를 입력해주세요'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 37, bottom: 15),
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff42dd84),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width - 60, 53)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      '로그인 하기',
                      style: TextStyle(
                          fontFamily: 'Gmarket', fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffd5d5d5),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width - 60, 53)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      '비밀번호 찾기',
                      style: TextStyle(
                          fontFamily: 'Gmarket', fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ));
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 96),
              child: Image(
                image: AssetImage('assets/main.png'),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  '안녕하세요\n쑥쑥아이입니다',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, height: 1.3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 37, bottom: 19),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff42dd84), minimumSize: Size(316, 53)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('로그인하기')),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffd5d5d5), minimumSize: Size(316, 53)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text('회원가입하기')),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class YellowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 60),
        height: 50,
        width: 50,
        decoration: BoxDecoration(color: Colors.yellowAccent));
  }
}

class DisplayBox extends StatefulWidget {
  @override
  Display createState() => Display();
}

class Display extends State<DisplayBox> {
  var name = '';

  void _onPressed(e) {
    setState(() {
      name = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(name),
        Container(
          width: 100,
          height: 50,
          child: TextField(
            maxLength: 10,
            onChanged: (e) => {_onPressed(e)},
          ),
        )
      ],
    );
  }
}
