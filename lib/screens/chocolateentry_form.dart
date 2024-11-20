import 'dart:convert';
import 'package:bonagit_store/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:bonagit_store/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ChocolateentryForm extends StatefulWidget {
  const ChocolateentryForm({super.key});

  @override
  State<ChocolateentryForm> createState() => _ChocolateEntryFormPageState();
}

class _ChocolateEntryFormPageState extends State<ChocolateentryForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _type = "";
  int _cocoaRatio = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Tambah Chocolate',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Input field for Name
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value ?? ""; // Default to an empty string
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Product name can't be null!";
                    }
                    return null;
                  },
                ),
              ),

              // Input field for Price
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price (Dollars)",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value ?? '0') ?? 0; // Safely parse
                    });
                  },
                  validator: (String? value) {
                    final parsedValue = int.tryParse(value ?? '');
                    if (parsedValue == null || parsedValue < 1) {
                      return "Price must be a valid number greater than 0!";
                    }
                    return null;
                  },
                ),
              ),

              // Input field for Description
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? ""; // Default to empty string
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description can't be null!";
                    }
                    return null;
                  },
                ),
              ),

              // Input field for Type
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Type",
                    labelText: "Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _type = value ?? ""; // Default to empty string
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Type can't be null!";
                    }
                    return null;
                  },
                ),
              ),

              // Input field for Cocoa Ratio
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Cocoa Ratio (%)",
                    labelText: "Cocoa Ratio",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _cocoaRatio = int.tryParse(value ?? '0') ?? 0; // Safely parse
                    });
                  },
                  validator: (String? value) {
                    final parsedValue = int.tryParse(value ?? '');
                    if (parsedValue == null || parsedValue < 1) {
                      return "Cocoa Ratio must be a valid number greater than 0!";
                    }
                    return null;
                  },
                ),
              ),

              // Save Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Send data to Django and wait for the response
                        final response = await request.postJson(
                       
                          "http://127.0.0.1:8000/create-flutter/",
                            jsonEncode(<String, dynamic>{
                            'product_name': _name,
                            'price': _price.toString(),
                            'description': _description,
                            'type': _type,
                            'cocoa_ratio': _cocoaRatio.toString(),
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text("Product baru berhasil disimpan!"),
                            ));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Terdapat kesalahan, silakan coba lagi."),
                            ));
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
