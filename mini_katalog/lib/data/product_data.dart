import 'package:mini_katalog/models/product.model.dart';

List<Product> productList = [
  Product(
    id: 1,
    title: "Akıllı Telefon",
    image: "assets/images/phone.png",
    price: 15999,
    description: "Yüksek performanslı modern akıllı telefon.",
    features: {
      "Ekran": "6.5 inç RETİNA",
      "Kamera": "48 MP",
      "Batarya": "5000 mAh",
      "Renk": "Siyah",
    },
  ),
  Product(
    id: 2,
    title: "Laptop",
    image: "assets/images/laptop.png",
    price: 28999,
    description: "Yazılım geliştirme için ideal laptop.",
    features: {
      "Ekran": "14.2 Liquid Retina XDR Ekran",
      "Çip": "Apple M5 çip",
      "RAM": "16 GB",
      "Depolama": "512 GB",
    },
  ),
  Product(
    id: 3,
    title: "Kulaklık",
    image: "assets/images/headphones.png",
    price: 2499,
    description: "Gürültü önleyici bluetooth kulaklık.",
    features: {
      "Bağlantı": "Bluetooth 5.2",
      "Pil": "30 saat",
      "Ağırlık": "250 gr",
      "Renk": "Siyah, Gri",
    },
  ),
  Product(
    id: 4,
    title: "Akıllı Saat",
    image: "assets/images/watch.png",
    price: 4999,
    description: "Sağlık ve spor takibi için akıllı saat.",
    features: {
      "Ekran": "1.4 inç AMOLED",
      "Su Geçirmezlik": "5 ATM",
      "Pil": "14 gün",
      "Renk": "Siyah, Gri, Kahverengi, Kırmızı",
    },
  ),
];
