<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WeddingsPlanner._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Wedding Planner</h1>
        <p class="lead">Wedding Planner jest aplikacją usprawniającą planowanie wesel.</p>
        <p><a href="" class="btn btn-primary btn-large">Dowiedz się więcej &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Terminy wesel</h2>
            <p>
                Termin wesela jest niezbędny do rozpoczęcia wszelkich przygotowań z nim związanych.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/date">Wyświetl &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Lista prezentów</h2>
            <p>
                Pokazuje końcową listę prezentów. Jest to funkcjonalność, która pozwala zarezerwować w sklepie odpowiednie prezenty.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/presents">Wyświetl &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Liczba osób</h2>
            <p>
                Osoby, które potwierdziły obecność na weselu z podziałem na: dzieci do 7 lat, młodzież do 18 lat oraz dorosłych. Dane te są potrzebne dla firmy cateringowej, aby wiedziała ile jedzenia przygotować oraz do rezerwacji odpowiedniej wielkości sali weselnej.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/number">Wyświetl &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
