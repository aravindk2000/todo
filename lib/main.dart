import 'package:flutter/material.dart';
void main(){
  runApp(todo());
}
class todo extends StatelessWidget {
  const todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todolist(),
    );
  }
}
class todolist extends StatefulWidget {
  const todolist({super.key});

  @override
  State<todolist> createState() => _todolistState();
}

TextEditingController data = TextEditingController();
class _todolistState extends State<todolist> {
  List<Widget> con = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO LIST"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder:(context) {
            return AlertDialog(
              scrollable: true,
              title:TextField(
controller: data,
              ),
                actions: [
                  TextButton(onPressed: () {
setState(() {

  con.add(Container(
    child: Text(data.text),
    width: MediaQuery.of(context).size.width,
    height: 100,));
});
Navigator.pop(context);

                  }, child:Text("OK")),
                  TextButton(onPressed: () {

                  }, child:Text("Cancel"))
              ],
            );
          }, );

        },
        child: Icon(Icons.add),
      ),
      body:ListView.builder(
        itemBuilder: (context, index) {
      return Column(
        children: con,
      );
      },
        itemCount: con.length,)
    );
  }
}
