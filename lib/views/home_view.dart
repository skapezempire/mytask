import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/shared_widgets/todo_tile.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/views/create_todo_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF1F5FC),
      appBar: AppBar(
        leadingWidth: 50,
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage("assets/profile.jpg"),
          ),
        ),
        title: const Text("My tasks"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return const TodoTileWidget(
            status: false,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CreateTodoView();
          }));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return CompletedTodoWidget();
                });
          },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 45,
            decoration: BoxDecoration(
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: customBlue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "completed",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w600, color: customBlue),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: customBlue,
                    ),
                  ],
                ),
                Text(
                  "24",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: customBlue),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompletedTodoWidget extends StatelessWidget {
  const CompletedTodoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) {
        return const TodoTileWidget(
          status: true,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 10,
    );
  }
}
