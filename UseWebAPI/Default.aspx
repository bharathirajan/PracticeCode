<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UseWebAPI._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script>
        function getProducts() {
            $.getJSON("api/products",
                function (data) {
                    $('#products').empty();

                    $.each(data, function (key, val) {
                        var row = '<td>' + val.Name + '</td><td>' + val.Price + '</td>';
                        $('<tr>' + row + '</tr>').appendTo($('#products'));
                    });
                });
        }
        $(document).ready(getProducts);
    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Products</h2>
    <table>
    <thead>
        <tr><th>Name</th><th>Price</th></tr>
    </thead>
    <tbody id="products">
    </tbody>
    </table>
</asp:Content>
