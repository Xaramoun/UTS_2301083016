// lib/screens/detail_peminjaman_page.dart
import 'package:flutter/material.dart';
import '../models/peminjaman.dart';

class DetailPeminjaman extends StatelessWidget {
  final Peminjaman peminjaman;

  const DetailPeminjaman({Key? key, required this.peminjaman})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Peminjaman'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kode: ${peminjaman.kode}'),
                Text('Nama: ${peminjaman.nama}'),
                Text('Kode Peminjaman: ${peminjaman.kodePeminjaman}'),
                Text('Tanggal: ${peminjaman.tanggal.toString()}'),
                Text('Kode Nasabah: ${peminjaman.kodeNasabah}'),
                Text('Nama Nasabah: ${peminjaman.namaNasabah}'),
                Text('Jumlah Pinjaman: Rp${peminjaman.jumlahPinjaman}'),
                Text('Lama Pinjaman: ${peminjaman.lamaPinjaman} bulan'),
                Text('Bunga: Rp${peminjaman.bunga.toStringAsFixed(0)}'),
                Text('Angsuran Pokok: Rp${peminjaman.angsuranPokok.toStringAsFixed(0)}'),
                Text('Bunga per Bulan: Rp${peminjaman.bungaPerBulan.toStringAsFixed(0)}'),
                Text('Angsuran per Bulan: Rp${peminjaman.angsuranPerBulan.toStringAsFixed(0)}'),
                Text('Total Hutang: Rp${peminjaman.totalHutang.toStringAsFixed(0)}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}