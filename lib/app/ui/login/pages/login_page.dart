import 'package:app_random_numbers/app/core/app_state_widget/app_state_widget.dart';
import 'package:app_random_numbers/app/core/mixins/screen_utility_mixin.dart';
import 'package:app_random_numbers/app/ui/login/controllers/login_controller.dart';
import 'package:app_random_numbers/app/ui/login/widgets/custom_input_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ScreenUtilityMixin {
  final _controller = GetIt.I.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    _controller.store.storeContextLogin.value = context;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.yellow.shade700,
                Colors.orangeAccent,
                Colors.yellow.shade300,
              ],
            ),
          ),
          child: SizedBox.expand(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: setWidth(20)),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: IntrinsicHeight(
                    child: AppStateWidget(
                      appState: _controller.store.storePageLoading,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Seja bem vindo(a)',
                            key: const Key('title_home'),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          SizedBox(height: setHeight(20)),
                          Text(
                            'Digite seu e-mail e senha nos campos abaixo',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          SizedBox(height: setHeight(40)),
                          Form(
                            key: _controller.store.storeFormKey.value,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomInputLoginWidget(controller: _controller),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: setWidth(14)),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Esqueci minha senha',
                                        style: GoogleFonts.montserrat(
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: setHeight(100)),
                                SizedBox(
                                  width: double.infinity,
                                  height: setHeight(50),
                                  child: ElevatedButton(
                                    key: const Key('button_enter_login'),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xfff5eb64),
                                        elevation: 3),
                                    onPressed: () {
                                      if (_controller.store.storeFormKey.value
                                          .currentState!
                                          .validate()) {
                                        _controller.loginWithEmailPassword();
                                      }
                                    },
                                    child: Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: setFontSize(20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: setHeight(20)),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'Não tem uma conta? ',
                                    style: GoogleFonts.montserrat(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'Cadastrar-se!',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
