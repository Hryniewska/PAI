<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="number.aspx.cs" Inherits="YourWedding.number" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <h2>Liczba planowanych gości</h2>

    <tbody>
        <%--<form id="form2" runat="server">--%>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="GuestId">
                <Columns>
                    <asp:BoundField DataField="FamilyId" HeaderText="Nr rodziny" SortExpression="FamilyId" ItemStyle-Width="100px" />
                    <asp:BoundField DataField="Name1" HeaderText="Imię i nazwisko" SortExpression="Name1" ItemStyle-Width="200px" />
                    <asp:BoundField DataField="Name2" HeaderText="Imię i nazwisko" SortExpression="Name2" ItemStyle-Width="200px" />
                    <asp:BoundField DataField="Mail" HeaderText="E-mail" SortExpression="Mail" ItemStyle-Width="200px" />
                    <asp:BoundField DataField="NumberOfKids" HeaderText="Liczba dzieci" SortExpression="NumberOfKids" ItemStyle-Width="150px" />
                    <asp:BoundField DataField="NumberOfTeens" HeaderText="Liczba młodzieży" SortExpression="NumberOfTeens" ItemStyle-Width="150px" />

                </Columns>


            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [FamilyId], [Name1], [Name2], [Mail], [NumberOfKids], [NumberOfTeens], [GuestId] FROM [Guest]"></asp:SqlDataSource>
            ﻿

        </div>


    </tbody>




    <p align="right">
        <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
    </p>
</asp:Content>
