<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="presents.aspx.cs" Inherits="YourWedding.presents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <h2>Liczba planowanych gości</h2>

    <tbody>
        <%--<form id="form2" runat="server">--%>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ArticleName" HeaderText="ArticleName" SortExpression="ArticleName" ItemStyle-Width="100px" />
                    <asp:BoundField DataField="BarCode" HeaderText="BarCode" SortExpression="BarCode" ItemStyle-Width="250px" />
                    <asp:BoundField DataField="ShopName" HeaderText="ShopName" SortExpression="ShopName" ItemStyle-Width="150px" />
                    <asp:BoundField DataField="ShopAdress" HeaderText="ShopAdress" SortExpression="ShopAdress" ItemStyle-Width="150px" />
                
                    <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                
                </Columns>


            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [ArticleName], [BarCode], [ShopName], [ShopAdress], [Website] FROM [Present]">

            </asp:SqlDataSource>
            ﻿

        </div>

       
    </tbody>




    <p align="right">
        <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
    </p>
</asp:Content>