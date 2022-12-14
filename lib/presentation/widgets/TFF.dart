import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    TextEditingController? controller,
    Color? fillcolor,
    String hintText = '',
    TextInputType keyboardType = TextInputType.name,
    Widget? suffixIcon,
    Widget? prefixIcon,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    double borderRadius = 10.0,
    bool autofocus = false,
    TextAlign textAlign = TextAlign.start,
    bool readOnly = false,
    TextInputAction textInputAction = TextInputAction.next,
  })  : _controller = controller,
        _hintText = hintText,
        _keyboardType = keyboardType,
        _borderRadius = borderRadius,
        _textInputAction = textInputAction,
        _onChanged = onChanged,
        _autofocus = autofocus,
        _textAlign = textAlign,
        _suffixIcon = suffixIcon,
        _readOnly = readOnly,
        _validator = validator,
        _fillcolor = fillcolor,
        _prefixIcon=prefixIcon,
        super(key: key);

  final TextEditingController? _controller;
  final String _hintText;
  final Color? _fillcolor;
  final bool _autofocus;
  final TextInputType _keyboardType;
  final void Function(String)? _onChanged;
  final double _borderRadius;
  final TextInputAction _textInputAction;
  final TextAlign _textAlign;
  final Widget? _suffixIcon;
  final Widget? _prefixIcon;
  final bool _readOnly;
  final String? Function(String?)? _validator;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _fillcolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        textAlign: _textAlign,
        autofocus: _autofocus,
        onChanged: _onChanged,
        readOnly: _readOnly,
        textInputAction: _textInputAction,
        controller: _controller,
        keyboardType: _keyboardType,
        validator: _validator,
        decoration: InputDecoration(
            fillColor: _fillcolor,
            hintText: _hintText,
            suffixIcon: _suffixIcon,
            prefixIcon: _prefixIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(_borderRadius)),
            contentPadding: const EdgeInsets.all(10)),
      ),
    );
  }
}
