import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahunLahir;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);

  int _hitungUmur() {
    return DateTime.now().year - tahunLahir;
  }

  @override
  Widget build(BuildContext context) {
    final umur = _hitungUmur();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perkenalan'),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
