import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/win_record/win_record_bloc.dart';

class AppDialog {
  static Future<String> askName(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    String name = context.read<WinRecordBloc>().state.playerName ?? '';
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: AlertDialog(
            title: const Text('Congrat!'),
            content: TextFormField(
              initialValue: context.read<WinRecordBloc>().state.playerName,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(hintText: 'Who are you?'),
              onChanged: (text) {
                name = text;
              },
              validator: (text) {
                if (text?.trim().isEmpty ?? true) return 'Cannot be Empty!';
                return null;
              },
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Enter'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
    return name;
  }
}
