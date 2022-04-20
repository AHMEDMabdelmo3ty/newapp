import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/model/book.dart';
import 'package:untitled3/widget/search_widget.dart';
import 'package:untitled3/page/filter_network_list_page.dart';
import 'package:untitled3/api/books_api.dart';

class infor extends StatefulWidget {
  //const infor(String place, {Key? key}) : super(key: key);
  @override
  State<infor> createState() => _inforState();
}

class _inforState extends State<infor> {
  List<Book> books = [];
  bool isPressed = false;
  String query = '';
  Timer? debouncer;
  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await BooksApi.getBooks(query);

    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff73ef5),
              Color(0xf61a4f1),
              Color(0XFF478DE0),
              Color(0XFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                //   itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBook(Book book) => ListTile(
        /*   leading: Image.network(
          book.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),*/
        title: Text(book.spicalicaition),
        trailing: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            //   IconButton(
            /*     onPressed: () {
                // activate()
                setState(() {
                  isPressed = true;
                });
              },
                 icon: Icon(Icons.done,
                    semanticLabel: "applay",
                    color:
                        (isPressed) ? Color(0xff007397) : Color(0xff9A9A9A))*/
            //  ),
          ],
        ),
        subtitle: Column(
          children: [
            Text(book.place),
            Text(book.date),
            Text(book.price),
            Text(book.type_work),
            Text(book.company),
            Text(book.job_description),
          ],
        ),
      );
}
