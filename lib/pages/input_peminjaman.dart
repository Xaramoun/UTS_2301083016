import 'package:flutter/material.dart';
import '../models/peminjaman.dart';

class InputPeminjaman extends StatefulWidget {
  final Function(Peminjaman) onPeminjamanAdded;

  const InputPeminjaman({Key? key, required this.onPeminjamanAdded})
      : super(key: key);

  @override
  _InputPeminjamanPageState createState() => _InputPeminjamanPageState();
}

class _InputPeminjamanPageState extends State<InputPeminjaman> {
  final _formKey = GlobalKey<FormState>();
  final _kodeController = TextEditingController();
  final _namaController = TextEditingController();
  final _kodePeminjamanController = TextEditingController();
  final _kodeNasabahController = TextEditingController();
  final _namaNasabahController = TextEditingController();
  final _jumlahPinjamanController = TextEditingController();
  final _lamaPinjamanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Peminjaman'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _kodeController,
              decoration: const InputDecoration(labelText: 'Kode'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Harap isi kode';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Harap isi nama';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _kodePeminjamanController,
              decoration: const InputDecoration(labelText: 'Kode Peminjaman'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Harap isi kode peminjaman';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _kodeNasabahController,
              decoration: const InputDecoration(labelText: 'Kode Nasabah'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Harap isi kode nasabah';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _namaNasabahController,
              decoration: const InputDecoration(labelText: 'Nama Nasabah'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Harap isi nama nasabah';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _jumlahPinjamanController,
              decoration: const InputDecoration(labelText: 'Jumlah Pinjaman'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Harap isi jumlah pinjaman';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _lamaPinjamanController,
              decoration: const InputDecoration(labelText: 'Lama Pinjaman (Bulan)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Harap isi lama pinjaman';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final peminjaman = Peminjaman(
                    kode: _kodeController.text,
                    nama: _namaController.text,
                    kodePeminjaman: _kodePeminjamanController.text,
                    tanggal: DateTime.now(),
                    kodeNasabah: _kodeNasabahController.text,
                    namaNasabah: _namaNasabahController.text,
                    jumlahPinjaman: double.parse(_jumlahPinjamanController.text),
                    lamaPinjaman: int.parse(_lamaPinjamanController.text),
                  );
                  widget.onPeminjamanAdded(peminjaman);
                  Navigator.pop(context);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _kodeController.dispose();
    _namaController.dispose();
    _kodePeminjamanController.dispose();
    _kodeNasabahController.dispose();
    _namaNasabahController.dispose();
    _jumlahPinjamanController.dispose();
    _lamaPinjamanController.dispose();
    super.dispose();
  }
}