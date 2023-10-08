import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String hintText;

  final bool obsecureText;

  const AppTextField({
    Key? key,
    required this.hintText,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 18),
      obscureText: widget.obsecureText,
      cursorColor: const Color(0xFF7BC1F2),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Color(0xFFBCCDDC)),
        hintText: widget.hintText,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: Color(0xFF2DD4BD)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

class AppTextField2 extends StatefulWidget {
  final String hintText;

  final bool obsecureText;

  const AppTextField2({
    Key? key,
    required this.hintText,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppTextField2State createState() => _AppTextField2State();
}

class _AppTextField2State extends State<AppTextField2> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white, fontSize: 18),
      obscureText: widget.obsecureText,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        hintText: widget.hintText,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
        ),
      ),
    );
  }
}
