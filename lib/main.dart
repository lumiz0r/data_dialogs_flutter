import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void showSimpleDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Simple Dialog Test'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Opció 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Opció 2'),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Això es una SnackBar'),
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          color: Colors.yellow, // Change the color of the bottom sheet
          child: const Center(
            child: Text('Això es un Modal Bottom Sheet'),
          ),
        );
      },
    );
  }

  void showAlertDialog(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar el valor d'un camp"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              showAlertDialog(myController.text);
            },
            tooltip: "Mostrar el valor del camp",
            backgroundColor: Colors.blue, // Change button color
            child: const Icon(Icons.text_fields),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: showSimpleDialog,
            tooltip: 'Mostrar Simple Dialog',
            backgroundColor: Colors.green, // Change button color
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: showSnackBar,
            tooltip: 'Mostrar SnackBar',
            backgroundColor: Colors.red, // Change button color
            child: const Icon(Icons.message),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: showBottomSheet,
            tooltip: 'Mostrar Bottom Sheet',
            backgroundColor: Colors.orange, // Change button color
            child: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCustomForm(),
    );
  }
}
