import 'package:flutter/material.dart';

class Nextbtn extends StatefulWidget {
  final isNext;
  final pagecontrol;
  final step;
  final coprovider;
  final stepdata;
  Nextbtn(
      {this.isNext,
      this.pagecontrol,
      this.step,
      this.coprovider,
      this.stepdata})
      : super(key: UniqueKey());
  @override
  _NextbtnState createState() => _NextbtnState();
}

class _NextbtnState extends State<Nextbtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {
              print('버튼 ${widget.isNext}'),
              if (widget.isNext)
                {
                  widget.coprovider.stepupdate(),
                  widget.pagecontrol.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeOutBack),
                }
            },
        child: Container(
          padding: EdgeInsets.all(30),
          child: Container(
            height: 53,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: widget.isNext ? Color(0xff42dd84) : Color(0xffd5d5d5),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              '다음으로',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
