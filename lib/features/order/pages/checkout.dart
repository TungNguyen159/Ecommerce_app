import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/features/cart/pages/cart_page.dart';
import 'package:shop_app/features/profile/pages/profile_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool useDefaultAddress = true;
  String paymentMethod = "COD";
  void payment() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    await Future.delayed(const Duration(seconds: 2));

    context.push("/confirmation");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
        leading: BackBind(
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Địa chỉ giao hàng
            const Text(
              "Delivery Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.deepOrange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Nguyen Van A",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("123 Nguyen Trai, Hanoi, Vietnam"),
                        Text("Phone: 0123 456 789"),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const SizedBox(height: 16),

            // Phương thức thanh toán
            const Text(
              "Billing details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BillingDetails(
              totalItems: 5,
              itemsPrice: 100.0,
              shippingFee: 5.0,
              tax: 10.0,
            ),

            const SizedBox(height: 16),

            // Phương thức thanh toán
            const Text(
              "Methods pay",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildPaymentOption("Cash on Delivery", "COD"),
            _buildPaymentOption("VNPay", "VNPAY"),

            const SizedBox(height: 20),

            // Nút đặt hàng
            MainButton(text: "Order", onPressed: payment),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: paymentMethod,
      title: Text(title),
      onChanged: (val) {
        setState(() {
          paymentMethod = val!;
        });
      },
    );
  }
}
