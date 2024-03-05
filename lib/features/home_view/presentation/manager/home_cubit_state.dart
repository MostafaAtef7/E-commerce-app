part of 'home_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}
final class HomeCubitLoading extends HomeCubitState {}
final class HomeCubitSuccess extends HomeCubitState {
  final List<ProductsModel> products;

  HomeCubitSuccess({required this.products});
}
final class HomeCubitFailure extends HomeCubitState {
  final String errMsg;
  HomeCubitFailure({required this.errMsg});
}
