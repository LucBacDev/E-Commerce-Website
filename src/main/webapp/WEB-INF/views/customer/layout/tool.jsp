   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
    <div class="scroll-top">
        <a href="#top">
            <i class="fa-solid fa-up-long"></i>
        </a>
    </div>
    <div class="chat-box" onclick="Hien('chat-box-form')">
        <i class="fa-brands fa-facebook-messenger"></i>
    </div>
    <div class="chat-box-form" id="chat-box-form">
        <div class="decorateTop-chat-box">
            <div class="btn-closeDecorateTop" onclick="An('chat-box-form')">
                <i class="fa-solid fa-xmark"></i>
                <p>Đóng</p>
            </div>
        </div>
        <div class="brand-chat-box">
            <img src="https://livehelp.tgdd.vn/var/storagetheme/2021y/06/19/1/640e13612756a26f36f516c0452fbb32.png" style="width:40px;height:40px">
            <i>BachHoaXanh.com sẵn sàng hỗ trợ quý khách</i>
        </div>
        <div class="input-chat-box">
            <label> Quý khách muốn xưng hô là:</label>
            <select  >
                <option value="" disabled selected>Chọn cách xưng hô với quý khách</option>
                <option value="0">Anh</option>
                <option value="1">Chị</option>
            </select>
        </div>
        <div class="input-chat-box">
            <label>Tên của quý khách là:</label>
            <input type="text" placeholder="Nhập tên của quý khách">
        </div>
        <div class="input-chat-box">
            <label>Số điện thoại của quý khách là:</label>
            <input type="number" placeholder="Nhập số điện thoại của quý khách">
        </div>
        <div class="input-chat-box" id="special-input-chat-box">
            <input type="checkbox">
            <label>Bằng việc bắt đầu chát quý khách đã đồng ý với các <a href="#">Điều khoản của BachhoaXANH.com</a></label>
        </div>
        <div class="btn-star-chat">
            <p>Bắt đầu chat</p>
        </div>