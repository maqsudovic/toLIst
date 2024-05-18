import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class TodoItem {
  final String title;
  bool isDone;

  TodoItem(this.title, {this.isDone = false});
}

class _MyAppState extends State<MyApp> {
  List<TodoItem> _todos = [];

  void _addTodo(String title) {
    setState(() {
      _todos.add(TodoItem(title));
    });
  }

  void _toggleTodo(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'jmINCIDE Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('jmINCIDE Todo List'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Add a todo",
              ),
              onSubmitted: (title) => _addTodo(title),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  final todo = _todos[index];
                  return CheckboxListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    value: todo.isDone,
                    onChanged: (newValue) => _toggleTodo(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
