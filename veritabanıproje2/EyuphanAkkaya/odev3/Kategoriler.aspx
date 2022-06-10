<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Kategoriler.aspx.cs" Inherits="odev3.Kategoriler" %>

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
                    <td><%#Eval("kategoriid") %></td>
                     <td><%#Eval("kategoriad") %></td>
                     <td> <asp:HyperLink NavigateUrl='<%#"~/KategoriSil.aspx?kategoriid="+Eval("kategoriid") %>' ID="HyperLink1" runat="server" CssClass="btn btn-danger">Sil</asp:HyperLink></td>
                     <td> <asp:HyperLink NavigateUrl='<%#"~/KategoriGuncelle.aspx?kategoriid="+Eval("kategoriid") %>' ID="HyperLink2" runat="server" CssClass="btn btn-warning">Güncelle</asp:HyperLink></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>

    </table>
    <a href="KategoriEkle.Aspx" class="btn btn-success">Yeni Kayıt Ekle</a>
</asp:Content>
