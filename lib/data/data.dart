class SliderModel{

   String ImagePath;
   String Title;
   String Desc;

  SliderModel({this.ImagePath, this.Title, this.Desc});

  void setImageAssetPath(String getImagePath){
    ImagePath= getImagePath;
  }

  void setTitle(String getTitle){
    Title=getTitle;
  }

  void setDesc(String getDesc)
  {
    Desc=getDesc;
  }

  String getImageAssetPath(){
    return ImagePath;
  }

  String getTitle(){
    return Title;
  }

  String getDesc(){
    return Desc;
  }

}

List<SliderModel> getSlides(){

  List<SliderModel> slides= new List<SliderModel>();
  SliderModel sliderModel=SliderModel();

  //1
  sliderModel.setImageAssetPath("images/onboard3.png");
  sliderModel.setTitle("Travel Together");
  sliderModel.setDesc("Enjoy your vaccations without any hurdle");
  slides.add(sliderModel);
  sliderModel=SliderModel();


  //2
  sliderModel.setImageAssetPath("images/onboard1.png");
  sliderModel.setTitle("Your desired location");
  sliderModel.setDesc("Enjoy your vaccations without any hurdle");
  slides.add(sliderModel);
  sliderModel=SliderModel();


  //3
  sliderModel.setImageAssetPath("images/onboard2.png");
  sliderModel.setTitle("Pack your bags");
  sliderModel.setDesc("Enjoy your vaccations without any hurdle");
  slides.add(sliderModel);
  sliderModel=SliderModel();

  return slides;


}