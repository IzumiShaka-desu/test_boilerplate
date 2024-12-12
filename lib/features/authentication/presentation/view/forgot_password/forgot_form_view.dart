import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/icons/svg_icons.dart';

import '../../../../../app/core/ui_components/atoms/buttons/buttons.dart';
import '../../../../../app/core/ui_components/themes/spacing.dart';
import '../../../../../app/core/ui_components/themes/typography.dart';
import '../../../../../app/core/ui_components/atoms/forms/default_textfield.dart';

class FormView extends StatelessWidget {
  const FormView({
    super.key,
    required this.emailController,
    required this.emailError,
    required this.onSubmit,
    required this.isLoading,
  });

  final TextEditingController emailController;
  final String? emailError;
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
                SvgIcons.warehouseLogo(size: 48),
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
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Email",
                    style: DefaultTypography.formLabel,
                  ),
                ],
              ),
              Spacing.xs,
              DefaultTextField(
                controller: emailController,
                fieldname: "Email",
                hintText: "Email",
                errorMessage: emailError,
              ),
            ],
          ),
          Spacing.m,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Sudah ingat password kamu? ",
                style: DefaultTypography.contentMessage,
              ),
              InkWell(
                child: Text(
                  "Login",
                  style: DefaultTypography.link,
                ),
                onTap: () {
                  context.pop();
                },
              ),
            ],
          ),
          Spacing.huge,
          Row(
            children: [
              Expanded(
                child: Buttons.primary(
                  text: "Konfirmasi",
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
