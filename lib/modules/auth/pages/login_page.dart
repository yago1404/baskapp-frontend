import 'package:baskapp/core/data/models/dtos/do_login_dto.dart';
import 'package:baskapp/core/statics/app_routes.dart';
import 'package:baskapp/design_system/atoms/baskapp_breakpoint.dart';
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
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder(
        valueListenable: widget.viewModel.loginState,
        builder: (context, state, _) {
          return BaskappBreakpoint(
            tablets: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: BaskappLoginForm(
                    formState: _formState,
                    onTapCloseErrorMessage: widget.viewModel.clearState,
                    onPressedLogin: _onPressedLogin,
                    onPressedRegister: _onPressedRegister,
                    onPressedRecoveryPassword: () => {},
                    isLoading: state is LoadingLoginState,
                    errorMessage:
                        state is ErrorLoginState ? state.message : null,
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
            ),
            cellphone: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: BaskappLoginForm(
                      formState: _formState,
                      onTapCloseErrorMessage: widget.viewModel.clearState,
                      onPressedLogin: _onPressedLogin,
                      onPressedRegister: _onPressedRegister,
                      onPressedRecoveryPassword: () => {},
                      isLoading: state is LoadingLoginState,
                      errorMessage:
                          state is ErrorLoginState ? state.message : null,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onPressedLogin({
    required String email,
    required String password,
  }) async {
    if (!_formState.currentState!.validate()) return;
    await widget.viewModel.doLogin(
      dto: DoLoginDto(email: email, password: password),
      onSuccess: () {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(AppRoutes.home, (_) => false);
      },
    );
  }

  void _onPressedRegister() =>
      Navigator.of(context).pushNamed(AuthModuleRoutes.createUser.fullPath);
}
