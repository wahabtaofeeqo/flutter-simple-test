import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {

  const EditProduct({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<EditProduct> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: const Text(
                'Edit Product',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            _buildForm()
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _createField('Name'),
          const SizedBox(height: 10,),
          _createField('Price'),
          const SizedBox(height: 10,),
          _createField('Weight'),
          const SizedBox(height: 10,),
          _createField('Description'),
          const SizedBox(height: 14,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('Update'),
                ),
              ),
            ),
          )
        ],
      )
    );
  }

  Widget _createField(label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: label,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.0
              )
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.0
              )
          ),
        ),
      ),
    );
  }
}