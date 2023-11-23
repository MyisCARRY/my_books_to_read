import 'package:flutter/material.dart';

/// Use only when one of children is Expanded
class ExpandedSingleChildScrollView extends StatelessWidget {
  const ExpandedSingleChildScrollView({
    required this.child,
    this.scrollDirection = Axis.vertical,
    Key? key,
  })  : assert(child is Row || child is Column),
        super(key: key);

  final Widget child;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        late final BoxConstraints boxConstraints;

        switch (scrollDirection) {
          case Axis.horizontal:
            boxConstraints = BoxConstraints(minWidth: constraint.maxWidth);
            break;
          case Axis.vertical:
            boxConstraints = BoxConstraints(minHeight: constraint.maxHeight);
            break;
        }

        return SingleChildScrollView(
          scrollDirection: scrollDirection,
          child: ConstrainedBox(
            constraints: boxConstraints,
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
      },
    );
  }
}
