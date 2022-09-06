import 'package:flutter/material.dart';

Future<dynamic> showErrorDialog(
    {required BuildContext context, required String messageError}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: _BuildErroScreen(
          errorMessage: messageError,
        ),
      );
    },
  );
}

class _BuildErroScreen extends StatelessWidget {
  final String errorMessage;

  const _BuildErroScreen({required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 28),
          Text(errorMessage),
          const SizedBox(height: 28),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Fechar',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
