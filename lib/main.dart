import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dental_store/config/app_router.dart';
import 'package:dental_store/blocs/blocs.dart';
import 'package:dental_store/repositories/category/category_repository.dart';
import 'package:dental_store/repositories/checkout/checkout_repository.dart';
import 'package:dental_store/repositories/product/product_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Dental Store',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
