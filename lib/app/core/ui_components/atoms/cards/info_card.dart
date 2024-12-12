import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/color_pallete.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/typography.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    this.sticky = false,
    required this.label,
    required this.value,
    this.isLoading = false,
    this.padding = const EdgeInsets.all(4),
  });
  final EdgeInsets padding;
  final bool sticky;
  final String label;
  final String value;
  final bool isLoading;

  Widget _buildSticky({required Widget child}) {
    return sticky
        ? Expanded(
            child: child,
          )
        : child;
  }

  @override
  Widget build(BuildContext context) {
    return _buildSticky(
      child: Padding(
        padding: padding,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: ColorPallete.primaryBlue.color.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: DefaultTypography.bodyContent.copyWith(
                        color: TextPallete.dark.color.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: DefaultTypography.base.copyWith(
                        color: TextPallete.link.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
