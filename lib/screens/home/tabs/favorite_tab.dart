import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c17_online/providers/favorite_provider.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider()..getTasks(),
      builder: (context, child) {

        var provider = Provider.of<FavoriteProvider>(context);
         DateFormat formatter = DateFormat('dd MMM');
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: provider.tasks.isEmpty
                ? Center(child: Text("No Favorite Tasks Found"))
                : ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 12),
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
                          "assets/images/${provider.tasks[index].category}.png",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,

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
                                  provider.tasks[index].date,
                                ),
                              ),
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  provider.tasks[index].title,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.displayMedium,
                                ),
                                InkWell(
                                  onTap: () {
                                    var task = provider.tasks[index];
                                    task.isFavorite = !task.isFavorite;
                                    provider.updateTask(task);
                                  },
                                  child: Icon(
                                    provider.tasks[index].isFavorite
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
              itemCount: provider.tasks.length,
            ),
          ),
        );
      },

    );
  }
}
