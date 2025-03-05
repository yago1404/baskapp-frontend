import 'package:baskapp/design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: BaskappSizes.extraLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: BaskappImages.appLogo.asWidget,
                  ),
                  SizedBox(height: BaskappSizes.common),
                  BaskappText.titleLarge('Login', fontWeight: FontWeight.bold),
                  BaskappText.bodyMedium(
                    'Faça login ou cadastre-se',
                    color: BaskappColors.grey,
                  ),
                  SizedBox(height: BaskappSizes.common),
                  BaskappInputText(
                    controller: _emailController,
                    label: 'Email',
                  ),
                  SizedBox(height: BaskappSizes.small),
                  BaskappInputText(
                    controller: _passwordController,
                    hide: _hidePassword,
                    label: 'Senha',
                    trailingIcon: InkWell(
                      onTap:
                          () => setState(() {
                            _hidePassword = !_hidePassword;
                          }),
                      child: Icon(
                        _hidePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:
                        () => {
                          // TODO: abre fluxo de recuperar senha
                        },
                    child: BaskappText.bodySmall(
                      'Esqueceu sua senha?',
                      color: BaskappColors.primary,
                    ),
                  ),
                  SizedBox(height: BaskappSizes.common),
                  BaskappButton('Entrar', onPressed: () {}, expanded: true),
                  SizedBox(height: BaskappSizes.small),
                  BaskappButton.secondary(
                    'Cadastre-se',
                    onPressed: () {},
                    expanded: true,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(BaskappSizes.medium),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: BaskappImages.playerBg.asImageProvider,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(BaskappSizes.large),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaskappText.displayLarge(
                              'Baskapp',
                              color: BaskappColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            BaskappText.titleLarge(
                              'Monitore estatisticas, crie metas e acompanhe a evolução dos seus atletas',
                              color: BaskappColors.grey,
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
        ],
      ),
    );
  }
}
