import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/model/categories_model.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/widget/widget.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class Search extends StatefulWidget {

  final String searchQuery;
  Search({required this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<CategoriesModel> categories= [];
  List<WallpaperModel> wallpapers= [];
  TextEditingController searchController= TextEditingController();

  getSearchWallpapers(String query) async{
    var response= await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=250") ,
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
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    categories= getCategories();
    super.initState();
    searchController.text= widget.searchQuery;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon( Icons.arrow_back_ios, color: Colors.black,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
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
                  color: Color(0xff9E9E9E7C),
                  borderRadius: BorderRadius.circular(30),

                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: (){
                    getSearchWallpapers(searchController.text);
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

              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
