import 'package:flutter/material.dart';

void main() {
  runApp(const Quiz3());
}

class Quiz3 extends StatefulWidget {
  const Quiz3({super.key});

  @override
  State<Quiz3> createState() => _Quiz3State();
}

class _Quiz3State extends State<Quiz3> {

  final List<String> items = [];
  var textController = TextEditingController();
  Color textColor = Colors.black;

  void addItem() {
    setState(() {
      String newItem = textController.text;
      if (newItem.isNotEmpty) {
        items.add(newItem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Item"
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: addItem, 
                  icon: Icon(Icons.add), 
                  label: Text("Add"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      if (index % 2 == 0) {
                        textColor = Colors.black;
                      } else {
                        textColor = Colors.red;
                      }
                      return ListTile(
                        title: Text(items[index],
                        style: TextStyle(
                          color: textColor, 
                          fontSize: 18),
                        ),
                      );
                    }
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