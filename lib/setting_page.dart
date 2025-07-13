import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/theme_provider.dart';

class SettingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Setting"),
     ),
     body: Consumer<ThemeProvider>(
         builder: (ctx, provider, _) {
           return SwitchListTile.adaptive(
               title: Text("Dark Mode"),
               subtitle: Text("Theme Mode Change Here "),
               value: provider.gettheme(),
               onChanged: (value){

                 provider.updatetheme(value: value);

               });

         },)

   );
  }
}