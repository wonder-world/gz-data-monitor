<%--
  Created by IntelliJ IDEA.
  User: lizhongzheng
  Date: 2018/8/3
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>药品不良反应事件报告表</title>
    <style>
        #div1 {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            width: 800px;
        }
    </style>
</head>
<body>
<div id="div1">
    <div>
        <p style="margin:0pt; orphans:0; text-align:right; widows:0"><span
                style="font-family:'Times New Roman'; font-size:7.5pt; font-weight:bold">&#xa0;</span></p>
        <p style="margin:0pt; orphans:0; text-align:right; widows:0"><span
                style="font-family:'Times New Roman'; font-size:9pt; font-weight:bold">&#xa0;</span></p>
        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                style="font-family:黑体; font-size:14pt">　</span><span
                style="font-family:黑体; font-size:14pt">附表1</span></p>
        <p style="font-size:18pt; line-height:150%; margin:0pt; orphans:0; text-align:center; widows:0"><span
                style="font-family:方正小标宋_GBK; font-size:18pt">药 品 不 良 反 应 / 事 件 报 告 表</span></p>
        <p style="line-height:12pt; margin:0pt; orphans:0; text-align:justify; text-indent:10.5pt; widows:0"><span><span
                style="font-family:宋体; font-size:9pt; font-weight:normal;float: left" ;>报告频率：</span><span
                style="font-family:宋体; font-size:9pt; font-weight:normal;float: left" ;>
             <c:if test="${AdverseEventlist.reportFollow == 0}">
                 首次报告
             </c:if><c:if test="${AdverseEventlist.reportFollow == 1}">
            跟踪报告
        </c:if>
            </span></span><span
                style="margin-left: 458px;">  <span
                style="font-family:宋体; font-size:9pt; font-weight:normal;">编码:</span><span
                style="font-family:宋体; font-size:9pt; font-weight:normal">${AdverseEventlist.reportCode}</span></span>
        </p>
        <p style="line-height:12pt; margin:0pt; orphans:0; text-align:justify; text-indent:10.5pt; widows:0"><span><span
                style="font-family:宋体; font-size:9pt; font-weight:normal;float: left" ;>报告类型：</span><span
                style="font-family:宋体; font-size:9pt; font-weight:normal;float: left" ;>
        <c:if test="${AdverseEventlist.reportType == 0}">
            新的
        </c:if><c:if test="${AdverseEventlist.reportType == 1}">
            严重
        </c:if><c:if test="${AdverseEventlist.reportType == 2}">
            一般
        </c:if>
        </span></span><span
                style="margin-left: 480px;">  <span
                style="font-family:宋体; font-size:9pt; font-weight:normal;">报告单位类别：</span><span
                style="font-family:宋体; font-size:9pt; font-weight:normal">
            <c:if test="${AdverseEventlist.reportUnitType == 0}">
                医疗机构
            </c:if><c:if test="${AdverseEventlist.reportUnitType == 1}">
            经营企业
        </c:if><c:if test="${AdverseEventlist.reportUnitType == 2}">
            生产企业
        </c:if><c:if test="${AdverseEventlist.reportUnitType == 3}">
            个人
        </c:if><c:if test="${AdverseEventlist.reportUnitType == 4}">
            <c:if test="${AdverseEventlist.reportUnitDescribe != null}">
                ${AdverseEventlist.reportUnitDescribe}
            </c:if>
        </c:if>
           </span></span>
        </p>
        <p style="margin:0pt; orphans:0; text-align:justify; text-indent:5.25pt; widows:0">
            <span style="font-family:宋体; font-size:9pt"></span>
        </p>
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse; margin-left:5pt; width:565.45pt">
            <tr style="height:23.7pt">
                <td colspan="4"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:82.75pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">患者姓名</span><span
                            style="font-family:宋体; font-size:9pt">：${AdverseEventlist.patientName}</span>
                    </p>
                </td>
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:62.85pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">性别:</span><span
                            style="font-family:宋体; font-size:9pt">${AdverseEventlist.sex}</span></p>
                </td>
                <td colspan="5"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:105.5pt">
                    <p style="margin:0pt; orphans:0; padding-left:21pt; text-align:justify; text-indent:-21pt; widows:0">
                        <span style="font-family:宋体; font-size:9pt">出生日期</span><span
                            style="font-family:宋体; font-size:9pt">：${AdverseEventlist.birthday}</span>
                    </p>
                </td>
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:52.2pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">民族</span><span
                            style="font-family:宋体; font-size:9pt">：${AdverseEventlist.nation}</span></p>
                </td>
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:76.15pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">体重</span><span
                            style="font-family:宋体; font-size:9pt">（</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">kg</span><span
                            style="font-family:宋体; font-size:9pt">）：${AdverseEventlist.weight}</span></p>
                </td>
                <td colspan="2"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:120.45pt">
                    <p style="margin:0pt; text-align:justify"><span
                            style="font-family:宋体; font-size:9pt">联系方式：${AdverseEventlist.telephoneNumber}</span></p>
                </td>
                <td style=" vertical-align:top"></td>
            </tr>
            <tr style="height:26.7pt">
                <td colspan="6"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:top; width:127.6pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">原患疾病：${AdverseEventlist.diseaseName}</span></p>
                </td>
                <td colspan="6"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:134.3pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">医院名称：${AdverseEventlist.hospital} </span></p>
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">病历号</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">/</span><span
                            style="font-family:宋体; font-size:9pt">门诊号：${AdverseEventlist.visitingSerialNumber}</span>
                    </p>
                </td>
                <td colspan="8"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:top; width:270.4pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">既往药品不良反应</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">/</span><span
                            style="font-family:宋体; font-size:9pt">事件</span><span
                            style="font-family:宋体; font-size:9pt">：
                                        <c:if test="${AdverseEventlist.pastDrugs == 0}">
                                            有
                                        </c:if>
                                        <c:if test="${AdverseEventlist.pastDrugs == 1}">
                                            无
                                        </c:if>
                                        <c:if test="${AdverseEventlist.pastDrugs == 2}">
                                            不祥
                                        </c:if>
                    </span></p>
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">家族药品不良反</span><span
                            style="font-family:宋体; font-size:9pt">应</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">/</span><span
                            style="font-family:宋体; font-size:9pt">事件</span><span
                            style="font-family:宋体; font-size:9pt">：<c:if test="${AdverseEventlist.familyDurgs == 0}">
                        有
                    </c:if>
                                        <c:if test="${AdverseEventlist.familyDurgs == 1}">
                                            无
                                        </c:if>
                                        <c:if test="${AdverseEventlist.familyDurgs == 2}">
                                            不祥
                                        </c:if></span></p>
                </td>
                <td style=" vertical-align:top"></td>
            </tr>
            <tr style="height:19.9pt">
                <td colspan="20"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:553.45pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">相关重要信息</span><span
                            style="font-family:宋体; font-size:9pt">：
                        <c:if test="${AdverseEventlist.smokingStatus == 1}">
                            吸烟史√
                        </c:if>
                        <c:if test="${AdverseEventlist.drinking == 1}">
                            饮酒史√
                        </c:if>
                        <c:if test="${AdverseEventlist.gestation == 1}">
                            妊娠期√
                        </c:if>
                        <c:if test="${AdverseEventlist.hepatopathy == 1}">
                            肝病史√
                        </c:if>
                        <c:if test="${AdverseEventlist.nephropathy == 1}">
                            肾病史√
                        </c:if>
                        <c:if test="${AdverseEventlist.allergy == 1}">
                            过敏史√
                            <c:if test="${AdverseEventlist.allergyDescribe != ''}">
                                过敏史描述:${AdverseEventlist.allergyDescribe}
                            </c:if>
                        </c:if>
                        其他：${AdverseEventlist.otherMessage}
                    </span>
                    </p>
                </td>
                <td style=" vertical-align:top"></td>
            </tr>
            <tr style="height:19.9pt">
                <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:10.05pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">药品</span></p>
                </td>
                <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.6pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">批准文号</span></p>
                </td>
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.45pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">商品名称</span></p>
                </td>
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:57.45pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">通用名称</span></p>
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">（含剂型）</span></p>
                </td>
                <td colspan="4"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">生产厂家</span></p>
                </td>
                <td colspan="2"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:38.95pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">生产批号</span></p>
                </td>
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">用法用量</span></p>
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:7.5pt">（次剂量、途径、</span><span
                            style="font-family:宋体; font-size:7.5pt">日次数</span><span
                            style="font-family:宋体; font-size:7.5pt">）</span>
                    </p>
                </td>
                <td colspan="2"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:62.7pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">用药起止时间</span></p>
                </td>
                <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:46.95pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">用药原因</span></p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <c:if test="${AdverseEventlist.drugAdverseEventDrugModelViews.size() == 0}">
                <tr style="height:22.7pt">
                    <td rowspan="1" style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:10.05pt">
                        <p style="margin:0pt; orphans:0; text-align:center; widows:0">
                            <span style="font-family:宋体; font-size:9pt">怀疑药品</span></p>
                    </td>
                    <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.6pt">
                        <p style="margin:0pt"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="3" style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.45pt">
                        <p style="margin:0pt"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="3"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:57.45pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="4"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="2"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:38.95pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span></p>
                    </td>
                    <td colspan="3"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="2"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:62.7pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:46.95pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt; font-weight:bold">&#xa0;</span>
                        </p>
                    </td>
                    <td style="vertical-align:top"></td>
                </tr>
                <tr style="height:22.7pt">
                    <td rowspan="1" style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:10.05pt">
                        <p style="margin:0pt; orphans:0; text-align:center; widows:0">
                            <span style="font-family:宋体; font-size:9pt">并用药品</span>
                        </p>
                    </td>
                    <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.6pt">
                        <p style="margin:0pt"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="3"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.45pt">
                        <p style="margin:0pt"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="3"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:57.45pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="4"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="2"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:38.95pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span></p>
                    </td>
                    <td colspan="3"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td colspan="2"
                        style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:62.7pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span>
                        </p>
                    </td>
                    <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:46.95pt">
                        <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                style="font-family:'Times New Roman'; font-size:9pt; font-weight:bold">&#xa0;</span>
                        </p>
                    </td>
                    <td style="vertical-align:top"></td>
                </tr>
            </c:if>
            <c:if test="${AdverseEventlist.drugAdverseEventDrugModelViews.size() > 0 }">
            <c:forEach items="${AdverseEventlist.drugAdverseEventDrugModelViews}" var="vlist" varStatus="status">
                <c:if test="${vlist.drugType == 0}">
                    <tr style="height:22.7pt">
                        <c:if test="${status.index==0}">
                            <td rowspan="${AdverseEventlist.hyIndex}"
                                style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:10.05pt">
                                <p style="margin:0pt; orphans:0; text-align:center; widows:0">
                                    <span style="font-family:宋体; font-size:9pt">怀疑药品</span></p>
                            </td>
                        </c:if>
                        <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.6pt">
                            <p style="margin:0pt"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.approvalNumber}</span>
                            </p>
                        </td>
                        <td colspan="3" style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.45pt">
                            <p style="margin:0pt"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.mediName}</span>
                            </p>
                        </td>
                        <td colspan="3"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:57.45pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.currencyName}</span>
                            </p>
                        </td>
                        <td colspan="4"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.manufacturer}</span>
                            </p>
                        </td>
                        <td colspan="2"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:38.95pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span></p>
                        </td>
                        <td colspan="3"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.use}</span>
                            </p>
                        </td>
                        <td colspan="2"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:62.7pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.beginDate}至${vlist.endDate}</span>
                            </p>
                        </td>
                        <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:46.95pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt; font-weight:bold">&#xa0;${vlist.useReason}</span>
                            </p>
                        </td>
                        <td style="vertical-align:top"></td>
                    </tr>
                </c:if>
                <c:if test="${vlist.drugType == 1}">
                    <tr style="height:22.7pt">
                        <c:if test="${status.index==AdverseEventlist.hyIndex}">
                            <td rowspan="${AdverseEventlist.byIndex}" style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:10.05pt">
                                <p style="margin:0pt; orphans:0; text-align:center; widows:0">
                                    <span style="font-family:宋体; font-size:9pt">并用药品</span>
                                </p>
                            </td>
                        </c:if>
                        <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.6pt">
                            <p style="margin:0pt"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.approvalNumber}</span>
                            </p>
                        </td>
                        <td colspan="3"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:36.45pt">
                            <p style="margin:0pt"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.mediName}</span>
                            </p>
                        </td>
                        <td colspan="3"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:57.45pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.currencyName}</span>
                            </p>
                        </td>
                        <td colspan="4"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.manufacturer}</span>
                            </p>
                        </td>
                        <td colspan="2"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:38.95pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span></p>
                        </td>
                        <td colspan="3"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.95pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.use}</span>
                            </p>
                        </td>
                        <td colspan="2"
                            style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:62.7pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${vlist.beginDate}至${vlist.endDate}</span>
                            </p>
                        </td>
                        <td style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:46.95pt">
                            <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                                    style="font-family:'Times New Roman'; font-size:9pt; font-weight:bold">&#xa0;${vlist.useReason}</span>
                            </p>
                        </td>
                        <td style="vertical-align:top"></td>
                    </tr>
                </c:if>
            </c:forEach>
</c:if>

            <tr style="height:24.1pt">
                <td colspan="11"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:251.6pt">
                    <p style="line-height:12pt; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">不良反应</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">/</span><span
                            style="font-family:宋体; font-size:9pt">事件名称</span><span
                            style="font-family:宋体; font-size:9pt">：${AdverseEventlist.adverseEventName}</span></p>
                </td>
                <td colspan="9"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:291.05pt">
                    <p style="line-height:12pt; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">不良反应</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">/</span><span
                            style="font-family:宋体; font-size:9pt">事件发生时间</span><span
                            style="font-family:宋体; font-size:9pt">：${AdverseEventlist.adverseEventDate}　　</span>
                    </p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:101.95pt">
                <td colspan="20"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:top; width:553.45pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">不良反应</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">/</span><span
                            style="font-family:宋体; font-size:9pt">事件过程描述（包括症状、体征、临床检验等）及处理情况</span><span
                            style="font-family:宋体; font-size:9pt">（可附页）</span><span
                            style="font-family:宋体; font-size:9pt">：${AdverseEventlist.adverseEventDescribe}</span></p>
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:'Times New Roman'; font-size:9pt">&#xa0;</span></p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:24.1pt">
                <td colspan="20"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:553.45pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">不良反应</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">/</span><span
                            style="font-family:宋体; font-size:9pt">事件的结果</span><span
                            style="font-family:宋体; font-size:9pt">：
                        <c:if test="${AdverseEventlist.result == 0}">
                            痊愈
                        </c:if><c:if test="${AdverseEventlist.result == 1}">
                            好转
                        </c:if><c:if test="${AdverseEventlist.result == 3}">
                            未好转
                        </c:if><c:if test="${AdverseEventlist.result == 4}">
                            不祥
                        </c:if><c:if test="${AdverseEventlist.result == 5}">
                            有后遗症
                        </c:if><c:if test="${AdverseEventlist.result == 6}">
                            死亡
                        </c:if>
                    </span>
                    </p>
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">直接死因</span><span
                            style="font-family:宋体; font-size:9pt">：${AdverseEventlist.causeOfDeath}</span>
                    </p>
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">死亡时间</span><span
                            style="font-family:宋体; font-size:9pt">：${AdverseEventlist.timeOfDeath}</span>
                    </p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:36.45pt">
                <td colspan="20"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:553.45pt">
                    <p style="line-height:12pt; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">停药或减量后，反应</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">/</span><span
                            style="font-family:宋体; font-size:9pt">事件是否消失或减轻？</span><span
                            style="font-family:宋体; font-size:9pt">  <c:if test="${AdverseEventlist.useAgain == 0}">
                        是
                    </c:if><c:if test="${AdverseEventlist.useAgain == 1}">
                        否
                    </c:if><c:if test="${AdverseEventlist.useAgain == 2}">
                        不明
                    </c:if><c:if test="${AdverseEventlist.useAgain == 3}">
                        未停药或减量
                    </c:if> </span></p>
                    <p style="line-height:12pt; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">再次使用可疑药品后是否再次出现同样反应</span><span
                            style="font-family:'Times New Roman'; font-size:9pt">/</span><span
                            style="font-family:宋体; font-size:9pt">事件？</span><span style="font-family:宋体; font-size:9pt">   <c:if
                            test="${AdverseEventlist.lessenTheSymptoms == 0}">
                        是
                    </c:if><c:if test="${AdverseEventlist.lessenTheSymptoms == 1}">
                        否
                    </c:if><c:if test="${AdverseEventlist.lessenTheSymptoms == 2}">
                        不明
                    </c:if><c:if test="${AdverseEventlist.lessenTheSymptoms == 3}">
                        未再使用
                    </c:if>  </span>
                    </p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:18.8pt">
                <td colspan="20"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:553.45pt">
                    <p style="line-height:12pt; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">对原患疾病的影响：</span><span
                            style="font-family:宋体; font-size:9pt">
                        <c:if test="${AdverseEventlist.patientImpact == 0}">
                            不明显
                        </c:if><c:if test="${AdverseEventlist.patientImpact == 1}">
                            病程延长
                    </c:if><c:if test="${AdverseEventlist.patientImpact == 2}">
                            病情加重
                    </c:if><c:if test="${AdverseEventlist.patientImpact == 3}">
                            导致后遗症
                    </c:if><c:if test="${AdverseEventlist.patientImpact == 4}">
                            导致死亡
                    </c:if> 
                       </span></p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:41.9pt">
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:67.4pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">关联性评价</span></p>
                </td>
                <td colspan="17"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:475.25pt">
                    <div>
                        <div style="display: flex">
                            <div style="float:left;width: 50%">
                                <span style="font-family:宋体; font-size:9pt">报告人评价：</span>
                                <span style="font-family:宋体; font-size:9pt">
                                  <c:if test="${AdverseEventlist.reportEvaluate == 1}">
                                    肯定
                                </c:if><c:if test="${AdverseEventlist.reportEvaluate == 2}">
                                    很可能
                                </c:if><c:if test="${AdverseEventlist.reportEvaluate == 3}">
                                    可能
                                </c:if><c:if test="${AdverseEventlist.reportEvaluate == 4}">
                                    可能无关
                                </c:if><c:if test="${AdverseEventlist.reportEvaluate == 5}">
                                    待评价
                                </c:if>
                                    <c:if test="${AdverseEventlist.reportEvaluate == 6}">
                                        无法评价
                                </c:if>
                                </span>
                            </div>
                            <div style="float:left;width: 50%">
                                <span style="font-family:宋体; font-size:9pt;">签名：</span>
                                <span style="font-family:宋体; font-size:9pt;"></span>
                            </div>
                        </div>
                        <div style="display: flex">
                            <div style="float: left;width: 50%">
                                <span style="font-family:宋体; font-size:9pt;">报告单位评价：</span>
                                <span style="font-family:宋体; font-size:9pt;">
                                     <c:if test="${AdverseEventlist.reportUnitEvaluate == 1}">
                                         肯定
                                     </c:if><c:if test="${AdverseEventlist.reportUnitEvaluate == 2}">
                                    很可能
                                </c:if><c:if test="${AdverseEventlist.reportUnitEvaluate == 3}">
                                    可能
                                </c:if><c:if test="${AdverseEventlist.reportUnitEvaluate == 4}">
                                    可能无关
                                </c:if><c:if test="${AdverseEventlist.reportUnitEvaluate == 5}">
                                    待评价
                                </c:if>
                                    <c:if test="${AdverseEventlist.reportUnitEvaluate == 6}">
                                        无法评价
                                    </c:if>
                                   </span>
                            </div>
                            <div style="float: left;width: 10%">
                                <span style="font-family:宋体; font-size:9pt;">签名：</span>
                                <span style="font-family:宋体; font-size:9pt;"></span>
                            </div>
                        </div>
                    </div>

                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:23.25pt">
                <td colspan="3" rowspan="2"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:67.4pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">报告人信息</span></p>
                </td>
                <td colspan="10"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:162.9pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">联系电话：${AdverseEventlist.reportTel}</span></p>
                </td>
                <td colspan="7"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:301.55pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">职业：

                         <c:if test="${AdverseEventlist.reportJob == 0}">
                             医生
                         </c:if><c:if test="${AdverseEventlist.reportJob == 1}">
                            药师
                        </c:if><c:if test="${AdverseEventlist.reportJob == 2}">
                            护士
                        </c:if><c:if test="${AdverseEventlist.reportJob == 3}">
    ${AdverseEventlist.reportJobDescribe }
                        </c:if>
                       </span></p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:28pt">
                <td colspan="10"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:233.55pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">电子邮</span><span
                            style="font-family:宋体; font-size:9pt">箱：${AdverseEventlist.reportEmail}</span></p>
                </td>
                <td colspan="7"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:230.9pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">签名：</span></p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:23.2pt">
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:67.4pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">报告单位信息</span></p>
                </td>
                <td colspan="6"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:136.45pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">单位</span><span
                            style="font-family:宋体; font-size:9pt">名称</span><span
                            style="font-family:宋体; font-size:9pt">：${AdverseEventlist.reportUnitName}</span></p>
                </td>
                <td colspan="4"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:86.3pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">联系人：${AdverseEventlist.reportUnitContacts}</span></p>
                </td>
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:94.4pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">电话：${AdverseEventlist.reportUnitTel}</span></p>
                </td>
                <td colspan="4"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:125.7pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt">报告日期：${AdverseEventlist.reportDate}</span></p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:28.3pt">
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:67.4pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">生产企业请</span></p>
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">填写信息来源</span></p>
                </td>
                <td colspan="17"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:475.25pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:宋体; font-size:9pt"><c:if test="${AdverseEventlist.manuFrom == 0}">
                        医疗机构
                    </c:if><c:if test="${AdverseEventlist.manuFrom == 1}">
                        经营企业
                    </c:if><c:if test="${AdverseEventlist.manuFrom == 2}">
                        个人
                    </c:if><c:if test="${AdverseEventlist.manuFrom == 3}">
                        文献报道
                    </c:if><c:if test="${AdverseEventlist.manuFrom == 4}">
                        上市后研究
                    </c:if><c:if test="${AdverseEventlist.manuFrom == 5}">
    ${AdverseEventlist.manuFromDescribe}
                    </c:if></span></p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:27.6pt">
                <td colspan="3"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:67.4pt">
                    <p style="margin:0pt; orphans:0; text-align:center; widows:0"><span
                            style="font-family:宋体; font-size:9pt">备注</span></p>
                </td>
                <td colspan="17"
                    style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:475.25pt">
                    <p style="margin:0pt; orphans:0; text-align:justify; widows:0"><span
                            style="font-family:'Times New Roman'; font-size:9pt">&#xa0;${AdverseEventlist.remark}</span>
                    </p>
                </td>
                <td style="vertical-align:top"></td>
            </tr>
            <tr style="height:0pt">
                <td style="width:20.85pt; border:none"></td>
                <td style="width:47.4pt; border:none"></td>
                <td style="width:9.95pt; border:none"></td>
                <td style="width:15.35pt; border:none"></td>
                <td style="width:21.95pt; border:none"></td>
                <td style="width:22.9pt; border:none"></td>
                <td style="width:28.8pt; border:none"></td>
                <td style="width:16.55pt; border:none"></td>
                <td style="width:41.7pt; border:none"></td>
                <td style="width:26.45pt; border:none"></td>
                <td style="width:10.5pt; border:none"></td>
                <td style="width:21.1pt; border:none"></td>
                <td style="width:39.05pt; border:none"></td>
                <td style="width:10.7pt; border:none"></td>
                <td style="width:13.25pt; border:none"></td>
                <td style="width:81.25pt; border:none"></td>
                <td style="width:5.25pt; border:none"></td>
                <td style="width:0.45pt; border:none"></td>
                <td style="width:73.05pt; border:none"></td>
                <td style="width:57.75pt; border:none"></td>
                <td style="width:0.45pt; border:none"></td>
            </tr>
        </table>
        <br style="clear:both; mso-break-type:section-break; page-break-before:always"/>
    </div>
    <div style="padding: 0 40px 0  20px">
        <p style="font-size:9pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                style="font-family:'Times New Roman'; font-size:9pt; font-weight:bold">&#xa0;</span></p>
        <p style="font-size:14pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                style="font-family:宋体; font-size:14pt; font-weight:bold">严重药品不良反应,</span><span
                style="font-family:宋体; font-size:14pt; font-weight:bold">是指因使用药品引起以下损害情形之一的反应</span>
            <span style="font-family:宋体; font-size:14pt; font-weight:bold">：</span></p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:'Times New Roman'; font-size:10.5pt">1) </span><span
                style="font-family:宋体; font-size:10.5pt">导致死亡；</span></p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:'Times New Roman'; font-size:10.5pt">2</span><span
                style="font-family:宋体; font-size:10.5pt">）危及</span><span
                style="font-family:宋体; font-size:10.5pt">生命； </span></p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:'Times New Roman'; font-size:10.5pt">3</span><span
                style="font-family:宋体; font-size:10.5pt">）</span><span
                style="font-family:宋体; font-size:10.5pt">致癌、致畸、致出生缺陷；</span>
        </p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:'Times New Roman'; font-size:10.5pt">4</span><span
                style="font-family:宋体; font-size:10.5pt">）</span><span
                style="font-family:宋体; font-size:10.5pt">导致显著的</span><span
                style="font-family:宋体; font-size:10.5pt">或者</span><span
                style="font-family:宋体; font-size:10.5pt">永久的人体伤残</span><span
                style="font-family:宋体; font-size:10.5pt">或者</span><span
                style="font-family:宋体; font-size:10.5pt">器官功能的损伤；</span>
        </p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:'Times New Roman'; font-size:10.5pt">5</span><span
                style="font-family:宋体; font-size:10.5pt">）</span><span
                style="font-family:宋体; font-size:10.5pt">导致住院</span><span
                style="font-family:宋体; font-size:10.5pt">或者</span><span
                style="font-family:宋体; font-size:10.5pt">住院时间延长</span><span
                style="font-family:宋体; font-size:10.5pt">；</span></p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:'Times New Roman'; font-size:10.5pt">6</span><span
                style="font-family:宋体; font-size:10.5pt">）</span><span
                style="font-family:宋体; font-size:10.5pt">导致其他重要医学事件，</span><span
                style="font-family:宋体; font-size:10.5pt">如不进行治疗可能出现</span><span
                style="font-family:宋体; font-size:10.5pt">上述所列情况的</span><span
                style="font-family:宋体; font-size:10.5pt">。</span></p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:'Times New Roman'; font-size:10.5pt">&#xa0;</span></p>
        <p style="font-size:14pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                style="font-family:宋体; font-size:14pt; font-weight:bold">新的药品不良反应:</span>
            <span style="font-family:宋体; font-size:10.5pt">是指药品说明书中未载明的不良反应。说明书中已有描述，但不良反应发生的性质、程度、后果或者频率与说明书描述不一致或者更严重的，按照新的药品不良反应处理。</span>
        </p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                style="font-family:'Times New Roman'; font-size:10.5pt">&#xa0;</span></p>
        <p style="font-size:14pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                style="font-family:宋体; font-size:14pt; font-weight:bold">报告时限</span></p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:宋体; font-size:10.5pt">新的、严重的药品不良反应应于发现或者获知之日起15日内报告，其中死亡病例须立即报告，其他药品不良反应 30日内报告。有随访信息的，应当及时报告。</span>
        </p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:'Times New Roman'; font-size:10.5pt">&#xa0;</span></p>
        <p style="font-size:14pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                style="font-family:宋体; font-size:14pt; font-weight:bold">其他说明</span></p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:宋体; font-size:10.5pt">怀疑药品：是指患者使用的怀疑与不良反应发生有关的药品。</span>
        </p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:宋体; font-size:10.5pt">并用药品：指发生此药品不良反应时患者除怀疑药品外的其他用药情况，包括患者自行购买的药品或中草药等。</span>
        </p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:宋体; font-size:10.5pt">用法用量：包括每次用药剂量、给药途径、每日给药次数，例如，5mg，口服，每日2次。</span>
        </p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:'Times New Roman'; font-size:10.5pt">&#xa0;</span></p>
        <p style="font-size:14pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; widows:0"><span
                style="font-family:宋体; font-size:14pt; font-weight:bold">报告的处理</span></p>
        <p style="font-size:10.5pt; line-height:150%; margin:0pt; orphans:0; text-align:justify; text-indent:21pt; widows:0">
            <span style="font-family:宋体; font-size:10.5pt">所有的报告将会录入数据库，专业人员会分析药品和不良反应/事件之间的关系。根据药品风险的普遍性或者严重程度，决定是否需要采取相关措施，如在药品说明书中加入警示信息，更新药品如何安全使用的信息等。在极少数情况下，当认为药品的风险大于效益时，药品也会撤市。</span>
        </p>
    </div>
</div>
</body>
</html>
