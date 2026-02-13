import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/product_card.dart';
import '../models/product.model.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late List<Product> _filteredProducts;

  @override
  void initState() {
    super.initState();
    _filteredProducts = productList;
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = productList
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discover",
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_bag_outlined),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "Find your perfect device.",
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // SEARCH
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: "Search products",
                          border: InputBorder.none,
                        ),
                        onChanged: _filterProducts,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // BANNER
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "GIFT STORE",
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Container(
                            width: 8,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // GRID
                    LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = 2;
                        double aspectRatio = 0.72;
                        if (constraints.maxWidth > 900) {
                          crossAxisCount = 4;
                          aspectRatio = 0.85;
                        } else if (constraints.maxWidth > 600) {
                          crossAxisCount = 3;
                          aspectRatio = 0.8;
                        }
                        return GridView.builder(
                          itemCount: _filteredProducts.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                childAspectRatio: aspectRatio,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                          itemBuilder: (context, index) {
                            return ProductCard(
                              product: _filteredProducts[index],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
