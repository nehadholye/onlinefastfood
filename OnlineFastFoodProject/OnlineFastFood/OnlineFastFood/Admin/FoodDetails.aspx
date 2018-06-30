<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AHome.Master" AutoEventWireup="true" CodeBehind="FoodDetails.aspx.cs" Inherits="OnlineFastFood.Admin.FoodDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%">
        <tr>
            <td>
                Food Category:</td>
            <td>
                <asp:DropDownList ID="ddfoodcategory" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Food Name:</td>
            <td>
                <asp:TextBox ID="txtfoodname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtfoodname" ErrorMessage="Food name should not empty" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtfoodname" Display="Dynamic" 
                    ErrorMessage="Foodname should be valid" ForeColor="Red" SetFocusOnError="True" 
                    ValidationExpression="[a-zA-Z]*$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Food Details:</td>
            <td>
                <asp:TextBox ID="txtfooddetails" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtfooddetails" ErrorMessage="Food details should not empty" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtfooddetails" Display="Dynamic" 
                    ErrorMessage="Food details should be valid" ForeColor="Red" 
                    SetFocusOnError="True" ValidationExpression="[a-zA-Z]*$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Now price:</td>
            <td>
                <asp:TextBox ID="txtnowprice" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtnowprice" ErrorMessage="now price should not empty" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtnowprice" Display="Dynamic" 
                    ErrorMessage="now price should be valid" ForeColor="Red" 
                    ValidationExpression="^[0-9]{4}$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Was price:</td>
            <td>
                <asp:TextBox ID="txtwasprice" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtwasprice" ErrorMessage="was price should not empty" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtwasprice" Display="Dynamic" 
                    ErrorMessage="RegularExpressionValidator" ForeColor="Red" 
                    SetFocusOnError="True" ValidationExpression="^[0-9]{4}$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Image1:</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Image2:</td>
            <td>
                <asp:FileUpload ID="FileUpload2" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                    onclick="btnsubmit_Click" />
                <asp:Button ID="btnreset" runat="server" Text="Reset" />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblcatid" runat="server" Text='<%# Eval("catid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Foodname">
                            <ItemTemplate>
                                <asp:Label ID="lblfoodname" runat="server" Text='<%# Eval("fdname") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtfoodname" runat="server" Text='<%# Eval("fdname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtfooterfoodname" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Category name">
                            <ItemTemplate>
                                <asp:Label ID="lblcname" runat="server" Text='<%# Eval("cname") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtcname" runat="server" Text='<%# Eval("cname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtfootercname" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Details">
                            <ItemTemplate>
                                <asp:Label ID="lbldetails" runat="server" Text='<%# Eval("fddetails") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtdetails" runat="server" Text='<%# Eval("fddetails") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtfooterdetails" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image1">
                            <ItemTemplate>
                                <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("image1") %>' 
                                    Height="75px" Width="75px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image2">
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" Height="75px" 
                                    ImageUrl='<%# Eval("image2") %>' Width="75px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Operation">
                            <ItemTemplate>
                                <asp:Button ID="btnedit" runat="server" CommandName="Edit" Text="Edit" />
                                <asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
