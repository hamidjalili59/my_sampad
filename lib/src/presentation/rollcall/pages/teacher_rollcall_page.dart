import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_model.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/rollcall/bloc/teacher_rollcall/teacher_rollcall_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class TeacherRollcallPage extends StatefulWidget {
  const TeacherRollcallPage({super.key});

  @override
  State<TeacherRollcallPage> createState() => _TeacherRollcallPageState();
}

class _TeacherRollcallPageState extends State<TeacherRollcallPage> {
  TeacherRollcallBloc bloc = getIt.get<TeacherRollcallBloc>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const TeacherRollcallEvent.onStartPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: QRView(
          overlay: QrScannerOverlayShape(
              borderColor: const Color.fromARGB(255, 177, 255, 177),
              borderLength: 20,
              borderRadius: 6.sp,
              overlayColor:
                  const Color.fromARGB(255, 172, 255, 172).withOpacity(0.3)),
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        if (jsonDecode(scanData.code!) != null) {
          Map<String, dynamic> tempData = jsonDecode(scanData.code!);
          if (tempData.containsKey('phoneNumber') &&
              tempData.containsKey('mobile_ID')) {
            controller.pauseCamera();
            TeacherRollcall rollcall = TeacherRollcall(
                absent: false,
                phoneNumber: tempData['phoneNumber'],
                schoolId: tempData['school_ID']);
            bloc.add(TeacherRollcallEvent.addRollcall(rollcall));
          }
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
