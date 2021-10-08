
enum Category{
  Article,
  GanHuo,
  Girl
}

enum HotType{
  views,
  likes,
  comments
}


class ReadingApi{

  static const API_URL  = "https://gank.io";
  static const BANNER_LIST = "$API_URL/api/v2/banners";
  static const Article ="Article";
  static const Category_GanHuo ="GanHuo";
  static const Category_Article ="Article";
  static const Category_Girl ="Girl";
  static const HotType_Views ="views";
  static const HotType_Likes ="likes";
  static const HotType_Comments="comments";


  static const CATEGORY_LIST = "$API_URL/api/v2/categories/Article";

  ///本周最热的
  static getListByCategory({String hotType,String category,int count =10}){

    return "$API_URL/api/v2/hot/$hotType/category/$category/count/10";
  }


  // static getArticleListByCategory({String category,int pageSize =10,int pageNum}){
  //   return "$API_URL/api/v2/data/category/$category/page/$pageNum/count/$pageSize";
  // }


  static getArticleListByCategory({String category,String type,int pageSize =10,int pageNum}){
    String url = "$API_URL/api/v2/data/category/$category/type/$type/page/$pageNum/count/$pageSize";
    print("url:$url");
    return url;
  }

  static getArticleDetail({String id}){
    String url = "$API_URL/api/v2/post/$id";
    print("url:$url");
    return url;
  }
  static getImageList({String category,String type,int pageSize =10,int pageNum=1}){
    String url = "$API_URL/api/v2/data/category/Girl/type/Girl/page/$pageNum/count/$pageSize";
    print("url:$url");
    return url;
  }

  static search({String search,String category="All",String type="All",int pageSize =10,int pageNum=1}){
    String url = "$API_URL/api/v2/search/$search/category/$category/type/$type/page/$pageNum/count/$pageSize";
    print("url:$url");
    return url;
  }
}