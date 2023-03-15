import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
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
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Summary',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style:
                                Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: const Color(0xff5e6177),
                                    ),
                          ),
                          Text(
                            'PHP ${state.cart.subtotalString}',
                            style:
                                Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: const Color(0xff5e6177),
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Fee',
                            style:
                                Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: const Color(0xff5e6177),
                                    ),
                          ),
                          Text(
                            'PHP ${state.cart.shippingFeeString}',
                            style:
                                Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: const Color(0xff5e6177),
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style:
                                Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: const Color(0xff5e6177),
                                    ),
                          ),
                          Text(
                            'PHP ${state.cart.totalString}',
                            style:
                                Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: const Color(0xff5e6177),
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        else {
          return const Text('Something went wrong.');
        }
      },
    );
  }
}
