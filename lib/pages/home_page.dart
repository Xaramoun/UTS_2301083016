// lib/screens/home_page.dart
import 'package:flutter/material.dart';
import '../models/peminjaman.dart';
import 'input_peminjaman.dart';
import 'daftar_peminjaman.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Peminjaman> daftarPinjaman = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Peminjaman'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Aplikasi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Input Peminjaman'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPeminjaman(
                      onPeminjamanAdded: (peminjaman) {
                        setState(() {
                          daftarPinjaman.add(peminjaman);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Daftar Peminjaman'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DaftarPeminjaman(
                      daftarPinjaman: daftarPinjaman,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome To Bank Adillah'),
      ),
    );
  }
}