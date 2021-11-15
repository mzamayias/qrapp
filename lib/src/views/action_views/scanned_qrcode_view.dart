import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../widgets/code_data_qrcode.dart';
import '../../widgets/code_data_string.dart';
import '../../widgets/code_type.dart';
import '../../widgets/page_blueprint.dart';

class ScannedQRCodeView extends StatefulWidget {
  final Barcode result;

  ScannedQRCodeView({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  _ScannedCodePageState createState() => _ScannedCodePageState();
}

class _ScannedCodePageState extends State<ScannedQRCodeView> {
  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'Scanned QR Code',
      showLeadingIconButton: true,
      leadingIconButton: IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () => Navigator.pop(context),
        color: const Color(0xff303030),
      ),
      trailingActions: [
        IconButton(
          icon: const Icon(Icons.share_rounded),
          color: const Color(0xff303030),
          tooltip: 'Share QR Code',
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('This feature is under development.'),
            ),
          ),
        ),
      ],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CodeType(type: 'Format:'),
            CodeDataString(data: widget.result.format.toString()),
            CodeType(type: 'Data:'),
            CodeDataString(data: widget.result.code!),
            CodeType(type: 'QR Code:'),
            CodeDataQRCode(data: widget.result.code),
          ],
        ),
      ),
    );
  }
}
