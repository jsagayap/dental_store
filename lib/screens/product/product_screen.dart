import 'package:dental_store/blocs/cart/cart_bloc.dart';
import 'package:dental_store/models/product_model.dart';
import 'package:dental_store/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Product Details'),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0.0,
        child: Container(
            height: 110,
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(CartProductAdded(product));
                    Navigator.pushNamed(context, '/cart');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Add to Cart',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    product.imageUrl,
                  ),
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'PHP ${product.price}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xff51a8ff),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
