import 'package:flutter/material.dart';
import 'package:bonagit_store/widgets/left_drawer.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _type = "";
  int _cocoaRatio = 0;
  int _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk Chocolate',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Name tidak boleh kosong!";
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
                      hintText: "Price",
                      labelText: "Price",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        _price = int.tryParse(value ?? '0')!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty || int.tryParse(value) == null) {
                        return "Price harus berupa angka!";
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
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Description tidak boleh kosong!";
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
                        _type = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Type tidak boleh kosong!";
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
                      hintText: "Cocoa Ratio",
                      labelText: "Cocoa Ratio",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        _cocoaRatio = int.tryParse(value ?? '0')!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty || int.tryParse(value) == null) {
                        return "Cocoa Ratio harus berupa angka!";
                      }
                      return null;
                    },
                  ),
                ),

                // Input field for Amount
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Amount",
                      labelText: "Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.tryParse(value ?? '0')!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty || int.tryParse(value) == null) {
                        return "Amount harus berupa angka!";
                      }
                      return null;
                    },
                  ),
                ),

                // Submit Button with alignment
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Show dialog on successful validation
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Produk berhasil disimpan'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $_name'),
                                      Text('Price: $_price'),
                                      Text('Description: $_description'),
                                      Text('Type: $_type'),
                                      Text('Cocoa Ratio: $_cocoaRatio'),
                                      Text('Amount: $_amount'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _formKey.currentState!.reset();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text("Save", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}