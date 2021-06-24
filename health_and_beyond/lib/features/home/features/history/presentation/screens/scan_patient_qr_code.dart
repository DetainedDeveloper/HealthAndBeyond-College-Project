import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPatientQRCode extends StatefulWidget {
  final BuildContext context;

  ScanPatientQRCode({required this.context});

  @override
  _ScanPatientQRCodeState createState() => _ScanPatientQRCodeState(context: context);
}

class _ScanPatientQRCodeState extends State<ScanPatientQRCode> {
  final BuildContext context;

  _ScanPatientQRCodeState({required this.context});

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _flashIsOn = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      if (result != null) {
        controller.stopCamera();
        final String uid = result!.code;
        Future.delayed(
          Duration(seconds: 1),
          () => Navigator.pop(context, uid),
        );
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.scanPatientQRCode),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: AppColors.activeColor,
                  borderRadius: AppDimensions.d8,
                  borderLength: AppDimensions.d32,
                  borderWidth: AppDimensions.d8,
                  cutOutSize: _size.width / 2,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: _size.width / 1.5),
                child: Text(
                  result != null ? result!.code : AppStrings.scanPatientQRCode,
                  style: AppStyles.textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: _size.width / 1.5),
                child: IconButton(
                  icon: Icon(
                    _flashIsOn ? Icons.highlight : Icons.highlight_outlined,
                    size: AppDimensions.d32,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    controller?.toggleFlash();
                    setState(() {
                      _flashIsOn = !_flashIsOn;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
