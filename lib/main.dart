import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;


void main()=> runApp(hardik());

class hardik extends StatefulWidget {
  const hardik({Key? key}) : super(key: key);

  @override
  State<hardik> createState() => _hardikState();
}

class _hardikState extends State<hardik> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: runn
          , child:null),
        ),
      ),
    );
  }
}

Future<pw.Document> generateInvoice() async {
  final pdf = pw.Document();

  // Add the first page
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text('Hardik'),
        ); // Replace this with your invoice design
      },
    ),
  );

  return pdf;
}

void runn() async {
  final invoice = await generateInvoice();
  final bytes = await invoice.save();
  final pdfPath = '${(await getApplicationDocumentsDirectory()).path}/invoice.pdf';
  final file = File(pdfPath);
  print(pdfPath);
  await file.writeAsBytes(bytes);
}


