// lib/screens/daftar_peminjaman_page.dart
import 'package:flutter/material.dart';
import '../models/peminjaman.dart';
import 'detail_peminjaman.dart';

class DaftarPeminjaman extends StatelessWidget {
  final List<Peminjaman> daftarPinjaman;

  const DaftarPeminjaman({Key? key, required this.daftarPinjaman})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Peminjaman'),
      ),
      body: ListView.builder(
        itemCount: daftarPinjaman.length,
        itemBuilder: (context, index) {
          final peminjaman = daftarPinjaman[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Nama Nasabah: ${peminjaman.namaNasabah}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kode Peminjaman: ${peminjaman.kodePeminjaman}'),
                  Text('Jumlah Pinjaman: Rp${peminjaman.jumlahPinjaman}'),
                  Text('Lama Pinjaman: ${peminjaman.lamaPinjaman} bulan'),
                  Text('Angsuran per Bulan: Rp${peminjaman.angsuranPerBulan.toStringAsFixed(0)}'),
                  Text('Total Hutang: Rp${peminjaman.totalHutang.toStringAsFixed(0)}'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPeminjaman(peminjaman: peminjaman),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}