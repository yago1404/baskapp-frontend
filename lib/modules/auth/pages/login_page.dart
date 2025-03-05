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
                    onTap: () => {
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
          Flexible(flex: 3, child: Container(color: Colors.green)),
        ],
      ),
    );
  }
}
