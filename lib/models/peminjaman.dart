// lib/models/peminjaman.dart
class Peminjaman {
  final String kode;
  final String nama;
  final String kodePeminjaman;
  final DateTime tanggal;
  final String kodeNasabah;
  final String namaNasabah;
  final double jumlahPinjaman;
  final int lamaPinjaman;
  late final double bunga;
  late final double angsuranPokok;
  late final double bungaPerBulan;
  late final double angsuranPerBulan;
  late final double totalHutang;

  Peminjaman({
    required this.kode,
    required this.nama,
    required this.kodePeminjaman,
    required this.tanggal,
    required this.kodeNasabah,
    required this.namaNasabah,
    required this.jumlahPinjaman,
    required this.lamaPinjaman,
  }) {
    hitungPinjaman();
  }

  void hitungPinjaman() {
    bunga = jumlahPinjaman * 0.12; // 12% dari jumlah pinjaman
    angsuranPokok = jumlahPinjaman / lamaPinjaman;
    bungaPerBulan = bunga / lamaPinjaman;
    angsuranPerBulan = bungaPerBulan + angsuranPokok;
    totalHutang = jumlahPinjaman + bunga;
  }
}