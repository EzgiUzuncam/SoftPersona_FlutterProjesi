# Mini Katalog

> Basit ve modern bir ürün katalog uygulaması (Flutter)

## Proje Hakkında

Mini Katalog, Flutter ile geliştirilmiş, ürünleri listeleyip detaylarını görebileceğiniz, arama ve filtreleme özelliği bulunan bir katalog uygulamasıdır. Mobil, web ve masaüstü platformlarında çalışabilir.

## Özellikler

- Ana sayfa ve ürün listeleme ekranı
- Ürünler için arama (filtreleme) özelliği
- Ürün detay sayfası (özellikler, açıklama, görsel)
- Responsive (farklı ekran boyutlarına uyumlu)
- Temiz ve modern arayüz

## Kurulum

1. Bu repoyu klonlayın:
   ```sh
   git clone <repo-url>
   ```
2. Gerekli paketleri yükleyin:
   ```sh
   flutter pub get
   ```
3. Uygulamayı başlatın:
   ```sh
   flutter run
   ```

## Klasör Yapısı

- `lib/screens/` : Ekranlar (ana sayfa, ürün listesi, ürün detayı)
- `lib/models/`  : Veri modelleri (Product)
- `lib/data/`    : Ürün verileri (örnek veri)
- `lib/widgets/` : Tekil widgetlar (ProductCard vb.)
- `assets/images/` : Ürün görselleri

## Kullanılan Teknolojiler
- [Flutter](https://flutter.dev/)
- Dart

## Özelleştirme
- `lib/data/product_data.dart` dosyasından ürünleri değiştirebilir veya yeni ürün ekleyebilirsiniz.
- Arayüzü özelleştirmek için ilgili widget dosyalarını düzenleyebilirsiniz.

## Lisans
MIT
