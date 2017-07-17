<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="WeddingPlanner.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>W razie problemów prosimy o kontakt</p>
    <br />

    <address>
        Wydział Fizyki Technicznej, Informatyki i Matematyki Stosowanej, Politechnika Łódzka
        <br />
        Wólczańska 215, 90-924 Łódź
        <br />
        <abbr title="Phone">tel.</abbr>
        +48 42 631 36 00
          <br />
        <abbr title="Fax">fax:</abbr>
        +48 42 631 36 02
        <br />
        <a href="mailto:w-7@adm.p.lodz.pl">w-7@adm.p.lodz.pl</a>
          <br />
        NIP 727-002-18-95
          <br />  
    </address>

    <address>
        <strong>Support:</strong><a href="mailto:214906@edu.p.lodz.pl">Weronika Hryniewska</a><br />
        <strong>Server problems:</strong><a href="mailto:andrzejczak.sebastian@gmail.com">Sebastian Andrzejczak</a><br />
        <strong>Marketing:</strong><a href="mailto:189913@edu.p.lodz.pl">Michał Lis</a>
    </address>
</asp:Content>
