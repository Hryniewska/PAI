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
                    <asp:BoundField DataField="Name" HeaderText="Imię i nazwisko" SortExpression="Name" ItemStyle-Width="250px" />
                    <asp:BoundField DataField="Mail" HeaderText="E-mail" SortExpression="Mail" ItemStyle-Width="150px" />
                    <asp:BoundField DataField="Age" HeaderText="przedział wiekowy" SortExpression="Age" ItemStyle-Width="150px" />
                
                </Columns>


            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [FamilyId], [Name], [Mail], [Age], [GuestId] FROM [Guest]">

            </asp:SqlDataSource>
            ﻿

        </div>

       
    </tbody>




    <p align="right">
        <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
    </p>
</asp:Content>