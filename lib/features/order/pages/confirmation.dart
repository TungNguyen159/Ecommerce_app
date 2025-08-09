import 'package:flutter/material.dart';
import 'package:shop_app/features/profile/pages/profile_page.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Confirmation"),
        automaticallyImplyLeading: false, // Ẩn nút back
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon thành công
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),

            // Tiêu đề
            Text(
              "Thank you for your order!",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Mô tả ngắn
            const Text(
              "Your order is being processed. You will receive a confirmation email shortly.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Nút quay lại trang chính
            MainButton(text: "Back to home",onPressed: (){
             Navigator.popUntil(context, (route) => route.isFirst);
            },)
          ],
        ),
      ),
    );
  }
}
