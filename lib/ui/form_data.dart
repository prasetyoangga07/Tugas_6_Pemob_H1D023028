import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/tampil_data.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  void _simpan() {
    final nama = _namaController.text.trim();
    final nim = _nimController.text.trim();
    final tahun = int.tryParse(_tahunLahirController.text.trim()) ?? 0;

    if (nama.isEmpty || nim.isEmpty || tahun == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lengkapi semua data terlebih dahulu')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TampilData(nama: nama, nim: nim, tahunLahir: tahun),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data'),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textboxNama(),
            const SizedBox(height: 10),
            _textboxNim(),
            const SizedBox(height: 10),
            _textboxTahunLahir(),
            const SizedBox(height: 20),
            Center(child: _tombolSimpan()),
          ],
        ),
      ),
    );
  }

  Widget _textboxNama() {
    return TextField(
      controller: _namaController,
      decoration: const InputDecoration(
        labelText: 'Nama',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _textboxNim() {
    return TextField(
      controller: _nimController,
      decoration: const InputDecoration(
        labelText: 'NIM',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _textboxTahunLahir() {
    return TextField(
      controller: _tahunLahirController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Tahun Lahir',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _tombolSimpan() {
    return SizedBox(
      width: 120,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          foregroundColor: Colors.white, 
        ),
        onPressed: _simpan,
        child: const Text(
          'Simpan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

}
