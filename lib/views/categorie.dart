import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/widget/widget.dart';
class Categorie extends StatefulWidget {
  final String categorieName;
  Categorie({required this.categorieName});
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {


  List<WallpaperModel> wallpapers= [];

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
    getSearchWallpapers(widget.categorieName);
    super.initState();
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
              SizedBox(height: 16),

              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
