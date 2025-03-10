import 'package:baskapp/core/data/models/dtos/do_login_dto.dart';
import 'package:baskapp/core/statics/app_routes.dart';
import 'package:baskapp/core/utils/validators_util.dart';
import 'package:baskapp/design_system/design_system.dart';
import 'package:baskapp/modules/auth/auth_modules_route.dart';
import 'package:baskapp/modules/auth/states/login_states.dart';
import 'package:baskapp/modules/auth/view_models/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginPage({super.key, required this.viewModel});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder(
        valueListenable: widget.viewModel.loginState,
        builder: (context, state, _) {
          return Row(
            children: [
              Form(
                key: _formState,
                child: Flexible(
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
                        BaskappText.titleLarge(
                          'Login',
                          fontWeight: FontWeight.bold,
                        ),
                        BaskappText.bodyMedium(
                          'Faça login ou cadastre-se',
                          color: BaskappColors.grey,
                        ),
                        if (state is ErrorLoginState) ...[
                          SizedBox(height: BaskappSizes.common),
                          BaskappMessageCard.error(
                            state.message,
                            onTapClose: widget.viewModel.clearState,
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
                          validator: ValidatorsUtil.noEmptyValidator,
                          trailingIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },
                            child: Icon(
                              _hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: abre fluxo de recuperar senha
                          },
                          child: BaskappText.bodySmall(
                            'Esqueceu sua senha?',
                            color: BaskappColors.primary,
                          ),
                        ),
                        SizedBox(height: BaskappSizes.common),
                        BaskappButton(
                          'Entrar',
                          onPressed: _onPressedLogin,
                          expanded: true,
                          isLoading: state is LoadingLoginState,
                        ),
                        SizedBox(height: BaskappSizes.small),
                        BaskappButton.secondary(
                          'Cadastre-se',
                          onPressed: () => Navigator.of(context).pushNamed(AuthModuleRoutes.createUser.fullPath),
                          expanded: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    BaskappSizes.medium,
                    BaskappSizes.medium,
                    BaskappSizes.medium,
                  ),
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
          );
        },
      ),
    );
  }

  void _onPressedLogin() async {
    if (!_formState.currentState!.validate()) return;
    await widget.viewModel.doLogin(
      dto: DoLoginDto(
        email: _emailController.text,
        password: _passwordController.text,
      ),
      onSuccess: () {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(AppRoutes.home, (_) => false);
      },
    );
  }
}
