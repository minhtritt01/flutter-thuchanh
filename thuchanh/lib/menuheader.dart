import 'package:flutter/cupertino.dart%20%20';
import 'package:flutter/material.dart%20';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color:Colors.green
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(child: Text("Account info",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),)),
            GestureDetector(
              onTap: (){
              },
              child: Text("Save",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),

            )
          ],
        ),
      ),
    );
  }
}
