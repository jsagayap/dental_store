import 'package:dental_store/blocs/cart/cart_bloc.dart';
import 'package:dental_store/config/app_router.dart';
import 'package:dental_store/repositories/category/category_repository.dart';
import 'package:dental_store/repositories/product/product_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/category/category_bloc.dart';
import 'blocs/product/product_bloc.dart';
import 'config/theme.dart';
import 'screens/screens.dart';

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
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
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
        initialRoute: CheckoutScreen.routeName,
      ),
    );
  }
}
