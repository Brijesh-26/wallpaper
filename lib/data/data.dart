
import 'package:wallpaper/model/categories_model.dart';

String apiKey= '563492ad6f91700001000001ad6ecac892624e5ea554f9e68bd8a212';

List<CategoriesModel> getCategories(){

  List<CategoriesModel> categories= [];
  CategoriesModel categoriesModel= CategoriesModel();

  categoriesModel.imgUrl= "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName= 'Car';
  categories.add(categoriesModel);
  categoriesModel= CategoriesModel();

  categoriesModel.imgUrl= "https://images.pexels.com/photos/2393835/pexels-photo-2393835.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoriesName= 'Bike';
  categories.add(categoriesModel);
  categoriesModel= new CategoriesModel();

  categoriesModel.imgUrl= "https://images.pexels.com/photos/347135/pexels-photo-347135.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoriesName= 'Motivation';
  categories.add(categoriesModel);
  categoriesModel= new CategoriesModel();

  categoriesModel.imgUrl= "https://images.pexels.com/photos/1980720/pexels-photo-1980720.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName= 'City';
  categories.add(categoriesModel);
  categoriesModel= new CategoriesModel();

  categoriesModel.imgUrl= "https://images.pexels.com/photos/397857/pexels-photo-397857.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoriesName= 'Wild Life';
  categories.add(categoriesModel);
  categoriesModel= new CategoriesModel();

  categoriesModel.imgUrl= "https://images.pexels.com/photos/1535775/pexels-photo-1535775.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoriesName= 'Street Art';
  categories.add(categoriesModel);
  categoriesModel= new CategoriesModel();

  categoriesModel.imgUrl= "https://images.pexels.com/photos/1761279/pexels-photo-1761279.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoriesName= 'Nature';
  categories.add(categoriesModel);
  categoriesModel= new CategoriesModel();



  return categories;
}