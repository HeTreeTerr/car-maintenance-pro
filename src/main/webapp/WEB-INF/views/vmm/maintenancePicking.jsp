<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
</head>
<body style="padding:5px;">
    <div class="easyui-layout" fit="true" border="false">
        <div region="center" border="false">
            <table fit="true" id="dg" class="easyui-datagrid" title="维修领料" iconCls="icon-comment_edit"
                   toolbar="#tb" idField="id"
                   data-options="pageSize:20,url:'${pageContext.request.contextPath}/vehicle/queryAllPickingRows.html'"
                   rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
                <thead>
                <tr> 
                	<th field="ordernumbering" align="center" width="50">接单流水号</th>
                	<th field="partname" align="center" width="50">零件</th>
                	<th field="purchaseprice" align="center" width="30">单价</th>
                	<th field="supplierName" align="center" width="80">供应商</th>
                	<th field="warehouseName" align="center" width="50" >仓库名</th> 
                	<th field="detaillocation" align="center" width="50">存放位置</th>
                	<th field="applicant" align="center" width="50">申请人</th>
                	<th field="jobnumber" align="center" width="50">申请人工号</th>
                	<th field="inventory" align="center" width="20">库存</th>
                	<th field="registedspecnum" align="center" width="20" >登记</th>
                    <th field="receivednum" align="center" width="20" >领取</th> 
                    <th field="applicattime" align="center" width="50">申请时间</th>
                    <th field="receivestatus" align="center" width="50">领取状态</th>
                    <th field="operation_action" 
                    	data-options="formatter:myformatter" 
                        align="center" width="80">操作</th> 
                        
                    <%-- 隐藏域 --%>
                    <th field="warehouseAdd" align="center" width="50" hidden="true">仓库地址</th>
                	<th field="warehouseid" align="center" width="50" hidden="true">仓库</th>
                    <th field="partusedid" align="center" width="50" hidden="true">零件使用登记表编号</th> 
                    <th field="concatinfo" align="center" width="50" hidden="true">申请人信息表编号</th> 
                    <th field="ordersid" align="center" width="50" hidden="true">接单表编号</th> 
                    <th field="customerid" align="center" width="50" hidden="true">客户编号</th>
                    <th field="vehicleid" align="center" width="50" hidden="true">汽车编号</th>
                    <th field="partid" align="center" width="50" hidden="true">零件编号</th>
                    <th field="partnumbering" align="center" width="50" hidden="true">零件流水号</th>  
                    <th field="categoryid" align="center" width="50" hidden="true">类别的编号</th>
                    <th field="supplierid" align="center" width="50" hidden="true">供应商编号</th>  
                    <th field="partstorageid" align="center" width="50" hidden="true">仓库存储表编号</th> 
                </tr>
                </thead>
            </table>
            <div id="tb" style="padding:10px">
                <label>维修人员:</label>
                <input type="text" id="key" class="easyui-textbox" prompt="请输入维修人员姓名/工号" style="height:26px;"/>
                 &nbsp;&nbsp;
                <span>领取状态:</span>
                <select class="easyui-combobox" id="reptStatus" style="width:150px;height:26px;">
                    <option value="W">待领取</option>
                    <option value="Y">已领取</option>
                </select>&nbsp;&nbsp; 
                <span>开始时间:</span>
                <input id="ds" type="text" value="3/4/2010 2:3" style="height:26px;" class="easyui-datebox"  />
                &nbsp;&nbsp;<span>结束时间:</span>
                <input id="de" type="text" value="3/4/2010 2:3" style="height:26px;" class="easyui-datebox"  />
                &nbsp;&nbsp; 
                <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
                &nbsp;&nbsp;
                <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton" onclick="doRefresh()">刷新</a>
               
            </div>

        </div>
        <div region="south" style="height:10px;" border="false">

        </div>
    </div>
    <%-- 页面的js部分 --%>
    <script type="text/javascript">
        // 模糊查询
    	function doSearch(){
    		let keyworld = $("#key").val();
    		$("#dg").datagrid('load',{
    			keyworld:keyworld,
    			startTime:$("#ds").datebox('getValue'),
    			endTime:$("#de").datebox('getValue'),
    			searchType_c:$("#reptStatus").combobox('getValue')
    		});
    	}
    	
        // 刷新
    	function doRefresh(){
    		$("#dg").datagrid("load");
    	}
    	
        // 格式化
    	function myformatter(value,row,index){
    		let a = '<a href="#" onclick="queryHistory" style="color:red;">查看历史</a>&nbsp;&nbsp;';// 查看配件领取历史
    		let b = '<a href="#" onclick="picking" style="color:green;">领取配件</a>';// 配件领取
    		return a+b;
    	}
    </script>
</body>
</html>