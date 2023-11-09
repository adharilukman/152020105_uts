import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar profil
            CircleAvatar(
              radius: 80, // Sesuaikan ukuran gambar sesuai kebutuhan
              backgroundImage: AssetImage('assets/waduh.jpeg'), // Ganti dengan path gambar profil Anda
            ),
            SizedBox(height: 20),
            // Data profil
            Text(
              'Nama: Mr waduh',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Email: waduhh@mhs.itenas.ac.id',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'waduh gun shop',
              style: TextStyle(fontSize: 18),
            ),
            // Tambahkan data profil lainnya sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
