import 'package:flutter/material.dart';

import '../../core/utils/validators_util.dart';
import '../design_system.dart';

class BaskappLoginForm extends StatefulWidget {
  final GlobalKey<FormState> formState;
  final String? errorMessage;
  final void Function() onTapCloseErrorMessage;
  final void Function({required String email, required String password})
  onPressedLogin;
  final void Function() onPressedRegister;
  final void Function() onPressedRecoveryPassword;
  final bool isLoading;

  const BaskappLoginForm({
    super.key,
    required this.formState,
    required this.onTapCloseErrorMessage,
    required this.onPressedLogin,
    required this.onPressedRegister,
    required this.onPressedRecoveryPassword,
    required this.isLoading,
    this.errorMessage,
  });

  @override
  State<BaskappLoginForm> createState() => _BaskappLoginFormState();
}

class _BaskappLoginFormState extends State<BaskappLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formState,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: BaskappSizes.extraLarge),
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
            if (widget.errorMessage != null) ...[
              SizedBox(height: BaskappSizes.common),
              BaskappMessageCard.error(
                widget.errorMessage!,
                onTapClose: widget.onTapCloseErrorMessage,
              ),
              SizedBox(height: BaskappSizes.common),
            ],
            SizedBox(height: BaskappSizes.common),
            BaskappInputText(
              controller: _emailController,
              label: 'Email',
              validator: ValidatorsUtil.validateEmail,
            ),
            SizedBox(height: BaskappSizes.small),
            BaskappInputText(
              controller: _passwordController,
              hide: _hidePassword,
              label: 'Senha',
              validator: ValidatorsUtil.validateNoEmpty,
              trailingIcon: InkWell(
                onTap: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
                child: Icon(
                  _hidePassword ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.onPressedRecoveryPassword,
              child: BaskappText.bodySmall(
                'Esqueceu sua senha?',
                color: BaskappColors.primary,
              ),
            ),
            SizedBox(height: BaskappSizes.common),
            BaskappButton(
              'Entrar',
              onPressed:
                  () => widget.onPressedLogin(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
              expanded: true,
              isLoading: widget.isLoading,
            ),
            SizedBox(height: BaskappSizes.small),
            BaskappButton.secondary(
              'Cadastre-se',
              onPressed: widget.onPressedRegister,
              expanded: true,
            ),
          ],
        ),
      ),
    );
  }
}
