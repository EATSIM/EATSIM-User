import 'package:flutter/material.dart';

class CircularCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const CircularCheckbox({
    required this.initialValue,
    this.onChanged,
  });

  @override
  _CircularCheckboxState createState() => _CircularCheckboxState();
}

class _CircularCheckboxState extends State<CircularCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged?.call(_value);
        });
      },
      child: Container(
        width: 18.0,
        height: 18.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFAFAFAF),
            width: 1.5,
          ),
          color: _value ? Colors.white : Colors.white,
        ),
        child: _value
            ? Center(
                child: Icon(
                  Icons.check,
                  size: 15.0,
                  color: Color(0xFFAFAFAF),
                ),
              )
            : null,
      ),
    );
  }
}
