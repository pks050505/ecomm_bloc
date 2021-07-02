import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/model/model.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Zero to Unicorn',
      ),
      bottomNavigationBar: CustomNavBar(),
      body: ListView(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories
                  .map(
                    (c) => HeroCarouselCard(category: c),
                  )
                  .toList(),
            ),
          ),
          SectionTitle(title: 'RECOMMANDED'),
          ProductCarousel(
            products: Product.products.where((e) => e.isRecommanded!).toList(),
          ),
          SectionTitle(title: 'MOST POPULAR'),
          ProductCarousel(
            products: Product.products.where((e) => e.isPopular!).toList(),
          ),
        ],
      ),
    );
  }
}
