import 'package:flutter/material.dart';
import 'orderpage.dart'; // تأكد من المسار حسب مشروعك

class ItemPage extends StatefulWidget {
  final String username;

  const ItemPage(this.username, {super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Map<String, String>? selectedItem;

  List<Map<String, String>> items = [
    {"name": "Espresso", "img": "assets/download (7).jpeg"},
    {"name": "Americano", "img": "assets/download (8).jpeg"},
    {"name": "Latte", "img": "assets/download (9).jpeg"},
    {"name": "Cappuccino", "img": "assets/download (10).jpeg"},
    {"name": "Macchiato", "img": "assets/download (11).jpeg"},
    {"name": "Mocha", "img": "assets/download (12).jpeg"},
    {"name": "Flat White", "img": "assets/download (13).jpeg"},
    {"name": "Ristretto", "img": "assets/download (14).jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "WHAT’S\nYOUR MOOD TODAY?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isSelected = selectedItem != null &&
                      selectedItem!["name"] == item["name"];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = item;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color.fromARGB(255, 210, 183, 149)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item["img"]!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              item["name"]!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: isSelected ? Colors.orange : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF51382C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 55),
                ),
                onPressed: () {
                  if (selectedItem == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a drink first!"),
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Orderpage(
                        name: selectedItem!["name"]!,
                        imagePath: selectedItem!["img"]!,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Order Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
