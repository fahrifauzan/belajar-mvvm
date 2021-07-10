import 'package:bljr_mvvm/core/enums/viewstate.dart';
import 'package:bljr_mvvm/core/viewmodel/news_viewmodel.dart';
import 'package:bljr_mvvm/ui/views/base_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      onModelReady: (model) => model.getNews(),
      builder: (context, model, child) => Scaffold(
        body: model.news == null ? Center( child: CircularProgressIndicator()) : ModalProgressHUD(
          inAsyncCall: model.state == ViewState.Busy ?? ViewState.Idle,
          child: ListView.builder(
            itemCount: model.news.length,
            itemBuilder: (context, index){
              return Container(
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: CachedNetworkImage(
                          imageUrl: model.news[index].urlToImage,
                          fit: BoxFit.fill,
                          height: 80,
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Center( child: Icon(Icons.error)),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  model.news[index].title != null ? model.news[index].title : "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  model.news[index].content != null ? model.news[index].content : "",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ),
      ),
    );
  }
}