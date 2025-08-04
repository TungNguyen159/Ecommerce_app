import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_app/data/datasources/remote/apiservice.dart';
import 'package:shop_app/data/models/product_model.dart';
import 'package:shop_app/domain/entities/product.dart';
import 'package:shop_app/features/product/presentation/pages/profile_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.productId});
  final int productId;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Apiservice apiService = Apiservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackBind(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: apiService.getProductById(widget.productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No product found'));
          } else {
            final product = snapshot.data!;
            return DetailItem(product: product);
          }
        },
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({super.key, required this.product});
  final ProductModels product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            // Xử lý thêm vào giỏ hàng
          },
          child: const Text(
            "Thêm vào giỏ hàng",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh sản phẩm
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tên + Giá
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Mô tả
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Chip(
                label: Text(product.category),
                backgroundColor: Colors.grey.shade200,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                product.description,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
