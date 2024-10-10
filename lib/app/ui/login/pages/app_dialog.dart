import 'package:app_random_numbers/app/core/mixins/screen_utility_mixin.dart';
import 'package:flutter/material.dart';

class AppMessageCustom with ScreenUtilityMixin {
  void error(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(setRadius(10)),
            ),
            title: Text(
              'Atenção',
              style: TextStyle(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: setFontSize(20)),
              textAlign: TextAlign.center,
            ),
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: setFontSize(16)),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow.shade700,
                ),
                child: const Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }

  void confirmation(BuildContext context, String message, Function onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          key: const Key('alet_dialog_custom_confirmed'),
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(setRadius(10)),
            ),
            title: Text(
              'Atenção',
              style: TextStyle(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: setFontSize(20)),
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Deseja mesmo sair da conta?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: setFontSize(16)),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    textStyle:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                  child: const Text('Cancelar'),
                ),
              ),
              TextButton(
                key: const Key('button_logout_confirm'),
                onPressed: () {
                  onConfirm();
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text('Sair'),
              ),
            ],
          ),
        );
      },
    );
  }
}
