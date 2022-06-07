<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Urunler.aspx.cs" Inherits="odev3.Urunler.Urunler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <table class="table table-bordered">
        <tr>
            <th>KATEGORI ID</th>
            <th>KATEGORI AD</th>
            <th>SİL</th>
            <th>GÜNCELLE</th>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("urunid") %></td>
                    <td><%#Eval("urunad") %></td>
                    <td><%#Eval("urunmarka") %></td>
                    <td><%#Eval("kategoriad") %></td>
                    <td><%#Eval("urunfiyat") %></td>
                    <td><%#Eval("urunstok") %></td>

                     <td> <asp:HyperLink NavigateUrl='<%#"~/Urun/UrunSil.aspx?urunid="+Eval("urunid") %>' ID="HyperLink1" runat="server" CssClass="btn btn-danger">Sil</asp:HyperLink></td>

                     <td> <asp:HyperLink NavigateUrl='<%#"~/Urun/UrunGuncelle.aspx?urunid="+Eval("urunid") %>' ID="HyperLink2" runat="server" CssClass="btn btn-danger">Güncelle</asp:HyperLink></td>

                </tr>
            </ItemTemplate>
        </asp:Repeater>

    </table>
    <a href="YeniUrun.Aspx" class="btn btn-success">Yeni Urun Ekle</a>
</asp:Content>
