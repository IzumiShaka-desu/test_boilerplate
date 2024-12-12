import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/core/ui_components/atoms/icons/svg_icons.dart';
import '../../../../app/core/ui_components/themes/color_pallete.dart';
import '../../../../app/core/ui_components/themes/spacing.dart';
import '../../../../app/core/ui_components/themes/typography.dart';
import '../../../../app/core/ui_components/molecules/boucing_background.dart';
import '../viewmodel/auth_viewmodel.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<AuthViewmodel>();
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 375 / 75,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFF1D8ADB)),
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        return BouncingBox2(
                          maxHeight: constraints.maxHeight,
                          maxWidth: constraints.maxWidth,
                        );
                      },
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(
                        color: ColorPallete.whiteSwan.color,
                        onPressed: () {
                          context.go("/home");
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              'Profile',
                              style: DefaultTypography.title.copyWith(
                                color: ColorPallete.whiteSwan.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacing.xl,
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
                Spacing.l,
                Text(
                  watcher.userProfileState.data?.name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF404040),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                  ),
                ),
                Spacing.l,
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Info User',
                    style: TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 74,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 130,
                              child: Text(
                                'Nama Lengkap',
                                style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              watcher.userProfileState.data?.name ?? '-',
                              style: const TextStyle(
                                color: Color(0xFF0A0A0A),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 130,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              watcher.userProfileState.data?.email ?? '-',
                              style: const TextStyle(
                                color: Color(0xFF0A0A0A),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 130,
                              child: Text(
                                'Role',
                                style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              watcher.userProfileState.data?.role.title ?? '-',
                              style: const TextStyle(
                                color: Color(0xFF0A0A0A),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacing.huge,
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final isConfirmed = await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                icon: SvgIcons.ionWarning(),
                                title: const Text('Logout Akun'),
                                content: const Text(
                                  'Apakah anda yakin ingin keluar dari aplikasi?',
                                ),
                                actionsAlignment: MainAxisAlignment.spaceBetween,
                                actions: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFF757575),
                                            ),
                                            foregroundColor: const Color(0xFF757575),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },
                                          child: const Text('Batal'),
                                        ),
                                      ),
                                      Spacing.s,
                                      Expanded(
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: ColorPallete.primaryBlue.color,
                                            foregroundColor: ColorPallete.paper.color,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context, true);
                                          },
                                          child: const Text('Ya, Keluar'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                          if (isConfirmed == true) {
                            // do logout
                            if (!context.mounted) return;
                            context.read<AuthViewmodel>().logout();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFFD84639),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                color: ColorPallete.danger.color,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Logout',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorPallete.danger.color,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
