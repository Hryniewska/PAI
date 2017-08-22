<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="presents.aspx.cs" Inherits="WeddingsPlanner.presents" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br>
        <h2>Lista prezentów</h2>
        <p>
            Pokazuje końcową listę prezentów. Jest to funkcjonalność, która pozwala zarezerwować w sklepie odpowiednie prezenty.
        </p>
    </div>
    <br />

     <tbody>
        <%--<form id="form2" runat="server">--%>
            <div>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="ArticleId" HeaderText="Nr" SortExpression="ArticleId" ItemStyle-Width="50px" />
                        <asp:BoundField DataField="ArticleName" HeaderText="Nazwa artykułu" SortExpression="ArticleName" ItemStyle-Width="300px" />
                        <asp:BoundField DataField="BarCode" HeaderText="Kod kreskowy" SortExpression="BarCode" ItemStyle-Width="120px" />
                        <asp:BoundField DataField="ArticlesNumber" HeaderText="L. szt." SortExpression="ArticlesNumber" ItemStyle-Width="60px" />
                        <asp:BoundField DataField="ShopName" HeaderText="Nazwa sklepu" SortExpression="ShopName" ItemStyle-Width="170px" />
                        <asp:BoundField DataField="ShopAdress" HeaderText="Adres sklepu" SortExpression="ShopAdress" ItemStyle-Width="250px" />
                        <asp:BoundField DataField="Website" HeaderText="Strona internetowa" SortExpression="Website" ItemStyle-Width="150px" />

                    </Columns>


                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [ArticleId], [ArticleName], [BarCode], [ArticlesNumber], [ShopName], [ShopAdress], [Website] FROM [Article]"></asp:SqlDataSource>
                ﻿

            </div>

        <%--</form>--%>


    </tbody>

       <div align="center" style="width: 75%;">

        <div style="float: left;">
           <asp:Button class="btn btn-default" runat="server" OnClick="UpdateDatabase" Text="Synchronizuj z bazą" />
        </div>
        <div style="float: right;">
            <a class="btn btn-default" runat="server" href="~/">Powrót »</a>
        </div>
    </div>

</asp:Content>
