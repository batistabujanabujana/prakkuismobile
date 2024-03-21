import 'package:flutter/material.dart';
import 'package:untitled4/model/groceries.dart';
import 'package:untitled4/views/detailgroceries.dart';

class ListGroceries extends StatelessWidget {
  const ListGroceries ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: new Center(
        child: new Text("Kuis TPM IF-E (Halaman List)",
        style: new TextStyle(color: Colors.white),),
        ),
    ),
      body: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final Groceries groceries = groceryList[index];

          //agar dapat dipencet
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        groceries: groceries)
                  ));
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      groceries.productImageUrls[0],
                      height: 60,
                    ), // mengambil gambar
                  ),
                  Text(groceries.name), 
                  Text(groceries.price),
                  Icon(Icons.star,  color: Colors.yellowAccent,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                      color: Colors.red,
                    child: Text(groceries.discount, style: TextStyle(color: Colors.white),
                  ),
                   ),
                ],
              ),
            ),
          );
        },
        itemCount: groceryList.length, // panjang list nya dalam tourism
      ),
    );
  }
}
