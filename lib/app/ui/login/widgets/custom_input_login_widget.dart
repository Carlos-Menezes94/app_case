import 'package:app_random_numbers/app/core/mixins/screen_utility_mixin.dart';
import 'package:app_random_numbers/app/ui/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class CustomInputLoginWidget extends StatefulWidget {
  final LoginController controller;
  const CustomInputLoginWidget({super.key, required this.controller});

  @override
  State<CustomInputLoginWidget> createState() => _CustomInputLoginWidgetState();
}

class _CustomInputLoginWidgetState extends State<CustomInputLoginWidget>
    with ScreenUtilityMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.controller.store.storeShowPassword,
        builder: (BuildContext context, state, Widget? child) {
          return Column(
            children: [
              TextFormField(
                key: const Key('text_email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu e-mail';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Por favor, digite um e-mail válido';
                  }

                  return null;
                },
                controller: widget.controller.store.storeControllerEmail.value,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              SizedBox(height: setHeight(10)),
              TextFormField(
                key: const Key('text_password'),
                obscureText: widget.controller.store.storeShowPassword.value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite sua senha';
                  }
                  if (value.length < 6) {
                    return 'A senha contém no mínimo 6 dígitos';
                  }

                  return null;
                },
                controller:
                    widget.controller.store.storeControllerPassword.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      widget.controller.store.storeShowPassword.value =
                          !widget.controller.store.storeShowPassword.value;
                    },
                    icon: Icon(
                      widget.controller.store.storeShowPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: setFontSize(26),
                    ),
                  ),
                  label: const Text('Senha'),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ],
          );
        });
  }
}
