import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'presentation/pages/product_list_page.dart';
import 'presentation/providers/product_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(
            ProductRepositoryImpl(ProductRemoteDataSourceImpl()),
          ),
        ),
      ],
      child: MaterialApp(
        home: ProductListPage(),
      ),
    );
  }
}
