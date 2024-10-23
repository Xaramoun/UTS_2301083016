import 'package:flutter/material.dart';
import '../models/peminjaman.dart';
import 'input_peminjaman.dart';
import 'daftar_peminjaman.dart';
import 'detail_peminjaman.dart';

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
              leading: const Icon(Icons.add),
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
              leading: const Icon(Icons.list),
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
      body: Center(
        child: daftarPinjaman.isEmpty
            ? const Text(
                'Belum ada data peminjaman',
                style: TextStyle(fontSize: 18),
              )
            : ListView.builder(
                itemCount: daftarPinjaman.length,
                itemBuilder: (context, index) {
                  final peminjaman = daftarPinjaman[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(peminjaman.namaNasabah),
                      subtitle: Text(
                        'Pinjaman: Rp${peminjaman.jumlahPinjaman}',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPeminjaman(
                              peminjaman: peminjaman,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
        child: const Icon(Icons.add),
        tooltip: 'Tambah Peminjaman',
      ),
    );
  }
}
