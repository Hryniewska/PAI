<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="number.aspx.cs" Inherits="YourWedding.number" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <thead>
        <h2>Liczba planowanych gości</h2>

        <br />
        <script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
        <script type="text/javascript">

          
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
                                    <asp:Label ID="lblGuestId" runat="server" Text='<%# Eval("GuestId")%>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtGuestId" Width="40px" MaxLength="5" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Nr rodziny">
                                <ItemTemplate>
                                    <asp:Label ID="lblFamilyId" Width="50px" runat="server" Text='<%# Eval("FamilyId")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtFamilyId" runat="server" Text='<%# Eval("FamilyId")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtFamilyId" Width="90px" MaxLength="3" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Imię i nazwisko">
                                <ItemTemplate>
                                    <asp:Label ID="lblName1" Width="150px" runat="server" Text='<%# Eval("Name1")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName1" runat="server" Text='<%# Eval("Name1")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtName1" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Imię i nazwisko">
                                <ItemTemplate>
                                    <asp:Label ID="lblName2" Width="150px" runat="server" Text='<%# Eval("Name2")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName2" runat="server" Text='<%# Eval("Name2")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtName2" Width="150px" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField HeaderText="E-mail">
                                <ItemTemplate>
                                    <asp:Label ID="lblMail" Width="200px" runat="server" Text='<%# Eval("Mail")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMail" runat="server" Text='<%# Eval("Mail")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtMail" Width="200px" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>




                            <asp:TemplateField HeaderText="Liczba dzieci">
                                <ItemTemplate>
                                    <asp:Label ID="lblNumberOfKids" Width="100px" runat="server" Text='<%# Eval("NumberOfKids")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNumberOfKids" runat="server" Text='<%# Eval("NumberOfKids")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtNumberOfKids" MaxLength="5" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>





                            <asp:TemplateField HeaderText="Liczba nastolatków">
                                <ItemTemplate>
                                    <asp:Label ID="lblNumberOfTeens" Width="100px" runat="server" Text='<%# Eval("NumberOfTeens")%>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNumberOfTeens" runat="server" Text='<%# Eval("NumberOfTeens")%>'></asp:TextBox>
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="txtNumberOfTeens" MaxLength="5" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%# Eval("GuestId")%>'
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
