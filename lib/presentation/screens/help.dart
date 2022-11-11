import 'package:electronicsstrore/business_logic/Help/help_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  void initState() {
    BlocProvider.of<HelpCubit>(context).getHelp();
    super.initState();
  }

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Help",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: const Color.fromRGBO(7, 9, 77, 0.6),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            BlocBuilder<HelpCubit, HelpState>(
              builder: (context, state) {
                if (state is HelpLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.data.help.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionPanelList(
                            animationDuration:
                                const Duration(milliseconds: 1000),
                            dividerColor: Colors.red,
                            elevation: 2,
                            children: [
                              ExpansionPanel(
                                canTapOnHeader: true,
                                backgroundColor:
                                    const Color.fromRGBO(242, 242, 242, 1),
                                body: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    state.data.help[index].answer,
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        letterSpacing: 0.3,
                                        height: 1.3),
                                  ),
                                ),
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      state.data.help[index].question,
                                      style: TextStyle(
                                        color:
                                            const Color.fromRGBO(7, 9, 77, 0.6),
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                },
                                isExpanded: state.data.help[index].expanded,
                              )
                            ],
                            expansionCallback: (int item, bool status) {
                              setState(() {
                                state.data.help[index].expanded =
                                    !state.data.help[index].expanded;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is HelpLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HelpError) {
                  return Center(child: Text(state.message));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
