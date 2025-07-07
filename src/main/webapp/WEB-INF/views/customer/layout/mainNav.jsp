      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div class="left-main-nav">
        <div class="title-main-nav">
            <i class="fa-solid fa-bars"></i>
            <p>danh mục sản phẩm</p>
        </div>
            <a href="#khuyenMaiHot" class="link-title-type">
                <ul>
                    <i class="fa-solid fa-certificate"><span>%</span></i>
                    khuyến mãi hot
                </ul>
            </a>
            <a href="#" class="normal-title">
                <ul>
                    <a href="#thitCaTrung">Thịt, cá, trứng, hải sản</a>
                    <div class="list" id="list1">
                    <a href="${base}/dssanpham"><li> Thịt các loại </li></a>
                    <a href="#"><li> Cá, hải sản </li></a>
                    <a href="#"><li> Trứng gà, vịt, cút </li></a>
                    </div>
                    <i class="fa-solid fa-angle-down" id="downList1" onclick="Hien('list1');Hien('upList1');An('downList1')"></i>
                    <i class="fa-solid fa-angle-up" id="upList1" onclick="An('list1');Hien('downList1');An('upList1')"></i>
                </ul>
            </a>
            <a href="#" class="normal-title">
                <ul>
                    <a href="#rauCuTraiCay">Rau, củ, trái cây</a>
                    <div class="list" id="list2">
                    <a href="#"><li> Rau lá các loại  </li></a>
                    <a href="#"><li> Rau củ các loại  </li></a>
                    <a href="#"><li> Trái cây các loại  </li></a>
                    </div>
                    <i class="fa-solid fa-angle-down" id="downList2" onclick="Hien('list2');Hien('upList2');An('downList2')"></i>
                    <i class="fa-solid fa-angle-up" id="upList2" onclick="An('list2');Hien('downList2');An('upList2')"></i>
                </ul>
            </a>
            <a href="#" class="normal-title">
                <ul>
                    <a href="#miMienChaoPho">Mì, miến, cháo, phở</a>
                    <div class="list" id="list3">
                    <a href="#"><li>  Mì ăn liền  </li></a>
                    <a href="#"><li>   Hủ tiếu, miến, bánh canh   </li></a>
                    <a href="#"><li>  Phở, bún ăn liền   </li></a>
                    <a href="#"><li>  Cháo gói, cháo tươi  </li></a>
                    <a href="#"><li>  Bánh gạo Hàn Quốc   </li></a>
                    <a href="#"><li>   Mì, nui, bún khô   </li></a>
                    </div>
                    <i class="fa-solid fa-angle-down" id="downList3" onclick="Hien('list3');Hien('upList3');An('downList3')"></i>
                    <i class="fa-solid fa-angle-up" id="upList3" onclick="An('list3');Hien('downList3');An('upList3')"></i>
                </ul>
            </a>
            <a href="#" class="normal-title">
                <ul>
                    <a href="#suaCacLoai">Sữa các loại</a>
                    <div class="list" id="list4">
                    <a href="#"><li>  Sữa tươi  </li></a>
                    <a href="#"><li>  Sữa chua uống liền  </li></a>
                    <a href="#"><li>  Sữa hạt, sữa đậu  </li></a>
                    <a href="#"><li>   Sữa ca cao, lúa mạch   </li></a>
                    <a href="#"><li>   Sữa đặc   </li></a>
                    <a href="#"><li>  Sữa hạt, sữa đậu  </li></a>
                    <a href="#"><li>   Ngũ cốc các loại   </li></a>
                    <a href="#"><li>   Sữa bột các loại   </li></a>
                    <a href="#"><li>   Sữa chua ăn   </li></a> 
                    <a href="#"><li>   Bơ sữa, phô mai   </li></a>
                    </div>
                    <i class="fa-solid fa-angle-down" id="downList4" onclick="Hien('list4');Hien('upList4');An('downList4')"></i>
                    <i class="fa-solid fa-angle-up" id="upList4" onclick="An('list4');Hien('downList4');An('upList4')"></i>
                </ul>
            </a>
            <a href="#" class="normal-title">
                <ul>
                    <a href="#biaNuocGiaiKhat">Bia, nước giải khát</a>
                    <div class="list" id="list5">
                    <a href="#"><li>   Bia, nước có cồn   </li></a>
                    <a href="#"><li>   Rượu các loại   </li></a>
                    <a href="#"><li>   Nước ngọt   </li></a>
                    <a href="#"><li>    Nước tăng lực, bù khoáng    </li></a>
                    <a href="#"><li>    Nước trái cây, nước trà    </li></a>
                    <a href="#"><li>   Nước suối   </li></a>
                    <a href="#"><li>    Trà, cà phê    </li></a>
                    <a href="#"><li>    Mật ong, bột nghệ   </li></a>
                    <a href="#"><li>    Nước yến, ngũ cốc    </li></a> 
                    </div>
                    <i class="fa-solid fa-angle-down" id="downList5" onclick="Hien('list5');Hien('upList5');An('downList5')"></i>
                    <i class="fa-solid fa-angle-up" id="upList5" onclick="An('list5');Hien('downList5');An('upList5')"></i>
                </ul>
            </a>
            <a href="#" class="normal-title">
                <ul>
                    <a href="#banhKeoCacLoai">Bánh kẹo các loại</a>
                    <div class="list" id="list6">
                    <a href="#"><li>    Singum, kẹo các loại    </li></a>
                    <a href="#"><li>    Bánh quy, bánh xốp    </li></a>
                    <a href="#"><li>    Bánh snack, rong biển    </li></a>
                    <a href="#"><li>     Bánh mềm, bánh tươi    </li></a>
                    <a href="#"><li>    Nước trái cây, nước trà    </li></a>
                    <a href="#"><li>   Nước suối   </li></a>
                    <a href="#"><li>     Mứt, hạt, thạch...     </li></a>
                    <a href="#"><li>    Socola  </li></a>
                    </div>
                    <i class="fa-solid fa-angle-down" id="downList6" onclick="Hien('list6');Hien('upList6');An('downList6')"></i>
                    <i class="fa-solid fa-angle-up" id="upList6" onclick="An('list6');Hien('downList6');An('upList6')"></i>
                </ul>
            </a>
    </div>