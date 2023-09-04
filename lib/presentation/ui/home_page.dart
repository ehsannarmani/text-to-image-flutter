import 'package:asmr_text_to_image_ai/data/data_source/base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/app_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asmr Develop"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Color(0xff212121),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(child: TextField(
                        controller: controller,
                        decoration: InputDecoration.collapsed(
                            hintText: "Prompt",
                        ),
                      )),
                      SizedBox(width: 18,),
                      InkWell(
                        onTap: (){
                          if(controller.text.isNotEmpty){
                            BlocProvider.of<AppBloc>(context)
                                .add(GenerateAiImageEvent(controller.text));
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 40,
                            width: 40,
                            color: Color(0xff313131),
                            child: Icon(Icons.send),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            BlocBuilder<AppBloc,AppState>(
              builder: (context,state){
                switch(state.generatedImage){
                  case null:{
                    return SizedBox();
                  }
                  default: {
                    switch(state.generatedImage!.status){
                      case ResponseStatus.Loading:{
                        return const CircularProgressIndicator(color: Colors.white,);
                      }
                      case ResponseStatus.Failed:{
                        return Text(state.generatedImage!.message);
                      }
                      case ResponseStatus.Success:{
                        return SizedBox(
                          width: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(image: MemoryImage(state.generatedImage!.data)),
                          ),
                        );
                      }
                    }
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
