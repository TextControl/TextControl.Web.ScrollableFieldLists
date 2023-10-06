<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication37.WebForm1" %>

<%@ Register Assembly="TXTextControl.Web, Version=32.0.1200.500, Culture=neutral, PublicKeyToken=6b83fe9a75cfb638" Namespace="TXTextControl.Web" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TX Text Control Sample: Set scrollable field lists</title>
    <script src="Scripts/jquery-3.6.0.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>


        <cc1:TextControl ID="TextControl1" runat="server" Dock="Window" />

        <script>

            var interval;

            // after the complete ribbon is loaded, "listen" to the
            // "Insert Merge Field" drop-down to see whether the
            // database is loaded completely
            TXTextControl.addEventListener("ribbonTabsLoaded", function (e) {
                interval = setInterval(SetScrollbars, 500);
            });

            // if button doesn't have the "disabled" class anymore
            function SetScrollbars() {
                if (!$("#drpDnBtnInsertMergeField").hasClass("ui-state-disabled")) {

                    clearInterval(interval);

                    // find the last "ul" element and set the height and
                    // overflow properties
                    $("#insertMergeFieldDropDown").find("li").each(function () {
                        $(this).find("ul").last().css({
                            "max-height": "150px",
                            "overflow-y": "scroll",
                            "width": $(this).width() + 50
                        });
                    });
                }
            };

        </script>
    </div>
    </form>
</body>
</html>
