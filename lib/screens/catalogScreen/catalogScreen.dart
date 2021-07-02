import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  const CatalogScreen({Key? key, required this.category}) : super(key: key);
  final Category category;
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProduct = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        itemCount: categoryProduct.length,
        itemBuilder: (_, i) {
          return ProductCard(
            product: categoryProduct[i],
            widthFactor: 2.2,
          );
        },
      ),
    );
  }
}
