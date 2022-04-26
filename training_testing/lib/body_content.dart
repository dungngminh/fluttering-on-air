import 'package:flutter/material.dart';

class BodyContent extends StatefulWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  State<BodyContent> createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  String _value = 'dungngminh';
  bool _isChange = false;
  void changeText(String value) {
    setState(() {
      _value = value;
    });
  }

  void changeColor() {
    setState(() {
      _isChange = !_isChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _value,
          style: const TextStyle(color: Colors.purple, fontSize: 18),
        ),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
          child: const Text('pump text'),
          onPressed: () => changeText("lynnlynn"),
        ),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
          child: const Text('pump color'),
          onPressed: changeColor,
        ),
        AnimatedContainer(
          height: 300,
          width: 100,
          duration: const Duration(milliseconds: 300),
          color: _isChange ? Colors.red : Colors.blue,
        )
      ],
    );
  }
}
