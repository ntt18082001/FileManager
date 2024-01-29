﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FileManager.Index" %>

<%@ Register Src="~/UCFileManager/FileManager.ascx" TagPrefix="uc1" TagName="FileManager" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Demo chức năng quản lý file đơn giản trên webform</title>
    <link href="~/assets/libs/filemanager/filemanager.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">
        <div style="width: 1000px; margin: 50px auto;">

            <h1>Demo chức năng quản lý file</h1>
            <hr />
            <h3>Chạy độc lập</h3>
            <uc1:FileManager runat="server" ID="FileManager" Name="NameOfFileManager" AjaxPath="/FileManagerHandler.asmx" />

            <br />
            <h3>Tương tác với TinyMCE (Double click để chọn ảnh)</h3>
            <uc1:FileManager runat="server" ID="FileManager1" Name="FileManagerPopup" IsPopup="true" AjaxPath="/FileManagerHandler.asmx" />
            <textarea id="tinyMCEEditor"></textarea>
        </div>
    </form>

    <script src="/assets/libs/tinymce/js/tinymce/tinymce.min.js"></script>
    <script src="/assets/libs/tinymce/js/tinymce/langs/vi.js"></script>
    <script src="/assets/libs/jquery/jquery-3.6.0.min.js"></script>
    <script defer src="/assets/libs/alpinejs/alpinejs-3.13.5.min.js"></script>
    <script src="/assets/libs/filemanager/filemanager.js"></script>

    <script>
        var tinymecShowFileManager = (callback, value, meta) => {
            var fm = new FileManager('FileManagerPopup');
            // Để tên của file-manager cần show, thuộc tính Name
            fm.setFileManagerCallback(callback);
            fm.showFileManagerAsPopup();
        }
        var tinymceSetting = {
            selector: '#tinyMCEEditor',
            plugins: 'preview importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap pagebreak nonbreaking anchor insertdatetime advlist lists wordcount help charmap emoticons accordion',
            editimage_cors_hosts: ['picsum.photos'],
            menubar: 'file edit view insert format tools table help',
            toolbar: "undo redo | accordion accordionremove | blocks fontfamily fontsize | link image | bold italic underline strikethrough | align numlist bullist | table media | lineheight outdent indent| forecolor backcolor removeformat | charmap emoticons | code fullscreen preview | save print | pagebreak anchor codesample | ltr rtl",
            importcss_append: true,
            file_picker_callback: tinymecShowFileManager,
            height: 600,
            image_caption: true,
            quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quicktable',
            toolbar_mode: 'sliding',
            relative_urls: false
        };
        tinymce.init(tinymceSetting);

    </script>
</body>

</html>
