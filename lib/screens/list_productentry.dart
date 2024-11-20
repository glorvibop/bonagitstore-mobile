import 'package:bonagit_store/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:bonagit_store/models/chocolate_entry.dart';
import 'package:bonagit_store/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ChocolateProductPage extends StatefulWidget {
  const ChocolateProductPage({super.key});

  @override
  State<ChocolateProductPage> createState() => _ChocolateProductPageState();
}

class _ChocolateProductPageState extends State<ChocolateProductPage> {
  Future<List<ChocolateProduct>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object ChocolateProduct
    List<ChocolateProduct> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ChocolateProduct.fromJson(d));
      }
    }
    return listProduct;
  }

 @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Daftar Chocolate'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot<List<ChocolateProduct>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error fetching product data.',
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No products available.',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            );
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
            );
          }
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ChocolateProduct product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to ProductDetailPage with the product's ID
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(productID: product.pk),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.productName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Price: \$${product.fields.price}"),
            const SizedBox(height: 8),
            Text("Description: ${product.fields.description}"),
          ],
        ),
      ),
    );
  }
}
