import 'dart:ui';

sealed class Palette {
  Color get color;
}

enum ColorPallete implements Palette {
  primaryBlue(Color(0xFF1D8ADB)),
  paper(Color(0xFFFFFFFF)),
  disabled(Color(0xFF9E9E9E)),
  danger(Color(0xFFD84639)),
  whiteSwan(Color(0xFFFCFCFC)),
  ash(
    Color(0xFFC2C2C2),
  ),
  success(Color(0xFF67C69B)),
  mint(Color(0xFF97ECE5));

  //.. more colors

  const ColorPallete(this.color);

  @override
  final Color color;
}

enum TextPallete implements Palette {
  light(Color(0xFFFFFFFF)),
  dark(Color(0xFF0A0A0A)),
  danger(Color(0xFFD84639)),
  warning(Color(0xFFE7833A)),
  success(Color(0xFF1BAA69)),
  messageContent(Color(0xFF757575)),
  link(Color(0xFF1D8ADB));

  const TextPallete(this.color);

  @override
  final Color color;
}
