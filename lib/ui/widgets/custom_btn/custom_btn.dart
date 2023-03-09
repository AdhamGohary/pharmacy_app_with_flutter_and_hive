import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';

class CustomBtn extends StatefulWidget {
  final String txt;
  final Color color;
  final TextStyle textStyle;
  final double height;
  final double width;
  final void Function()? function;

  const CustomBtn({
    Key? key,
    required this.color,
    required this.txt,
    required this.textStyle,
    required this.height,
    this.function,
    required this.width,
  }) : super(key: key);

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  bool x = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.function,
        onHover: (value) {
          setState(() {
            x = value;
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: x == true ? Colors.white : widget.color,
            /*shape: const OvalBorder()*/),
        child: CustomTxt(
          txt: widget.txt,
          txtStyle: widget.textStyle,
        ),
      ),
    );
  }
}
