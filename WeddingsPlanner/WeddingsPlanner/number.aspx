<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="number.aspx.cs" Inherits="WeddingsPlanner.number" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <h2>Liczba planowanych gości</h2>



    <table class="table">
        <thead class="thead-default">

            <tr>
                <th></th>
                <th>Miejsce</th>
                <th>Data</th>
                <th>Liczba dorosłych</th>
                <th>Młodzieży do 18 lat</th>
                <th>Dzieci do 7 lat</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>ul. Piotrkowska 56</td>
                <td>23.06.2017</td>
                <td>204</td>
                <td>25</td>
                <td>22</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>ul. Politechniki 52</td>
                <td>11.08.2017</td>
                <td>83</td>
                <td>25</td>
                <td>10</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>ul. Żwirki i Wigury 56</td>
                <td>03.05.2017</td>
                <td>151</td>
                <td>69</td>
                <td>37</td>
            </tr>
        </tbody>
    </table>


    <p align="right">
        <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
    </p>
</asp:Content>
