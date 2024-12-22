import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class QRGeneratorScreen extends StatefulWidget {
  final String patientId;

  const QRGeneratorScreen({
    Key? key,
    required this.patientId,
  }) : super(key: key);

  @override
  _QRGeneratorScreenState createState() => _QRGeneratorScreenState();
}

class _QRGeneratorScreenState extends State<QRGeneratorScreen> {
  String qrData = '';
  bool showQR = false;
  bool isLoading = false;

  Future<void> _generateQRCode() async {
    setState(() {
      isLoading = true;
    });

    try {
      final DocumentSnapshot patientDoc = await FirebaseFirestore.instance
          .collection('patients1')
          .doc(widget.patientId)
          .get();

      if (!patientDoc.exists) {
        throw 'Patient not found';
      }

      Map<String, dynamic> patientData = patientDoc.data() as Map<String, dynamic>;
      List<dynamic> prescriptions = patientData['prescriptions'] ?? [];

      String prescriptionJson = jsonEncode({
        'name': patientData['name'],
        'prescriptions': prescriptions,
        'generatedAt': DateTime.now().toIso8601String(),
      });

      setState(() {
        qrData = prescriptionJson;
        showQR = true;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error generating QR code: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFF009688),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 13,
              bottom: 10,
              left: 20,
              right: 20,
            ),
            child: Text(
              'QR Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isLoading)
                    CircularProgressIndicator(color: Colors.teal)
                  else if (!showQR)
                    ElevatedButton(
                      onPressed: _generateQRCode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                      child: Text(
                        'Generate QR Code',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  if (showQR && !isLoading) ...[
                    IconButton(
                      icon: Icon(Icons.refresh, size: 30),
                      onPressed: _generateQRCode,
                      color: Colors.teal,
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20),
                      child: QrImageView(
                        data: qrData,
                        size: 200,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}