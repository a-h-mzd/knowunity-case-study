import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class KnowunityTextField extends StatelessWidget {
  final double minHeight;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final void Function()? onTap;
  final void Function()? onEditingComplete;

  const KnowunityTextField({
    super.key,
    this.minHeight = 0,
    this.focusNode,
    required this.controller,
    this.onTap,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
      ),
      child: CupertinoTextField.borderless(
        onTap: onTap,
        maxLines: null,
        focusNode: focusNode,
        controller: controller,
        onEditingComplete: onEditingComplete,
        textInputAction: TextInputAction.done,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: TextCapitalization.sentences,
        inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      ),
    );
  }
}
