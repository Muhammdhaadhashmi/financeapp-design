import 'package:financeapp/widgets/chart.dart';
import 'package:flutter/material.dart';

import '../data/top.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day=['Day','Week','Month','Year'];
  int index_color=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children:  [
                  SizedBox(height: 20,),
                  Text("Statistics", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(4, (index){
                          return  GestureDetector(
                            onTap: (){
                             setState(() {
                               index_color=index;
                             });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index_color==index? Color.fromARGB(255,47,125, 121,):Colors.white,
                              ) ,
                              alignment: Alignment.center,
                              child:  Text(day[index],style:  TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: index_color==index? Colors.white:Colors.black,
                              ),),
                            ),
                          );
                        },)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Expenses",style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey,),
                              ),
                              Icon(Icons.arrow_downward_sharp,color: Colors.grey,)
                            ],
                          ),
                          decoration: BoxDecoration(
                            border:Border.all(
                               color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Chart(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                      Text('Top Spending',style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      ),
                        Icon(Icons.swap_vert,size: 25,color: Colors.grey,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
              SliverList(
                   delegate: SliverChildBuilderDelegate(
                   (context, index) {
                    return ListTile(
                         leading: Image.asset(
                      'images/${getter_top()[index].image!}',
                           height: 40,
                      ),
                      title: Text(getter_top()[index].name!,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      ),
                      subtitle:Text(getter_top()[index].time!,style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing:Text(getter_top()[index].fee!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.red),
                      )
                     );
                 },
               childCount: getter_top().length,
        ),
      ),
    ],),
      ),
    );
  }
}
