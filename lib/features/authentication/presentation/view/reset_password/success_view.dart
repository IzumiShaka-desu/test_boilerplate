import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/icons/svg_icons.dart';
import 'package:test_boilerplate/features/authentication/router/router.dart';

import '../../../../../app/core/ui_components/atoms/buttons/buttons.dart';
import '../../../../../app/core/ui_components/themes/spacing.dart';
import '../../../../../app/core/ui_components/themes/typography.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacing.xl,
          SvgIcons.approve(
            size: 80,
          ),
          Spacing.xl,
          Text(
            "Password berhasil diubah",
            style: DefaultTypography.title,
          ),
          Spacing.s,
          Text(
            "Silahkan login ulang dengan password anda",
            style: DefaultTypography.contentMessage,
            textAlign: TextAlign.left,
          ),
          Spacing.huge,
          Row(
            children: [
              Expanded(
                child: Buttons.primary(
                  text: "Ke Halaman Login",
                  onPressed: () {
                    context.go(RouteConfig.login);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
