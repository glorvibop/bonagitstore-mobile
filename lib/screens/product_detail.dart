import 'package:bonagit_store/models/chocolate_entry.dart';
import 'package:bonagit_store/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final String productID;

  const ProductDetailPage({super.key, required this.productID});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Future<ChocolateProduct> fetchProductDetail(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/${widget.productID}/');

    // Decode the response into JSON and convert it into a ChocolateProduct object
    return ChocolateProduct.fromJson(response[0]);
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProductDetail(request),
        builder: (context, AsyncSnapshot<ChocolateProduct> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error loading product details.',
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'Product not found.',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            );
          } else {
            final product = snapshot.data!;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      product.fields.productName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("Price: \$${product.fields.price}"),
                    const SizedBox(height: 8),
                    Text("Description: ${product.fields.description}"),
                    const SizedBox(height: 8),
                    Text("Type: ${product.fields.type}"),
                    const SizedBox(height: 8),
                    Text("Cocoa Ratio: ${product.fields.cocoaRatio}%"),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Back'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
