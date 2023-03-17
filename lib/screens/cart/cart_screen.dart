import 'package:dental_store/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dental_store/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Cart'),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0.0,
          child: Container(
              height: 110,
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
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
                      Icons.credit_card_outlined,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Proceed to Payment',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              )),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.cart.freeDeliveryString,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99.0),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Add more',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                            quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                          );
                        }
                      ),
                    ),
                    const SizedBox(height: 16),
                    const OrderSummary(),
                  ],
                ),
              );
            }
            else {
              return const Text('Something went wrong');
            }
          },
        ));
  }
}
