import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/icons/svg_icons.dart';

import '../../../../../app/core/ui_components/atoms/buttons/buttons.dart';
import '../../../../../app/core/ui_components/themes/spacing.dart';
import '../../../../../app/core/ui_components/themes/typography.dart';
import '../../../../../app/core/ui_components/atoms/forms/default_textfield.dart';

class ResetFormView extends StatelessWidget {
  const ResetFormView({
    super.key,
    required this.formKey,
    required this.newPasswordController,
    required this.passwordError,
    required this.retypeNewpasswordController,
    required this.onSubmit,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordController;
  final String? passwordError;
  final TextEditingController retypeNewpasswordController;
  final Function() onSubmit;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 113,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgIcons.warehouseLogo(
                  size: 48,
                ),
                Spacing.m,
                const Text(
                  'Lupa Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0A0A0A),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Spacing.huge,
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Password baru",
                      style: DefaultTypography.formLabel,
                    ),
                  ],
                ),
                Spacing.xs,
                DefaultTextField(
                  controller: newPasswordController,
                  fieldname: "Password",
                  hintText: "Password Baru",
                  inputType: TextInputType.visiblePassword,
                  errorMessage: passwordError,
                ),
                Spacing.m,
                Row(
                  children: [
                    Text(
                      "Input Ulang Password Baru",
                      style: DefaultTypography.formLabel,
                    ),
                  ],
                ),
                Spacing.s,
                DefaultTextField(
                  controller: retypeNewpasswordController,
                  fieldname: "Password",
                  hintText: "Input Ulang Password Baru",
                  inputType: TextInputType.visiblePassword,
                  errorMessage: passwordError,
                ),
              ],
            ),
          ),
          Spacing.huge,
          Row(
            children: [
              Expanded(
                child: Buttons.primary(
                  text: isLoading ? "Memproses.." : "Login",
                  isDisabled: isLoading,
                  onPressed: onSubmit,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
