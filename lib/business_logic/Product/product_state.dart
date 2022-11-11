part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class Productloading extends ProductState {}

class Productloaded extends ProductState {
  final ProductsModel data;

  Productloaded(this.data);
}

class Producterror extends ProductState {

}
