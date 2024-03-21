import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled4/model/groceries.dart';

class DetailScreen extends StatefulWidget {
  final Groceries groceries;
  const DetailScreen({super.key, required this.groceries}); // memanggil objek

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    // membuka halaman kesini
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.groceries.name),
        actions: [
          Icon(Icons.favorite, color: Colors.red,),
        ]
        // nama tercantum
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.network(
              widget.groceries.productImageUrls[0]
              ,
              height: 1000,// gambar didetail page
            ),
          ),
          Text(
            widget.groceries.name,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
      Row(
        children: [
          Text(widget.groceries.price),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
            color: Colors.red,
            child: Text(widget.groceries.discount, style: TextStyle(color: Colors.white),
            ),
          ),
      ]
    ),
          Row(
            children: [

              Icon(Icons.star , color: Colors.yellow,),
              Text(widget.groceries.stock),
            ],
          ),





          Text(widget.groceries.storeName, style: TextStyle(color: Colors.red),),
          Text(widget.groceries.description),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launcheadUrl(
            "https://www.tokopedia.com/morinagaofficial/chil-kid-platinum-moricare-vanilla-800gr",);
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launcheadUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
