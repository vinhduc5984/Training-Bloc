import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_bloc/src/bloc/contract_bloc.dart/contract_bloc.dart';
import 'package:login_screen_bloc/src/bloc/contract_bloc.dart/contract_bloc_event.dart';
import 'package:login_screen_bloc/src/bloc/contract_bloc.dart/contract_bloc_state.dart';
import 'package:login_screen_bloc/src/models/contact_model.dart';
import 'package:login_screen_bloc/src/models/contract_buy_model.dart';
import 'package:login_screen_bloc/src/repositories/contract_repository.dart';
import 'package:login_screen_bloc/src/screens/widgets/dialog_loading.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({Key? key}) : super(key: key);

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  ContractBuyModel? contracts;
  List<ContractModel> listContract = [];
  int item = 0;
  int pages = 1;
  bool isLoading = true;
  bool isEndpage = false;
  ScrollController scrollController = ScrollController();
  final keyRefresh = GlobalKey<RefreshIndicatorState>();
  getDataContract() async {
    print("page: " + pages.toString());
    contracts = await ContractRepository()
        .getDataContract("page=${pages.toString()}&limit=10");
    if (contracts!.result.length > 0) {
      listContract.addAll(contracts!.result);
      setState(() {
        pages = pages + 1;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        isEndpage = true;
      });
    }

    print(listContract.length);
  }

  @override
  void initState() {
    super.initState();
    getDataContract();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("load More");
        getDataContract();
      }
    });
  }

  Future functionRefreshData() async {
    keyRefresh.currentState?.show();
    listContract.clear();
    pages = 1;
    await getDataContract();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContractBloc, ContractState>(
      listener: (context, state) {
        if (state is ContractLoaded) {
          listContract = state.contracts;
          setState(() {});
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Lịch sử giao dịch",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(height: 500, child: buildListView()),
        ),
      ),
    );
  }

  String convertDate(String date) {
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String day = date.substring(8, 10);
    String result = day + "/" + month + "/" + year;
    return result;
  }

  Widget buildListView() {
    return RefreshIndicator(
      onRefresh: functionRefreshData,
      key: keyRefresh,
      child: ListView(
        controller: scrollController,
        children: [
          ListView.builder(
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return builditem(listContract[index].paymentPlanNameVi,
                  listContract[index].endOfCommitmentPeriod);
            },
            itemCount: listContract.length,
            itemExtent: 80,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
          ),
          isEndpage
              ? Text(
                  "Hết danh sách",
                  textAlign: TextAlign.center,
                )
              : SizedBox()
        ],
      ),
    );
  }

  Widget builditem(String paymentPlanNameVi, String endOfCommitmentPeriod) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                paymentPlanNameVi,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
              Expanded(
                  flex: 0,
                  child: Text(
                    'EXP: ${convertDate(endOfCommitmentPeriod)}',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                "Gói tương lai",
                style: TextStyle(fontSize: 14, color: Colors.yellow.shade700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
              Expanded(
                  flex: 0,
                  child: Text(
                    paymentPlanNameVi,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
