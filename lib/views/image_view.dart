
// import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  late String imgUrl;
  ImageView({required this.imgUrl});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  var filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          Hero(
            tag: widget.imgUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.imgUrl, fit: BoxFit.cover,)
          ),),

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Stack(

                    children: [

                      Container(
                        height: 20.0,
                        width: MediaQuery.of(context).size.width/2,
                        color: Color(0xff1C1B1B).withOpacity(0.8),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        padding:EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0) ,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70 , width: 2),
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0x36FFFFFF),
                                  Color(0x0FFFFFFF)
                                ]
                            )
                        ),
                        child: Column(

                          children: [
                            Text('set as wallpaper', style: TextStyle(color: Colors.white, fontSize: 18.0,),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Text("discard", style: TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 1.0),)),


              ],
            ),
          )
        ],
      ),
    );
  }

  // _save() async{
  //   await _askPermission();
  //   var response= await Dio().get(
  //     widget.imgUrl,
  //     options: Options(responseType: ResponseType.bytes));
  //   final result= await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
  //   print(result);
  //   Navigator.pop(context);
  // }
  //
  // _askPermission() async {
  //   if(Platform.isIOS){
  //     Map<PermissionGroup, PermissionStatus> permissions= await PermissionHandler().requestPermissions([PermissionGroup.photos]);
  //   }
  //   else{
  //     PermissionStatus permission= await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
  //   }
  // }
}

