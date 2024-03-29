import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/widgets/home_page/exam_widgets/exam_result_dialog.dart';

class StartButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? buttonWidth;

  const StartButtonWidget({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.buttonWidth,
  }) : super(key: key);

  @override
  State<StartButtonWidget> createState() => _StartButtonWidgetState();
}

class _StartButtonWidgetState extends State<StartButtonWidget> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              widget.backgroundColor ?? Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          if (isClicked == true) {
            examResultDialogWidget(context, 1, 2, 0, 20, () {
              Navigator.of(context).pop();
            });
          } else {
            widget.onPressed();
          }
          setState(() {
            isClicked = true;
          });
        },
        child: Text(
          isClicked
              ? EvaluationConstants.viewReport
              : EvaluationConstants.start,
          style: TextStyle(
            fontSize: 16,
            color: widget.textColor ?? Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
