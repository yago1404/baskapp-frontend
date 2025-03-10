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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _ruleController = TextEditingController();
  final TextEditingController _cellphoneController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaskappText.titleLarge('Cadastre-se'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: BaskappSizes.medium,
            vertical: BaskappSizes.large,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BaskappText.titleLarge('Preencha os dados para criar sua conta'),
              SizedBox(height: BaskappSizes.large),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: BaskappSizes.medium,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: BaskappSizes.small,
                      children: [
                        BaskappText.titleMedium('Dados de login'),
                        BaskappInputText(
                          controller: _emailController,
                          label: 'Email',
                        ),
                        BaskappInputText(
                          controller: _passwordController,
                          label: 'Senha',
                        ),
                        BaskappInputText(
                          controller: _confirmPasswordController,
                          label: 'Confirme sua senha',
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: BaskappSizes.small,
                      children: [
                        BaskappText.titleMedium('Dados de perfil'),
                        BaskappInputText(
                          controller: _nameController,
                          label: 'Nome completo',
                        ),
                        BaskappInputText(
                          controller: _birthdayController,
                          label: 'Data de nascimento',
                          hintText: 'DD/MM/AAAA',
                        ),
                        BaskappInputText(
                          controller: _ruleController,
                          label: 'Competencia',
                          hintText: 'TECNICO ou JOGADOR',
                        ),
                        BaskappInputText(
                          controller: _heightController,
                          label: 'Altura',
                        ),
                        BaskappInputText(
                          controller: _positionController,
                          label: 'Posicao em quadra',
                        ),
                        BaskappInputText(
                          controller: _cellphoneController,
                          label: 'Telefone para contato',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: BaskappSizes.extraLarge),
              BaskappButton('Cadastrar', onPressed: () => {}, expanded: true),
            ],
          ),
        ),
      ),
    );
  }
}
