import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? name;
  final String? category;
  final double price;
  final String imageUrl;
  final bool? isRecommanded;
  final bool? isPopular;
  const Product({
    this.category = 'Category',
    required this.imageUrl,
    this.isPopular = false,
    this.isRecommanded = false,
    this.name = 'unKnown',
    this.price = 0.0,
  });
  @override
  List<Object?> get props =>
      [name, category, price, imageUrl, isRecommanded, isPopular];

  static List<Product> products = [
    Product(
      name: 'Soft Drinks #1',
      price: 2.99,
      isRecommanded: true,
      category: 'Soft Drink',
      imageUrl:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    ),
    Product(
      name: 'Soft Drinks #2',
      price: 3.99,
      isRecommanded: true,
      isPopular: true,
      category: 'Soft Drink',
      imageUrl:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    ),
    Product(
      name: 'Soft Drinks #1',
      price: 2.99,
      isRecommanded: true,
      category: 'Soft Drink',
      imageUrl:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    ),
    Product(
      name: 'Soft Drinks #2',
      price: 3.99,
      isRecommanded: false,
      isPopular: true,
      category: 'Soft Drink',
      imageUrl:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    ),
    Product(
      name: 'Smoothies #1',
      price: 2.99,
      isRecommanded: false,
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    ),
    Product(
      name: 'Smoothies #2',
      price: 3.99,
      isRecommanded: false,
      isPopular: true,
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    ),
    Product(
      name: 'Smoothies #2',
      price: 3.99,
      isRecommanded: false,
      isPopular: true,
      category: 'Water',
      imageUrl:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    ),
  ];
}
