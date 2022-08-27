import 'package:flutter/material.dart';


class Prodact extends StatelessWidget {
  final dynamic value;
  const Prodact({Key? key , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value['success']){

    }
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      home: Scaffold(
        appBar: AppBar(
        title: const Text('بيانات المنتج'

    ),
          backgroundColor: Colors.amber,
        ),

        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child:SingleChildScrollView(

              child:  Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("اسم المنتج" , style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                            Text(
                              value['prodactname'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red
                              ),


                            ),
                          ],
                        )
                    ),

                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("رقم الباركود" , style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                            Text(
                              value['prodactbarcode'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red
                              ),


                            ),
                          ],
                        )
                    ),


                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("بلد الصنع" , style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                            Text(
                              value['prodactcountry'],
                              textAlign: TextAlign.end,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red
                              ),


                            ),
                          ],
                        )


                    ),




                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("وصف المنتج" , style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                            Text(
                              value['prodactdescription'],
                              textAlign: TextAlign.end,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red
                              ),
                            ),
                          ],
                        )





                    ),

                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("مكونات المنتج " , style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                            Text(
                              value['prodactmade'],
                              textAlign: TextAlign.end,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red
                              ),
                            ),
                          ],
                        )

                    ),



                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("تاريخ الانتهاء  " , style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                            Text(
                              value['prodactexpired'],
                              textAlign: TextAlign.end,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red
                              ),
                            ),
                          ],
                        )

                    ),






                  ],
                ),
              ),
            )
          )
        ),
      ),
    );
  }
}
