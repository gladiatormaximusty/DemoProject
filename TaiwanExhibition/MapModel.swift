//
//  File.swift
//  GoogleNapDemo
//
//  Created by 楷岷 張 on 2017/4/23.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import GoogleMaps
import Foundation

class LocationModel {
    var coordinate:CLLocationCoordinate2D
    var name:String
    var startDate:String
    var endDate:String
    var image:String
    var changeColor:Bool
    var location:String
    var detail:String
    var url:String
    
    init(name:String, startDate:String, endDate:String, image:String, changeColor:Bool, location:String, detail:String, url:String, coordinate:CLLocationCoordinate2D) {
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.image = image
        self.changeColor = changeColor
        self.location = location
        self.detail = detail
        self.url = url
        self.coordinate = coordinate
    }
}
class Exhibition {
    var coordinate:CLLocationCoordinate2D
    var select:Bool
    
    init(coordinate:CLLocationCoordinate2D, select:Bool) {
        self.coordinate = coordinate
        self.select = select
    }
}

var testLocation:[LocationModel] = [
    LocationModel(name: "台北國際包裝工業展覽會", startDate: "2017/06/21", endDate: "2017/06/24", image: "photo2", changeColor: true, location: "臺北市南港區經貿二路1號", detail: "本展與「台北國際食品展」及「台北國際食品加工設備暨製藥機械展」將於台北南港展覽館1館及世貿一館展出，同時「台灣國際飯店暨餐飲設備用品展」及「 台灣國際清真產品展」亦於世貿一館舉辦，五展合一，精彩可期！\n展出項目：\n包裝機械及包裝材料、紙類容器、包裝工廠設備、自動填充、密封與秤重機、印刷機、膠帶、膠模與棧板、運輸、倉儲及物流、食品與藥品包裝機、製袋機、材料控制設備、真空包裝機、輸送帶、伸縮膜包裝機。", url: "https://www.taipeipack.com.tw/zh_TW/show/info.html?id=ADB49712782014EBD0636733C6861689&sFuncID=ADB49712782014EBD0636733C6861689", coordinate: CLLocationCoordinate2D(latitude: 25.056697, longitude: 121.618117)), LocationModel(name: "台北國際食品加工設備暨製藥機械展", startDate: "2017/06/21", endDate: "2017/06/24", image: "photo3", changeColor: false, location: "台北市信義區信義路五段5號", detail: "食品與飲料加工機械、烘焙機械及零件、食品包裝機械、製藥加工機械暨其包裝設備、食品生物技術、食品調理設備、廢棄物處理與消毒設備、CAD & CAM、分析與測量儀器、保鮮冷藏設備、食品及飲料販賣機器、食品加工添加劑、其他食品加工技術、相關零組件等。", url: "http://www.foodtech.com.tw/zh_TW/index.html", coordinate: CLLocationCoordinate2D(latitude: 25.033358, longitude: 121.562206)), LocationModel(name: "台北國際物流展", startDate: "2017/09/06", endDate: "2017/09/09", image: "photo4", changeColor: true, location: "臺北市南港區經貿二路1號", detail: "2017台北國際物流展，展出項目包含從倉儲到達交的完整物流供應鏈，並結合物聯網技術與設備，是您不可錯過的年度採購焦點！", url: "https://www.chanchao.com.tw/logistics/", coordinate: CLLocationCoordinate2D(latitude: 25.056697, longitude: 121.618117)), LocationModel(name: "台北國際橡膠暨複材工業展", startDate: "2017/09/13", endDate: "2017/09/16", image: "photo7", changeColor: false, location: "高雄市前鎮區成功二路39號", detail: "首屆「臺灣國際塑橡膠暨複材工業展（PLASCOM TAIWAN）」將於今（106）年9月13日至16日於高雄展覽館盛大展出，該展由外貿協會及塑膠製品公會等單位聯合主辦，並以「高值化、循環經濟」為展覽兩大主軸，帶動石化塑橡膠及複材產業升級轉型，共同打造PLASCOM成為亞洲頂尖的塑橡膠國際專業展。", url: "http://www.plascom.com.tw/zh_TW/show/info.html?id=5398C002098D9DA5D0636733C6861689", coordinate: CLLocationCoordinate2D(latitude: 22.608432, longitude: 120.299201)),LocationModel(name: "台北國際模具暨模具製造設備展", startDate: "2017/09/06", endDate: "2017/09/09", image: "photo5", changeColor: true, location: "臺北市南港區經貿二路1號", detail: "台灣唯一專業模具展 – 「台北國際模具暨模具製造設備展」，由台灣區 模具工業同業公會、展昭企業股份有限公司及業界共同積極耕耘，展覽 規模及效益不斷成長。結合3D列印主題、工業4.0等時下最熱議題，並搭 配多場主題論壇及技術研討會，打造專業多元的產業交流平台。", url: "https://www.odm-dmi.com/", coordinate: CLLocationCoordinate2D(latitude: 25.056697, longitude: 121.618117)),LocationModel(name: "台灣國際專業美容展暨產業論壇", startDate: "2017/09/21", endDate: "2017/09/23", image: "photo9", changeColor: false, location: "台北市信義區信義路五段5號", detail: "此次展覽係台灣唯一之國際專業美容展，除歡迎台灣優秀廠商參展外，並邀請國外買主來台觀展採購，促進台灣美容相關產業之商機。\n美容美粧及相關產品(化粧品、個人護理用品、美容保養工具)、美甲美睫美髮、化粧品包裝包材、SPA、香水及芳療、美容化粧品原料、美容產品製造機械或設備", url: "http://www.beautytw.com.tw/", coordinate: CLLocationCoordinate2D(latitude: 25.033358, longitude: 121.562206)), LocationModel(name: "台北國際食品暨設備展", startDate: "2017/11/17", endDate: "2017/11/20", image: "photo6", changeColor: true, location: "臺北市南港區經貿二路1號", detail: "本展會提供一個交流互惠平台，促進設備買賣雙方進行媒合，也供給終端消費者一站式的採購機會，幫助參觀者在節省荷包的同時也掌握最新食品趨勢！", url: "https://www.chanchao.com.tw/food/", coordinate: CLLocationCoordinate2D(latitude: 25.056697, longitude: 121.618117)),LocationModel(name: "台灣國際清真產品展", startDate: "2017/06/21", endDate: "2017/06/24", image: "photo10", changeColor: false, location: "台北市信義區信義路五段5號", detail: "台灣國際清真產品展(HALAL TAIWAN)自2013年首屆辦理以來，為全臺唯一針對清真認證產品所辦理的展覽，規模及商機均持續成長，與同期舉行的台北國際食品展、台北國際食品加工設備暨製藥機械展、台北國際包裝工業展及台灣國際飯店暨餐飲設備用品展，徵集國內外參展廠商家數與買主人數均屢創新高，台北國際食品五展已成為我國及亞洲食品及相關產業最佳國際交流平臺之一。", url: "http://www.halalexpo.com.tw/zh_TW/index.html", coordinate: CLLocationCoordinate2D(latitude: 25.033358, longitude: 121.562206)),LocationModel(name: "臺灣文創商機東南亞拓銷團", startDate: "2017/08/20", endDate: "2017/8/26", image: "photo11", changeColor: false, location: "桃園市大園區臺灣桃園國際機場 ", detail: "外貿協會為配合新南向政策，協助我國廠商布局東南亞市場，特針對文化創意產業，籌組「2017 年臺灣文創商機東南亞拓銷團」。\n鑒於文化創意產業具有語言、文化特定性，根據國家發展委員會的華人服務業市場研究，東協的華人總數約為 2,902 萬人，占東協人口的4.67%，其中又以新加坡及馬來西亞華人占其總人口數比例最高，分別為52.9%及23.6%，可做為臺灣文創產業國際化試煉的跳板。", url: "https://events.taiwantrade.com.tw/CultureTM", coordinate: CLLocationCoordinate2D(latitude: 25.078641, longitude: 121.231105))
]
