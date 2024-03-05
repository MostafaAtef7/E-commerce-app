import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home_view/data/model/products_model/products_model.dart';
import 'package:ecommerce/features/home_view/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit(this.repo) : super(HomeCubitInitial());

  final HomeRepo repo;

  Future<void> fetchAllProducts() async{
    emit(HomeCubitLoading());
    try{
      List<ProductsModel> products = await repo.getAllProducts();
      emit(HomeCubitSuccess(products: products));
    }
    catch (e) {
      emit(HomeCubitFailure(errMsg: "Can't get products, please try again"));
    }
  }
}
