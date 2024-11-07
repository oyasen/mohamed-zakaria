import 'package:flutter/material.dart';
import 'package:news/Providers/news_provider.dart';
import 'package:provider/provider.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("News",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          color: Colors.white,
          width: double.infinity,
          child: Consumer<NewsProvider>(
            builder:(context, value, child)
              {
                var model = value.articuls?.articles;
                if(model == null)
                  {
                    value.getdata();
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                return ListView.builder(
                    itemBuilder: (context, index)
                    {
                      return Container(
                        color: Colors.white,
                        width: double.infinity,
                        child:
                        Column(
                          children: [
                            Image.network(model[index]["Image"]),
                            const SizedBox(height: 10),
                            Text(model[index]["title"],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            const SizedBox(height: 10),
                            Text(model[index]["description"]),
                            const SizedBox(height: 10)
                          ],
                        ),
                      );
                    },
                    itemCount: model.length,
            );
          }
          ),
        ),
      ),
    );
  }
}
