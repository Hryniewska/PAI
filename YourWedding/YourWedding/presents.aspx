<%@ Page Title="Presents" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="presents.aspx.vb" Inherits="WeddingPlanner.presents" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br>
        <h2>Lista prezentów</h2>
        <p>
            Pokazuje końcową listę prezentów. Jest to funkcjonalność, która pozwala zarezerwować w sklepie odpowiednie prezenty.
        </p>
    </div>
    <br />

    <table class="table">
        <thead class="thead-default">
            <tr>
                <th>ID artykułu</th>
                <th>Nazwa artykułu</th>
                <th>Kod kreskowy</th>
                <th>Nazwa sklepu</th>
                <th>Adres sklepu</th>
                <th>Liczba sztuk</th>

            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Odkurzacz bezworkowy - VAX C86-E2-BE</td>
                <td>5 901234 123457</td>
                <td>RTV EURO AGD</td>
                <td>Aleja Jana Pawła II 30, 93-570 Łódź</td>
                <td>2</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>SIEMENS EQ6 TE607203RW</td>
                <td>5 902614 190257</td>
                <td>Media Markt</td>
                <td>Piłsudskiego 15/23, 90-307 Łódź</td>
                <td>1</td>
            </tr>
        </tbody>
    </table>

    <p align="right">
        <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
    </p>

</asp:Content>
