<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ImplementingBootstrapInAsp.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
<div class="carousel slide  carousel-dark" id="demo" data-bs-ride="carousel">
        <!-- Carousel Indicators Start From Here------------------------------------------------ -->

<div class="carousel-indicators">
    <button type="button" class="active" data-bs-target="#demo" data-bs-slide-to="0"></button>
    <button type="button"  data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button"  data-bs-target="#demo" data-bs-slide-to="2"></button>
    <button type="button"  data-bs-target="#demo" data-bs-slide-to="3"></button>
    <button type="button"  data-bs-target="#demo" data-bs-slide-to="4"></button>
</div>
        <!-- Carousel Inner Start From Here------------------------------------------------ -->

<div class="carousel-inner">
        <!-- Carousel Item Start From Here------------------------------------------------ -->
  
    <div class="carousel-item active" data-bs-interval="3000">
        <img src="/images/1.jpg" class="d-block w-100" alt="" >
        <div class="carousel-caption">
            <h3>Slide 1</h3>
            <p>First Slide</p>
        </div>
    </div>
    <div class="carousel-item " data-bs-interval="3000">
        <img src="/images/2.jpg" class="d-block w-100" alt="">
          <div class="carousel-caption">
            <h3>Slide 2</h3>
            <p>Second Slide</p>
        </div>
    </div>
    <div class="carousel-item " data-bs-interval="3000">
        <img src="/images/3.jpg" class="d-block w-100" alt="">
          <div class="carousel-caption">
            <h3>Slide 3</h3>
            <p>Thirt Slide</p>
        </div>
    </div>
    <div class="carousel-item " data-bs-interval="3000">
        <img src="/images/4.jpg" class="d-block w-100" alt="">
          <div class="carousel-caption">
            <h3>Slide 4</h3>
            <p>Fourth Slide</p>
        </div>
    </div>
    <div class="carousel-item " data-bs-interval="3000">
        <img src="/images/5.jpg" class="d-block w-100" alt="">
          <div class="carousel-caption">
            <h3>Slide 5</h3>
            <p>Fifth Slide</p>
        </div>
    </div>
</div>
        <!-- Left And Right Button Here------------------------------------------------ -->

<button type="button" class="carousel-control-prev" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
</button>
<button type="button" class="carousel-control-next" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>

</button>
</div>




    </div>

    <div class="row mt-3">
        <div class="col-md-6">
            <p class="text-primary"> This is My Home Page</p>
            <p class="text-danger"> This is My Home Page</p>
            <p class="text-info"> This is My Home Page</p>
            <p class="text-warning"> This is My Home Page</p>
        </div>
    </div>





</asp:Content>
