<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="number.aspx.cs" Inherits="WeddingsPlanner.number" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <h2>Liczba planowanych gości</h2>

     <tbody>
        <%--<form id="form2" runat="server">--%>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                    <Columns>
                        <%--<asp:BoundField DataField="Place" HeaderText="Miejsce" SortExpression="Place" ItemStyle-Width="250px" />--%>
                        <%--<asp:BoundField DataField="Date" HeaderText="Data" SortExpression="Date" DataFormatString = "{0:dd/MM/yyyy}" ItemStyle-Width="100px" />--%>
                        <asp:BoundField DataField="Adults" HeaderText="Liczba dorosłych" SortExpression="Adults" ItemStyle-Width="170px" />
                        <asp:BoundField DataField="Teens" HeaderText="Młodzieży do 18 lat" SortExpression="Teens" ItemStyle-Width="250px" />
                        <asp:BoundField DataField="Kids" HeaderText="Dzieci do 7 lat" SortExpression="Kids" ItemStyle-Width="150px" />

                    </Columns>


                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [Adults], [Teens], [Kids] FROM [Guest]"></asp:SqlDataSource>
                ﻿

            </div>

        <%--</form>--%>


    </tbody>

   


    <p align="right">
        <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
    </p>
</asp:Content>
