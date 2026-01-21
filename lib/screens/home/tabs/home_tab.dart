import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c17_online/core/firebase_functions.dart';
import 'package:todo_c17_online/models/task_model.dart';
import 'package:todo_c17_online/providers/home_page_provider.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  DateFormat formatter = DateFormat('dd MMM');

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageProvider()..getTasksStream(),
        ),
      ],
      builder: (context, child) {
        // var provider = Provider.of<HomePageProvider>(context);
        final provider = context.watch<HomePageProvider>();

        return Container(
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    itemCount: provider.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          provider.changeCategory(index);
                        },
                        child: Chip(
                          label: Text(
                            provider.categories[index]
                                .replaceAll("_", ' ')
                                .toUpperCase(),
                            style: Theme.of(context).textTheme.displaySmall!
                                .copyWith(
                                  color: index != provider.selectedCategoryIndex
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.white,
                                ),
                          ),
                          backgroundColor:
                              index == provider.selectedCategoryIndex
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: provider.taskss.isEmpty
                      ? Center(child: Text("No Tasks Found"))
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.white,
                              height: 193,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.asset(
                                      "assets/images/${provider.taskss[index].category}.png",
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF0F0F0),
                                        ),
                                        child: Text(
                                          formatter.format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                              provider.taskss[index].date,
                                            ),
                                          ),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.displaySmall,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.all(8),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF0F0F0),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              provider.taskss[index].title,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.displayMedium,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var task =
                                                    provider.taskss[index];
                                                task.isFavorite =
                                                    !task.isFavorite;
                                                provider.updateTask(task);
                                              },
                                              child: Icon(
                                                provider
                                                        .taskss[index]
                                                        .isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: provider.taskss.length,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
