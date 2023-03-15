import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
    name,
    category,
    imageUrl,
    price,
  ];

  static List<Product> products = [
    // Dental Floss
    const Product(
      name: 'Aim',
      category: 'Dental Floss',
      imageUrl: 'https://www.nwawholesaler.com/wp-content/uploads/2020/01/AIM-FLOSS-PICS.png',
      price: 200,
    ),
    const Product(
      name: 'Oral B',
      category: 'Dental Floss',
      imageUrl: 'https://res.cloudinary.com/mtree/image/upload/f_auto,q_auto/OralB_GB/en-gb/-/media/OralB_GB/Images/Products/OralBEssentialMintFloss/Oral-B-Essential-Floss-Mint-Waxed_1200x1200.png?w=118&v=1-201704250914',
      price: 150,
    ),
    const Product(
      name: 'Colgate',
      category: 'Dental Floss',
      imageUrl: 'https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_690,h_700/a_ignore,w_690,h_700,c_pad,q_auto,f_auto/v1617170648/dgnwj2n8ld8ojvolrrpq.jpg',
      price: 130,
    ),
    // Toothbrush
    const Product(
      name: 'Colgate',
      category: 'Toothbrush',
      imageUrl: 'https://res.cloudinary.com/mtree/image/upload/f_auto,q_auto/OralB_GB/en-gb/-/media/OralB_GB/Images/Products/OralBEssentialMintFloss/Oral-B-Essential-Floss-Mint-Waxed_1200x1200.png?w=118&v=1-201704250914',
      price: 200,
    ),
    const Product(
      name: 'Oral B',
      category: 'Toothbrush',
      imageUrl: 'https://res.cloudinary.com/mtree/image/upload/f_auto,q_auto/OralB_GB/en-gb/-/media/OralB_GB/Images/Products/OralBEssentialMintFloss/Oral-B-Essential-Floss-Mint-Waxed_1200x1200.png?w=118&v=1-201704250914',
      price: 150,
    ),
    const Product(
      name: 'Mr. White',
      category: 'Toothbrush',
      imageUrl: 'https://res.cloudinary.com/mtree/image/upload/f_auto,q_auto/OralB_GB/en-gb/-/media/OralB_GB/Images/Products/OralBEssentialMintFloss/Oral-B-Essential-Floss-Mint-Waxed_1200x1200.png?w=118&v=1-201704250914',
      price: 130,
    ),
    // Toothpaste
    const Product(
      name: 'Colgate',
      category: 'Toothpaste',
      imageUrl: 'https://res.cloudinary.com/mtree/image/upload/f_auto,q_auto/OralB_GB/en-gb/-/media/OralB_GB/Images/Products/OralBEssentialMintFloss/Oral-B-Essential-Floss-Mint-Waxed_1200x1200.png?w=118&v=1-201704250914',
      price: 200,
    ),
    const Product(
      name: 'Oral B',
      category: 'Toothpaste',
      imageUrl: 'https://res.cloudinary.com/mtree/image/upload/f_auto,q_auto/OralB_GB/en-gb/-/media/OralB_GB/Images/Products/OralBEssentialMintFloss/Oral-B-Essential-Floss-Mint-Waxed_1200x1200.png?w=118&v=1-201704250914',
      price: 150,
    ),
    const Product(
      name: 'Mr. White',
      category: 'Toothpaste',
      imageUrl: 'https://res.cloudinary.com/mtree/image/upload/f_auto,q_auto/OralB_GB/en-gb/-/media/OralB_GB/Images/Products/OralBEssentialMintFloss/Oral-B-Essential-Floss-Mint-Waxed_1200x1200.png?w=118&v=1-201704250914',
      price: 130,
    ),
  ];
}