import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    required this.onRefresh,
    final Key? key,
  }) : super(key: key);

  final void Function()? onRefresh;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        const Text("ERROR"),
        TextButton(
          onPressed: onRefresh,
          child: const Text("REFRESH"),
        ),
      ],
    );
  }
}
