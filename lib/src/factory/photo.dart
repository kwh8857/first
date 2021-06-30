import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoFactory extends StatefulWidget {
  // PhotoFactory({Key key}) : super(key: key);

  @override
  _PhotoFactoryState createState() => _PhotoFactoryState();
}

class _PhotoFactoryState extends State<PhotoFactory> {
  List<AssetEntity> _mediaList = [];

  @override
  void initState() {
    _getimage();
    super.initState();
  }

  _getimage() async {
    List<AssetPathEntity> albums =
        await PhotoManager.getAssetPathList(onlyAll: true);
    List<AssetEntity> media = await albums[0].getAssetListPaged(0, 60);
    setState(() {
      _mediaList.addAll(media);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        extendBodyBehindAppBar: true,
        body: GridView.builder(
            itemCount: _mediaList.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return FutureBuilder(
                  future: _mediaList[index].thumbDataWithSize(200, 200),
                  builder: (BuildContext context, snapshot) {
                    var pa = snapshot.data;
                    var photoFile = _mediaList[index].file;
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Card(preview: pa, photofile: photoFile);
                    } else {
                      return Text('dsdf');
                    }
                  });
            }),
      ),
    );
  }
}

class Card extends StatefulWidget {
  final preview;
  final photofile;
  Card({this.preview, this.photofile}) : super(key: UniqueKey());

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, widget.photofile);
      },
      child: Stack(children: <Widget>[
        Positioned.fill(
          child:
              // Text('${widget.preview}')
              Image.memory(
            widget.preview,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }
}
