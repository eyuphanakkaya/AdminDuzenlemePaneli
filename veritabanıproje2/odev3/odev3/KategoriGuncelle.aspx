<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="KategoriGuncelle.aspx.cs" Inherits="odev3.KategoriGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

     <form runat="server" class="form-group">

         <div>
        <asp:TextBox ID="Txtid" runat="server"  CssClass="form-control" Enabled="false"></asp:TextBox>
    </div>
        </br>
    <div>
        <asp:TextBox ID="Txtad" runat="server" placeholder="Kategori Adını Giriniz.." CssClass="form-control"></asp:TextBox>
    </div>
        </br>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Kategori Güncelle"  CssClass="btn btn-default" OnClick="Button1_Click" />

    </div>
    </form>
</asp:Content>
