import 'package:demo/model/categories.dart';
import 'package:flutter/material.dart';

class CategoriesStore extends StatelessWidget {
  CategoriesStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Categories.init();
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                )),
                Text(
                  'See more',
                  style: TextStyle(fontSize: 16, color: Colors.lightGreen),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoriesItem(category: categories[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
class CategoriesItem extends StatelessWidget {
  Categories category;
  CategoriesItem({required this.category});
  // const CategoriesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(5),
      child: Image.asset(category.image),
    );
  }
}

