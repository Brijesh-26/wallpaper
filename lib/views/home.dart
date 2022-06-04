import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/model/categories_model.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/views/categorie.dart';
import 'package:wallpaper/views/image_view.dart';
import 'package:wallpaper/views/search.dart';
import 'package:wallpaper/widget/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categories= [];
  List<WallpaperModel> wallpapers= [];

  TextEditingController searchController= TextEditingController();

  getTrendingWallpapers() async{
    var response= await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=3000") ,
    headers: {
      "Authorization": apiKey
    }
    );

    Map<String, dynamic> jsonData= jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      WallpaperModel wallpaperModel= new WallpaperModel.empty();
      wallpaperModel= WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });


    setState(() {
    });

  }

  @override
  void initState(){
    getTrendingWallpapers();
    categories= getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BrandName(),
        elevation: 0.0,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffB3B3BAFF),
                  borderRadius: BorderRadius.circular(30),

                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
                      searchQuery: searchController.text,
                    )
                    ));
                  },
                  child: Row(

                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'search here',
                            border: InputBorder.none
                          ),

                        ),
                      ),

                      Icon(Icons.search),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    
                    return CategoriesTile(
                      title: categories[index].categoriesName,
                      imgUrl: categories[index].imgUrl
                    );
                  },
                ),
              ),


              SizedBox(height: 16),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {

  late String imgUrl;
  late String title;

  CategoriesTile({required this.title, required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Categorie(categorieName: title)));
      },
    
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImageView(imgUrl: imgUrl,)));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                  child: Image.network(imgUrl, height: 50, width: 100,fit: BoxFit.cover,), ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                borderRadius: BorderRadius.circular(8)
              ),
              height: 50, width: 100,
              alignment: Alignment.center,
              child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}



