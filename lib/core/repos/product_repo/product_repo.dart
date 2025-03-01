import '../../dataProduct/models/product_model.dart';
import '../../networking/fir_result.dart';

abstract class ProductRepo {
  Future<FirResult<List<ProductModel>>> getProducts() ;
  Future<FirResult<List<ProductModel>>> getBestSellingProducts();
}