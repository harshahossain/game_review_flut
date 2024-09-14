import 'package:flutter/material.dart';

class AddGamePage extends StatefulWidget {
  const AddGamePage({super.key});

  @override
  _AddGamePageState createState() => _AddGamePageState();
}

class _AddGamePageState extends State<AddGamePage> {
  final _formKey = GlobalKey<FormState>();
  String? _gameName;
  int _rating = 1;
  String? _review;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Game Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Game Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the game name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _gameName = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Review'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a review';
                  }
                  return null;
                },
                onSaved: (value) {
                  _review = value;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<int>(
                value: _rating,
                decoration: const InputDecoration(labelText: 'Rating'),
                items: List.generate(5, (index) => index + 1).map((rating) {
                  return DropdownMenuItem<int>(
                    value: rating,
                    child: Text(rating.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _rating = value ?? 1;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // Save the review
                    Navigator.of(context).pop(); // Go back to the previous screen
                  }
                },
                child: const Text('Submit Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
