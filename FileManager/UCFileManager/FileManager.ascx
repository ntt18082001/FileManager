﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileManager.ascx.cs" Inherits="FileManager.UCFileManager.FileManager" %>


<div x-data="filemanager('<%=Name %>','<%=AjaxPath %>')" class="filemanager__container">
    <div class="filemanager__dir-tree">
        <div class="dir-item" x-on:click="getDirsIn(null, -1)">
        <img src="assets/libs/filemanager/icon/hdd-solid.svg" class="dir-icon" />
        <span>Thư mục gốc</span>
    </div>
        <template x-for="(d, idx) in _dirs">
            <div class="dir-item"
                :class="{['dir-item-level-' + d.level]: true, selected: idx == _dirSelectedIndex}"
                x-on:click="getDirsIn(d, idx)">
                <template x-if="idx == _dirSelectedIndex">
                    <img src="/assets/libs/filemanager/icon/folder-open-solid.svg" class="dir-icon" />
                </template>
                <template x-if="idx != _dirSelectedIndex">
                    <img src="/assets/libs/filemanager/icon/folder-solid.svg" class="dir-icon" />
                </template>
                <span x-text="d.name"></span>
            </div>
        </template>
    </div>

    <div class="filemanager__panel">
        <div class="panel-toolbox">
            <div class="panel-toolbox__upload-file">
                <input type="file" id="fInputFileUpload" x-ref="fileUpload" multiple x-on:change="changeLabelUpload()" />
                <label x-ref="labelFileUpload" for="fInputFileUpload">Nhấn để chọn file</label>
                <button x-on:click="uploadFile()" class="fbutton" type="button">Upload</button>
            </div>
            <div class="panel-toolbox__new-folder ml-1">
                <div class="d-flex" x-show="_toolbox.isShowNewFolder">
                    <input type="text" class="finput-text" x-ref="newFolderName" placeholder="Tên thư mục mới" />
                    <button class="fbutton ml-1" type="button" x-on:click="createNewFolder()">Tạo</button>
                    <button class="fbutton red ml-1" type="button" x-on:click="_toolbox.isShowNewFolder = false">&times;</button>
                </div>
                <button class="fbutton ml-1" type="button" x-on:click="_toolbox.isShowNewFolder = true" x-show="_toolbox.isShowNewFolder == false">
                    <img src="/assets/libs/filemanager/icon/folder-plus-solid.svg" class="dir-icon"/>
                </button>
            </div>
        </div>
        <div class="filemanager__panel-container">
            <template x-for="(f, idx) in _filesAndFolders">
                <div class="panel-item" :class="{selected: idx == _fileSelectedIndex}" :title="f.name" 
                    x-on:click="selectItemInPanel(f.fullPath, idx)" x-on:dblclick="openItem(f)">
                    <div class="panel-item__thumb">
                        <img :src="f.thumb" />
                    </div>
                    <div class="panel-item__filename" x-text="f.name"></div>
                </div>
            </template>
            <div class="empty-folder" x-show="_filesAndFolders == null || _filesAndFolders.length == 0">Thư mục rỗng!</div>
        </div>
        <div class="panel-bottom">
            Đường dẫn: <span x-text="_dirSelectedPath ? _dirSelectedPath : '/'"></span> |
            Đang chọn: <span x-text="_fileSelected"></span>
        </div>
    </div>

</div>