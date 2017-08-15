<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="presents.aspx.cs" Inherits="YourWedding.presents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <h2>Liczba planowanych gości</h2>

    <tbody>
        <%--<form id="form2" runat="server">--%>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ArticleName" HeaderText="Nazwa artykułu" SortExpression="ArticleName" ItemStyle-Width="300px" />
                    <asp:BoundField DataField="BarCode" HeaderText="Kod kreskowy" SortExpression="BarCode" ItemStyle-Width="150px" />
                    <asp:BoundField DataField="ShopName" HeaderText="Nazwa sklepu" SortExpression="ShopName" ItemStyle-Width="150px" />
                    <asp:BoundField DataField="ShopAdress" HeaderText="Adres sklepu" SortExpression="ShopAdress" ItemStyle-Width="250px" />
                    <asp:BoundField DataField="Website" HeaderText="Str. internetowa" SortExpression="Website" ItemStyle-Width="150px" />
                    <asp:BoundField DataField="Occupied" HeaderText="Zajęte" SortExpression="Occupied" ItemStyle-Width="55px" />

                </Columns>


            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [ArticleName], [BarCode], [ShopName], [ShopAdress], [Website], [Occupied] FROM [Present]">

            </asp:SqlDataSource>
            ﻿

        </div>

       
    </tbody>




    <p align="right">
        <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
    </p>
</asp:Content>