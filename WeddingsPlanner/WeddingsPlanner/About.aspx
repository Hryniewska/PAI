<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WeddingsPlanner.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <h2><%: Title %> - moduł główny</h2>
    <br />
    <p>
        Łączy się z serwerem lokalnym trzykrotnie (gdy para młoda wypełni wszystkie najistotniejsze informacje na serwerze lokalnym, wraz z końcem terminu potwierdzania obecności gości na weselu oraz 2 tyg. przed weselem).
        <ul>
             <li>ma przechowywać końcową listę prezentów - ile należy zarezerwować w sklepie prezentów</li>
             <li>liczbę osób, które potwierdziło obecność (dzieci do 7 lat, młodzież do 18 lat, dorośli) - dla firmy cateringowej, aby wiedziała ile jedzenia przygotować oraz do rezerwacji odpowiedniej wielkości sali weselnej</li>
             <li>termin wesela - do rezerwacji sali weselnej</li>
         </ul>
    </p>
</asp:Content>
