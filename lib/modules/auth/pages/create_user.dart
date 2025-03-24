import 'package:baskapp/modules/auth/view_models/create_profile_view_model.dart';
import 'package:flutter/material.dart';

import '../../../design_system/design_system.dart';

class CreateUserPage extends StatefulWidget {
  final CreateProfileViewModel viewModel;

  const CreateUserPage({super.key, required this.viewModel});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaskappColors.primary,
      appBar: AppBar(
        title: BaskappText.titleLarge(
          'Cadastre-se',
          color: BaskappColors.white,
        ),
        centerTitle: true,
        backgroundColor: BaskappColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: BaskappSizes.medium,
          vertical: BaskappSizes.large,
        ),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: BaskappColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(BaskappSizes.medium),
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaskappText.titleLarge(
                      'Preencha os dados para criar sua conta',
                    ),
                    SizedBox(height: BaskappSizes.large),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(child: BaskappRegisterForm(formKey: _formKey)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
