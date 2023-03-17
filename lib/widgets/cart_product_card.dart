import 'package:dental_store/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/models.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(178, 178, 178, .2),
            blurRadius: 30,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(
              product.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'PHP ${product.price}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xff51a8ff),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    product.category,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xff5e6177),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(178, 178, 178, .2),
                            blurRadius: 30,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: IconButton(
                          icon: const Icon(Icons.chevron_left_outlined),
                          onPressed: () {
                            context.read<CartBloc>().add(RemoveProduct(product));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$quantity',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(178, 178, 178, .2),
                            blurRadius: 30,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: IconButton(
                          icon: const Icon(Icons.chevron_right_outlined),
                          onPressed: () {
                            context.read<CartBloc>().add(AddProduct(product));
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
