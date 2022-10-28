import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTxtFormField extends StatelessWidget {
  final String? hintText;
  final bool obScure;
  final int? maxLines;
  final String? ifBody;
  final String regExpSource;
  GlobalKey<FormState>? myKey;
  void Function()? function;
  final TextEditingController? textEditingController;
  final AutovalidateMode autovalidateMode;
  final bool caseSensitive;
  final TextInputType keyBoardType;
  Widget? prefixWidget;
  CustomTxtFormField(
      {Key? key,
      this.prefixWidget,
      this.hintText,
      required this.obScure,
      this.maxLines,
      this.function,
      this.ifBody,
      this.myKey,
      required this.regExpSource,
      this.textEditingController,
      required this.autovalidateMode,
      required this.caseSensitive,
      required this.keyBoardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Form(
      key: myKey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.05 * height),
        ),
        child: TextFormField(
          // inputFormatters: [TextInputFormatter.withFunction((oldValue, newValue) => null)],
          onTap: function,
          keyboardType: keyBoardType,
          autovalidateMode: autovalidateMode,
          controller: textEditingController,
          obscureText: obScure,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 223, 222, 222),
            hintText: hintText,
            prefixIcon: prefixWidget,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.05 * height)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(0.05 * height)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(0.05 * height)),
          ),
          validator: (text) {
            if (RegExp(regExpSource, caseSensitive: caseSensitive)
                    .hasMatch('$text') ==
                false) {
              return ifBody;
            }
            return null;
          },
        ),
      ),
    );
  }
}
