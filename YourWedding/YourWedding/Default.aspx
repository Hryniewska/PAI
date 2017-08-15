<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="YourWedding._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Kinga Pąk & Marcin Wierzba</h1>
        <p class="lead">
            pragną połączyć swe losy węzłem małżeńskiej przysięgi poprzez zawarcie Sakramentu Małżeństwa w kościele św. Wita w Łodzi dnia 22 września 2017 roku o godzinie 15.00
        </p>
        <p><a  class="btn btn-primary btn-large" runat="server" href="~/About">Więcej o nas &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h2>Nasi kochani Goście</h2>
            <p>
                Bardzo serdecznie prosimy, abyście potwierdzili swoją obecność na naszym weselu do 15 kwietnia. W przypadku, gdyby któryś z zacnych Gości nie mógł przybyć na przyjęcie weselne, prosimy aby nas powiadomił.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/number">Wyświetl &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Sprezentujcie nas</h2>
            <p>
                Abyście nie mieli problemu z wybraniem odpowiedniego prezentu ślubnego, który sprawiłby nam radość. 
                Zachęcamy do zapoznania się z naszą listą, prezentów, które bardzo chcielibyśmy otrzymać.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/presents">Wyświetl &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
