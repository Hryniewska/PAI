<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="presents.aspx.cs" Inherits="YourWedding.presents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <thead>
        <h2>Lista prezentów</h2>
        <br />
        <script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
        <script type="text/javascript">

            //function BlockUI(elementID) {
            //    var prm = Sys.WebForms.PageRequestManager.getInstance();
            //    prm.add_beginRequest(function () {
            //        $("#" + elementID).block({
            //            message: '<table align = "center"><tr><td>' +
            //             '<img src="images/loadingAnim.gif"/></td></tr></table>',
            //            css: {},
            //            overlayCSS: {
            //                backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB'
            //            }
            //        });
            //    });

            //    prm.add_endRequest(function () {
            //        $("#" + elementID).unblock();
            //    });
            //}
            //$(document).ready(function () {

            //    BlockUI("dvGrid");
            //    $.blockUI.defaults.css = {};
            //});
        </script>
    </thead>




    <tbody>
        <div id="dvGrid" style="padding: 10px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server"
                        AutoGenerateColumns="false"
                        HeaderStyle-BackColor="#eb6864" AllowPaging="true" ShowFooter="true"
                        OnPageIndexChanging="OnPaging" OnRowEditing="EditCustomer"
                        OnRowUpdating="UpdateCustomer" OnRowCancelingEdit="CancelEdit"
                        PageSize="10">
                        <Columns>

                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Nr">
                                <ItemTemplate>
                                    <asp:Label ID="lblArticleId" runat="server" Text='<%# Eval("ArticleId")%>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtArticleId" Width="40px" MaxLength="5" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Nazwa artykułu">
                                <ItemTemplate>
                                    <asp:Label ID="lblArticleName" Width="200px" runat="server" Text='<%# Eval("ArticleName")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtArticleName" runat="server" Text='<%# Eval("ArticleName")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtArticleName" Width="210px" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Nazwa sklepu">
                                <ItemTemplate>
                                    <asp:Label ID="lblShopName" Width="150px" runat="server" Text='<%# Eval("ShopName")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtShopName" runat="server" Text='<%# Eval("ShopName")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtShopName" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Kod kreskowy">
                                <ItemTemplate>
                                    <asp:Label ID="lblBarCode" Width="120px" runat="server" Text='<%# Eval("BarCode")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtBarCode" runat="server" Text='<%# Eval("BarCode")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtBarCode" Width="120px" MaxLength="11" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField HeaderText="Liczba">
                                <ItemTemplate>
                                    <asp:Label ID="lblArticlesNumber" Width="40px" runat="server" Text='<%# Eval("ArticlesNumber")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtArticlesNumber" Width="40px" runat="server" Text='<%# Eval("ArticlesNumber")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtArticlesNumber" Width="50px" MaxLength="5" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>




                            <asp:TemplateField HeaderText="Adres sklepu">
                                <ItemTemplate>
                                    <asp:Label ID="lblShopAdress" Width="150px" runat="server" Text='<%# Eval("ShopAdress")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtShopAdress" runat="server" Text='<%# Eval("ShopAdress")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtShopAdress" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>





                            <asp:TemplateField HeaderText="Str. internetowa">
                                <ItemTemplate>
                                    <asp:Label ID="lblWebsite" Width="150px" runat="server" Text='<%# Eval("Website")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtWebsite" runat="server" Text='<%# Eval("Website")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtWebsite" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>




                            <asp:TemplateField HeaderText="Zajęty">
                                <ItemTemplate>
                                    <asp:Label ID="lblOccupied" Width="40px" runat="server" Text='<%# Eval("Occupied")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtOccupied" Width="50px" runat="server" Text='<%# Eval("Occupied")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtOccupied" Width="50px" MaxLength="5" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>






                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%# Eval("ArticleId")%>'
                                        OnClientClick="return confirm('Do you want to delete?')"
                                        Text="Usuń" OnClick="DeleteCustomer"></asp:LinkButton>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:Button ID="btnAdd" runat="server" Text="Dodaj" OnClick="AddNewCustomer" />
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:CommandField ShowEditButton="True" />


                        </Columns>
                        <AlternatingRowStyle BackColor="#f9d1d0" />
                    </asp:GridView>
                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="GridView1" />
                </Triggers>

            </asp:UpdatePanel>
        </div>




        <p align="right">
            <a class="btn btn-default" runat="server" href="~/">Powrót &raquo;</a>
        </p>
</asp:Content>
