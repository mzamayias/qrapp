import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qrapp/widgets/code_text.dart';

import 'package:qrapp/widgets/floaty_button.dart';
import 'package:qrapp/widgets/floaty_button_bar.dart';
import 'package:qrapp/widgets/format_text.dart';

class ScannedDialog extends StatefulWidget {
  final String format;
  final String code;
  final VoidCallback goBackAction;
  final VoidCallback shareAction;

  ScannedDialog({
    Key? key,
    required this.format,
    required this.code,
    required this.goBackAction,
    required this.shareAction,
  }) : super(key: key);

  @override
  _ScannedDialogState createState() => _ScannedDialogState();
}

class _ScannedDialogState extends State<ScannedDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 9,
      backgroundColor: Color(0xfff3f3f3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(21)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
            child: Text(
              'Scanned Data',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff303030),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
            child: Text(
              'Format:',
              style: TextStyle(
                color: Color(0xff303030),
                fontSize: 15,
              ),
            ),
          ),
          FormatText(format: widget.format),
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
            child: Text(
              'Data:',
              style: TextStyle(
                color: Color(0xff303030),
                fontSize: 15,
              ),
            ),
          ),
          CodeText(code: widget.code),
          FloatyButtonBar(
            children: [
              FloatyButton(
                tooltip: 'Go back',
                iconData: Icons.refresh_rounded,
                onPressed: widget.goBackAction,
              ),
              FloatyButton(
                tooltip: 'Share',
                iconData: Icons.share_rounded,
                onPressed: widget.shareAction,
              ),
            ],
          )
        ],
      ),
    );
  }
}