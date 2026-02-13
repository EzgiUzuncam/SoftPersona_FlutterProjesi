import 'package:flutter/material.dart';
import 'package:mini_katalog/models/product.model.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.title)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;
          final horizontal = isWide ? 48.0 : 16.0;
          final titleSize = isWide ? 32.0 : 26.0;
          final descSize = isWide ? 20.0 : 16.0;
          final buttonFont = isWide ? 20.0 : 16.0;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  child: AspectRatio(
                    aspectRatio: isWide ? 21 / 9 : 16 / 9,
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.broken_image,
                          size: 64,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(horizontal, 18, horizontal, 6),
                  child: Text(
                    widget.product.title,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontal),
                  child: Text(
                    widget.product.description,
                    style: TextStyle(fontSize: descSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(horizontal, 12, horizontal, 6),
                  child: Text(
                    "Fiyat: ${widget.product.price.toStringAsFixed(0)} ₺",
                    style: TextStyle(
                      fontSize: isWide ? 24 : 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontal),
                  child: Text(
                    'Açıklama',
                    style: TextStyle(
                      fontSize: isWide ? 22 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(horizontal),
                  child: Text(widget.product.description),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontal),
                  child: Text(
                    'Özellikler',
                    style: TextStyle(
                      fontSize: isWide ? 22 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontal),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.product.features.entries
                        .map(
                          (e) => SizedBox(
                            width: isWide ? 180 : 140,
                            child: _specCard(e.key, e.value),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontal),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cartCount++;
                      });
                    },
                    child: Text(
                      "Sepete Ekle ($cartCount)",
                      style: TextStyle(fontSize: buttonFont),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _specCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
