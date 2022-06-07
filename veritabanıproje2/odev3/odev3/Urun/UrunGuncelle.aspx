<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UrunGuncelle.aspx.cs" Inherits="odev3.Urun.UrunGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

      <form runat="server" class="form-group">
     <div>
        <asp:TextBox ID="Txtad" runat="server" placeholder="Urun Adını Giriniz.." CssClass="form-control"></asp:TextBox>
    </div>
          </br>
    <div>
        <asp:TextBox ID="Txtmarka" runat="server" placeholder="Urun Marka Adını Giriniz.." CssClass="form-control"></asp:TextBox>
    </div>
         </br>
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>
         </br>
    <div>
        <asp:TextBox ID="Txtfiyat" runat="server" placeholder="Ürün Fiyatını Giriniz.." CssClass="form-control"></asp:TextBox>
    </div>
         </br>
    <div>
        <asp:TextBox ID="Txtstok" runat="server" placeholder="Stok Sayısı Giriniz.." CssClass="form-control"></asp:TextBox>
    </div>
            </br>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Ürün Güncelle"  CssClass="btn btn-danger" OnClick="Button1_Click"   />

    </div>
    </form>

</asp:Content>
