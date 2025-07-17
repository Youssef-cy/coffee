import 'package:flutter/material.dart';

class Orderpage extends StatefulWidget {
  final String name;
  final String imagePath;

  const Orderpage({super.key, required this.name, required this.imagePath});

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  String? selectedSize;
  String? selectedMilk;

  Color brown = const Color(0xFF51382C);
  Color beige = const Color(0xFFF4EADC);
  Color lightBrown = const Color(0xFFD9C1A0);

  bool get isReadyToOrder => selectedSize != null && selectedMilk != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      body: SafeArea(
        child: Column(
          children: [
            // الصورة والاسم
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: lightBrown,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      widget.imagePath,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Hot Coffee",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Delicious coffee made from fresh beans.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Your preferences
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("Your preferences"),

                    _sectionSubtitle("Size"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _choiceChip("S", "Standart", selectedSize, (val) {
                          setState(() => selectedSize = val);
                        }),
                        _choiceChip("M", "Medium", selectedSize, (val) {
                          setState(() => selectedSize = val);
                        }),
                        _choiceChip("L", "XXL", selectedSize, (val) {
                          setState(() => selectedSize = val);
                        }),
                      ],
                    ),

                    const SizedBox(height: 20),
                    _sectionSubtitle("Milk"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _iconChoice(
                          Icons.no_food,
                          "Without",
                          selectedMilk,
                          (val) => setState(() => selectedMilk = val),
                        ),
                        _iconChoice(
                          Icons.local_cafe,
                          "Regular",
                          selectedMilk,
                          (val) => setState(() => selectedMilk = val),
                        ),
                        _iconChoice(
                          Icons.rice_bowl,
                          "Coconut",
                          selectedMilk,
                          (val) => setState(() => selectedMilk = val),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed:
                    isReadyToOrder
                        ? () {
                          // اكشن الطلب هنا
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Order Placed Successfully!"),
                            ),
                          );
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: brown,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
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

  Widget _sectionTitle(String text) => Text(
    text,
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: brown),
  );

  Widget _sectionSubtitle(String text) => Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
    child: Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );

  Widget _choiceChip(
    String label,
    String desc,
    String? groupValue,
    Function(String) onTap,
  ) {
    final isSelected = groupValue == label;
    return GestureDetector(
      onTap: () => onTap(label),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: isSelected ? brown : Colors.grey.shade300,
            child: Text(
              label,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          ),
          const SizedBox(height: 5),
          Text(desc, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _iconChoice(
    IconData icon,
    String label,
    String? groupValue,
    Function(String) onTap,
  ) {
    final isSelected = groupValue == label;
    return GestureDetector(
      onTap: () => onTap(label),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: isSelected ? brown : Colors.grey.shade300,
            child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
