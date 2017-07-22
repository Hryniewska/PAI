<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="date.aspx.cs" Inherits="WeddingsPlanner.date" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br>
    <h2>Terminy wesel</h2>
    <table class="table">
        <thead class="thead-default">
            <tr>
                <th></th>
                <th>Panna młoda</th>
                <th>Pan młody</th>
                <th>Miejsce</th>
                <th>Data</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Anna Nowak</td>
                <td>Adam Kowalski</td>
                <td>ul. Piotrkowska 56, 90-105 Łódź</td>
                <td>23.06.2017</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Krystyna Kowalczyk</td>
                <td>Jan Zięba</td>
                <td>al. Politechniki 12, 93-590 Łódź</td>
                <td>11.08.2017</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Justyna Styk</td>
                <td>Marcin Kasperczyk</td>
                <td>ul. Żwirki i Wigury 5, 90-450 Łódź</td>
                <td>03.05.2017</td>
            </tr>
        </tbody>
    </table>

      <p align="right">
        <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
    </p>

</asp:Content>
