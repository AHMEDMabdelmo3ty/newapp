import 'dart:async';
import 'package:untitled3/api/books_api.dart';
import 'package:untitled3/main.dart';
import 'package:untitled3/model/book.dart';
import 'package:untitled3/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/widget/infor.dart';

class FilterNetworkListPage extends StatefulWidget {
  @override
  FilterNetworkListPageState createState() => FilterNetworkListPageState();
}

class FilterNetworkListPageState extends State<FilterNetworkListPage> {
  List<Book> books = [];
  bool isPressed = false;
  String query = '';
  late String a, b, c, d, e, f;
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("search a new job"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'spicalicaition or place',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final books = await BooksApi.getBooks(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books;
        });
      });

  Widget buildBook(Book book) => ListTile(
        /*   leading: Image.network(
          book.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),*/
        title: Text(book.spicalicaition),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed("infor");
                  Widget build(context) => Scaffold(
                        appBar: AppBar(
                          title: Text("search as new job"),
                          centerTitle: true,
                        ),
                        body: Container(child: Text("hi")),
                      );
                },
                icon: Icon(
                  Icons.view_comfy,
                  semanticLabel: "show more information",
                )),
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
          ],
        ),
      );
}
