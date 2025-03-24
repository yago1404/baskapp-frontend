import 'package:flutter/material.dart';

import '../../core/data/models/enums/position.dart';
import '../../core/data/models/enums/profile_rule.dart';
import '../../core/utils/validators_util.dart';
import '../design_system.dart';

class BaskappRegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const BaskappRegisterForm({super.key, required this.formKey});

  @override
  State<BaskappRegisterForm> createState() => _BaskappRegisterFormState();
}

class _BaskappRegisterFormState extends State<BaskappRegisterForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _nameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _cellphoneController = TextEditingController();
  final _heightController = TextEditingController();

  final List<DropdownMenuItem<ProfileRule>> _rules = [
    DropdownMenuItem<ProfileRule>(
      value: ProfileRule.coach,
      child: BaskappText.bodyLarge(ProfileRule.coach.displayName),
    ),
    DropdownMenuItem<ProfileRule>(
      value: ProfileRule.player,
      child: BaskappText.bodyLarge(ProfileRule.player.displayName),
    ),
  ];

  final List<DropdownMenuItem> _positions = [
    DropdownMenuItem(
      value: Position.pointGuard,
      child: BaskappText.bodyLarge(Position.pointGuard.displayName),
    ),
    DropdownMenuItem(
      value: Position.shootingGuard,
      child: BaskappText.bodyLarge(Position.shootingGuard.displayName),
    ),
    DropdownMenuItem(
      value: Position.smallForward,
      child: BaskappText.bodyLarge(Position.smallForward.displayName),
    ),
    DropdownMenuItem(
      value: Position.powerForward,
      child: BaskappText.bodyLarge(Position.powerForward.displayName),
    ),
    DropdownMenuItem(
      value: Position.center,
      child: BaskappText.bodyLarge(Position.center.displayName),
    ),
  ];

  DropdownMenuItem? _selectedRule;
  DropdownMenuItem? _selectedPosition;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: BaskappSizes.small,
        children: [
          BaskappText.titleMedium('Dados de login'),
          BaskappInputText(
            controller: _emailController,
            validator: ValidatorsUtil.validateEmail,
            label: 'Email',
          ),
          BaskappInputText(
            controller: _passwordController,
            validator: ValidatorsUtil.validatePassword,
            hide: true,
            label: 'Senha',
          ),
          BaskappInputText(
            controller: _confirmPasswordController,
            validator: _validateConfirmationPassword,
            hide: true,
            label: 'Confirme sua senha',
          ),
          SizedBox(height: BaskappSizes.common),
          BaskappText.titleMedium('Dados de perfil'),
          BaskappInputText(
            controller: _nameController,
            validator: ValidatorsUtil.validateFullName,
            label: 'Nome completo',
          ),
          Row(
            spacing: BaskappSizes.small,
            children: [
              Flexible(
                child: BaskappInputText(
                  controller: _birthdayController,
                  validator: ValidatorsUtil.validateBirthday,
                  masks: [BaskappInputMask(mask: '##/##/####')],
                  label: 'Data de nascimento',
                  hintText: 'DD/MM/AAAA',
                ),
              ),
              Flexible(
                child: BaskappDropdown(
                  items: _rules,
                  hintText:
                      _selectedRule?.value.displayName ?? 'Tipo de perfil',
                  onChange: _changeRule,
                ),
              ),
            ],
          ),
          if (_selectedRule?.value == ProfileRule.player) ...[
            Row(
              spacing: BaskappSizes.small,
              children: [
                Flexible(
                  flex: 1,
                  child: BaskappInputText(
                    controller: _heightController,
                    validator: ValidatorsUtil.validateHeight,
                    masks: [BaskappInputMask(mask: '#,##')],
                    hintText: 'Ex.: 1,85',
                    label: 'Altura (m)',
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: BaskappInputText(
                    controller: _cellphoneController,
                    validator: ValidatorsUtil.validateCellphone,
                    masks: [BaskappInputMask(mask: '(##) # ####-####')],
                    label: 'Telefone para contato',
                    hintText: '(11) 9 9999-9999',
                  ),
                ),
              ],
            ),
            BaskappDropdown(
              items: _positions,
              hintText:
                  _selectedPosition?.value.displayName ?? 'Posição em quadra',
              onChange: _changePosition,
            ),
          ],
          SizedBox(height: BaskappSizes.medium),
          BaskappButton(
            'Cadastrar',
            onPressed: _onPressedRegister,
            expanded: true,
          ),
        ],
      ),
    );
  }

  void _changeRule(value) => setState(() {
    _selectedRule = _rules.firstWhere((e) => e.value == value);
  });

  void _changePosition(value) => setState(() {
    _selectedPosition = _positions.firstWhere((e) => e.value == value);
  });

  void _onPressedRegister() {
    if (widget.formKey.currentState!.validate()) {}
  }

  String? _validateConfirmationPassword(String? value) {
    if (value != _passwordController.text) {
      return 'As senhas devem ser iguais';
    }

    return null;
  }
}
