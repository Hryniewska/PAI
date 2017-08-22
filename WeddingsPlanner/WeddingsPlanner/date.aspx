<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="date.aspx.cs" Inherits="WeddingsPlanner.date" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br>
    <thead>
        <h2>Terminy wesel</h2>

        <br />
        <script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>

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
                                    <asp:Label ID="lblWeddingId" runat="server" Text='<%# Eval("WeddingId")%>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtWeddingId" Width="40px" MaxLength="5" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Panna młoda">
                                <ItemTemplate>
                                    <asp:Label ID="lblBride" Width="200px" runat="server" Text='<%# Eval("Bride")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtBride" runat="server" Text='<%# Eval("Bride")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtBride" Width="210px" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Pan młody">
                                <ItemTemplate>
                                    <asp:Label ID="lblGroom" Width="200px" runat="server" Text='<%# Eval("Groom")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGroom" runat="server" Text='<%# Eval("Groom")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtGroom" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Miejsce">
                                <ItemTemplate>
                                    <asp:Label ID="lblPlace" Width="250px" runat="server" Text='<%# Eval("Place")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPlace" runat="server" Text='<%# Eval("Place")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtPlace" Width="250px" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField HeaderText="Data">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" Width="100px" runat="server" Text='<%# Eval("Date")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDate" runat="server" Text='<%# Eval("Date")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtDate" Width="100px" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%# Eval("WeddingId")%>'
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
