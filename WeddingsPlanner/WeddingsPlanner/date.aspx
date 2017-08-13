﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="date.aspx.cs" Inherits="WeddingsPlanner.date" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br>
    <h2>Terminy wesel</h2>

    <thead class="thead-default" runat="server">
        <title></title>
    </thead>
    <tbody>
        <%--<form id="form2" runat="server">--%>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Bride" HeaderText="Bride" SortExpression="Bride" />
                        <asp:BoundField DataField="Groom" HeaderText="Groom" SortExpression="Groom" />
                        <asp:BoundField DataField="Place" HeaderText="Place" SortExpression="Place" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    </Columns>


                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [Bride], [Groom], [Place], [Date] FROM [Wedding]"></asp:SqlDataSource>
                ﻿

            </div>

        <%--</form>--%>


    </tbody>


    <p align="right">
        <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
    </p>

</asp:Content>
