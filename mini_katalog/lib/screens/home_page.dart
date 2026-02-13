import 'package:flutter/material.dart';
import 'product_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            final iconSize = isWide ? 160.0 : 100.0;
            final padding = isWide ? 48.0 : 24.0;
            final buttonHeight = isWide ? 70.0 : 55.0;
            return Center(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: iconSize,
                        color: Colors.black87,
                      ),
                      SizedBox(height: isWide ? 48 : 32),
                      Text(
                        "Mini Katalog",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: isWide ? 38 : null,
                            ),
                      ),
                      SizedBox(height: isWide ? 18 : 12),
                      Text(
                        "Yeni ürünleri keşfetmeye hazır mısın?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: isWide ? 18 : null,
                        ),
                      ),
                      SizedBox(height: isWide ? 64 : 48),
                      SizedBox(
                        height: buttonHeight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                isWide ? 24 : 16,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ProductListPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Keşfet",
                            style: TextStyle(fontSize: isWide ? 20 : 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
