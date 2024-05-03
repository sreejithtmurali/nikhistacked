import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikhistacked/Ui/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (model) {
          model.init();
        },
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(),
              body: (model.isBusy)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: model.plist!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${model.plist![index].thumbnail}'),
                          ),
                          title: Text('${model.plist![index].title}'),
                        );
                      },
                    ));
        });
  }
}
