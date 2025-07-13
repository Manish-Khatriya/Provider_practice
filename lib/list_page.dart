import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/list_provider.dart';
import 'package:state_management/theme_provider.dart';

class ListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        actions: [
          Consumer<ThemeProvider>(
            builder: (ctx, provider, _) {
              return Switch.adaptive(
                  value: provider.gettheme(),
                  onChanged: (value){

                    provider.updatetheme(value: value);

                  });

            },)
        ],
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: IconButton(onPressed: (){
          context.read<ListProvider>().addData({
            "name" : "Mansih",
            "desc" : "Flutter Developer",
          });

        }, icon: Icon(Icons.add)),
      ),
    );
  }
}






















/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/counter_provider.dart';

class ListPage extends StatelessWidget{
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Count Page "),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: IconButton(onPressed:(){

            return context.read<CounterProvider>().countincrement();

          }, icon: Icon(Icons.add)),
        )

    );
  }
}

*/
