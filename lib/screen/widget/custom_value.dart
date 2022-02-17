import 'package:flutter/material.dart';

class ValueField extends StatelessWidget {
  final int? initialValue;
  final FormFieldValidator<String>? validator;
  final ValueChanged<int>? onChanged;
  final String? labelText;

  const ValueField({
    Key? key,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 40,
          child: TextFormField(
            textAlign: TextAlign.center,
            initialValue: initialValue.toString(),
            decoration: InputDecoration(
              labelText: labelText,
              floatingLabelAlignment: FloatingLabelAlignment.center,
              errorStyle: const TextStyle(
                height: 0.000001,
              ),
            ),
            keyboardType: const TextInputType.numberWithOptions(),
            onChanged: (text) {
              int? value = int.tryParse(text);
              if (value != null) onChanged?.call(value);
            },
            validator: validator,
          )),
    );
  }
}
