import 'package:bonagit_store/screens/list_productentry.dart';
import 'package:flutter/material.dart';
import 'package:bonagit_store/screens/menu.dart';
import 'package:bonagit_store/screens/chocolateentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: const Column(
            children: [
              Text(
                'Bonagit Store',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Search all the premium chocolates here!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
              ),
            ],
          ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Tambah Produk'),
              // Bagian redirection ke 
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChocolateentryForm(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text('Lihat Daftar Chocolate'),
              onTap: () {
                  // Route menu ke halaman chocolate entry
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChocolateProductPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}