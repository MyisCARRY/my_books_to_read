import 'package:flutter/material.dart';
import 'package:my_books_to_read/core/style/text_styles.dart';

class FontTestWidget extends StatelessWidget {
  const FontTestWidget({
    required this.font,
    Key? key,
  }) : super(key: key);

  final CustomTextStyle font;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(_alphabet, style: roboto.s16.w100.colorBlack),
            Text(_alphabet, style: roboto.s16.w200.colorBlack),
            Text(_alphabet, style: roboto.s16.w300.colorBlack),
            Text(_alphabet, style: roboto.s16.w400.colorBlack),
            Text(_alphabet, style: roboto.s16.w500.colorBlack),
            Text(_alphabet, style: roboto.s16.w600.colorBlack),
            Text(_alphabet, style: roboto.s16.w700.colorBlack),
            Text(_alphabet, style: roboto.s16.w800.colorBlack),
            Text(_alphabet, style: roboto.s16.w900.colorBlack),
          ],
        ),
      ),
    );
  }

  String get _rawAlphabet =>
      'a, ą, b, c, ć, d, e, ę, f, g, h, i, j, k, l, ł, m, n, ń, o, ó, p, q, r, s, ś, t, u, v, w, x, y, z, ź, ż';

  String get _alphabet => _rawAlphabet.replaceAll(' ', '').replaceAll(',', '');
}
