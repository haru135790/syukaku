class memodata{
  int id;
  String companyName;
  String jobName;
  String industry;
  String companyDescription="";
  int wantRank;
  String statement;

  memodata({required this.id,required this.companyName, required this.jobName, required this.industry, required this.wantRank, required this.statement});

}

class ForPulldownList{
  static const List<String> industryList=["IT","メーカー","商社","金融","メディア","官公庁","物流","その他","未設定"];
  static const List<int> wantRankList=[1,2,3,4];
  List<String> getIndustryList(){
    return industryList;
  }
  List<int> getWantRankList(){
    return wantRankList;
  }
}