import 'package:flutter/material.dart';

Future<void> showNewOrganizationDialog({
  required BuildContext context,
  required void Function(String) onConfirm,
}) async {
  final TextEditingController textController = TextEditingController();

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Новая организация'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Название',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              onConfirm(textController.text);
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}