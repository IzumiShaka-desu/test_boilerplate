import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/icons/svg_icons.dart';

import '../../../../../app/core/ui_components/atoms/buttons/buttons.dart';
import '../../../../../app/core/ui_components/themes/spacing.dart';
import '../../../../../app/core/ui_components/themes/typography.dart';

class SuccesRequest extends StatelessWidget {
  const SuccesRequest({
    super.key,
    this.message,
    required this.onResend,
    required this.isLoading,
  });
  final String? message;
  final Function() onResend;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgIcons.warehouseLogo(
            size: 48,
          ),
          Spacing.m,
          Text(
            "Reset Password Link telah Dikirim",
            style: DefaultTypography.formLabel,
          ),
          Spacing.s,
          Text(
            message ?? "Kami sudah kirimkan link ganti password ke finance@khonic.id",
            style: DefaultTypography.contentMessage,
            textAlign: TextAlign.center,
          ),
          Spacing.huge,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tidak menerima email? ",
                style: DefaultTypography.bodyContent,
              ),
              InkWell(
                onTap: isLoading ? null : onResend,
                child: Text(
                  "Kirim Ulang",
                  style: DefaultTypography.link,
                ),
              ),
              Spacing.xs,
              isLoading ? const SizedBox(width: 8, child: CircularProgressIndicator()) : const SizedBox(),
            ],
          ),
          Spacing.huge,
          Row(
            children: [
              Expanded(
                child: Buttons.primary(
                  text: "Kembali ke Login",
                  isDisabled: isLoading,
                  onPressed: () {
                    context.pop();
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
