import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/list_page.dart';
import 'package:state_management/list_provider.dart';
import 'package:state_management/main.dart';
import 'package:state_management/setting_page.dart';
import 'package:state_management/theme_provider.dart';

void main(){
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),)
      ],
      child: MyApp()),
  );
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List",
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeProvider>().gettheme()
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [PopupMenuItem(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage(),));
              },
                child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 10,),
                Text("Setting")
              ],
            ))];
          },)
        ],
        title: Text("List"),
        backgroundColor: Colors.green,
      ),
      body: Consumer<ListProvider>(
        builder: (ctx, provider, __) {
          var alldata = provider.getData();
          return alldata.isNotEmpty
              ? ListView.builder(
            itemCount: alldata.length,
            itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("$index"),
                  title: Text("${alldata[index]["name"]}",style: TextStyle(fontSize: 20),),
                  subtitle: Text("${alldata[index]["desc"]}",style: TextStyle(fontSize: 20)),
                  trailing: FittedBox(
                    child: Row(
                      children: [
                        IconButton(onPressed:(){

                         context.read<ListProvider>().updateData({
                           "name"  :  "Manish Khatriya",
                           "desc"  :  "Java Developer",

                         }, index);
                        }, icon: Icon(Icons.edit),color: Colors.green,),
                        IconButton(onPressed:(){

                          context.read<ListProvider>().deleteData(index);

                        }, icon: Icon(Icons.delete),color: Colors.red,),
                      ],
                    ),
                  ),
                );

          },) : Center(child: Text("No data "));
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){

      Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(),));

      },child: Icon(Icons.add),),
    );
  }



}














/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/counter_provider.dart';
import 'package:state_management/list_page.dart';
import 'package:state_management/main.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp())
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Count",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("Full reBuild code");
    return Scaffold(
      appBar: AppBar(
        title:Text("Practice Provider"),
        backgroundColor: Colors.purple,
      ),
      */
/*body: Center(
         child: Consumer<CounterProvider>(
             builder:(context, value, child) {
               print("Only Consumer Code ");
               return Text("${
                   // Provider.of<CounterProvider>(context,listen: true).getvalue()
               context.watch<CounterProvider>().getvalue()

               }",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
             },)),
         floatingActionButton: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             FloatingActionButton(onPressed: (){

               context.read<CounterProvider>().countincrement();

             },child: Icon(Icons.add),),
             SizedBox(width: 100,),
             FloatingActionButton(onPressed:(){

               context.read<CounterProvider>().countdecrement();

             },child: Icon(Icons.remove),)
           ],
         ),
*//*

      body: Center(
          child: Consumer<CounterProvider>(
            builder:(context, value, child) {
              print("Only Consumer Code ");
              return Text("${
              // Provider.of<CounterProvider>(context,listen: true).getvalue()
                  context.watch<CounterProvider>().getvalue()

              }",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
            },)),
      floatingActionButton: FloatingActionButton(onPressed: (){

        Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(),));

      },child: Icon(Icons.add),),

    );
  }

}
*/



