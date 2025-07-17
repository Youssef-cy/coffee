import 'package:flutter/material.dart';
import 'package:shop/item.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final Color backgroundColor = const Color.fromARGB(255, 234, 223, 209);
  final Color brown = const Color(0xFF51382C);
  final Color beige = const Color(0xFFF4EDE4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Container(
                height: 800,
                width: 400,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 385),
                  child: Stack(
                    children: [
                      const Text(
                        "Grab a ",
                        style: TextStyle(
                          fontSize: 55.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 210, 183, 149),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Text(
                          "coffee!",
                          style: TextStyle(
                            fontSize: 70.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C362D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // صورة القهوة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 450,
                height: 372,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/coffee.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  color: beige,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            // الفورم: الاسم و رقم الهاتف
            Padding(
              padding: const EdgeInsets.only(top: 525.0, left: 2.0, right: 2.0),
              child: Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildTextField("Enter your name", nameController),
                    const SizedBox(height: 10),
                    _buildTextField("Enter your phone number", phoneController),
                  ],
                ),
              ),
            ),

            // زر الدخول
            Padding(
              padding: const EdgeInsets.only(top: 700.0, left: 8, right: 8),
              child: ElevatedButton(
                onPressed: () {
                  String username = nameController.text.trim();
                  String phone = phoneController.text.trim();

                  if (username.isEmpty || phone.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "please enter your name and phone number",
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItemPage(username)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: brown,
                  minimumSize: const Size(100, 50),
                  fixedSize: const Size(500, 75),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
