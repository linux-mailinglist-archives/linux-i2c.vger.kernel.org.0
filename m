Return-Path: <linux-i2c+bounces-6337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4B96FBF5
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 21:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 126981F23FFF
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 19:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AB51D45EA;
	Fri,  6 Sep 2024 19:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="naEK9Uob"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD34155C98;
	Fri,  6 Sep 2024 19:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725650096; cv=none; b=iXcHvvJ6p373qpVxXXiB/29aSpDZf/yLuiIpMrJa8DC8XShmOjn60q1DdvVnByXc7Q7KnFOAwcUOJOLzZLqiExnMWjjTjGdEqhHi7oj7qtIeVRFT8+EAO9pI0jIPErPr2QlRPQmpGUguup+r2kcZIsaRkNa7EJwGQNXaXPKx+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725650096; c=relaxed/simple;
	bh=UQIoMDZSAZ8ZkFMJMH0rX7tysIg0uHF1yGQghRVrnlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FbX2YIUpucLFzuLr7cmtrBc0DjhOETZJ/BQdDCI3Gqol59eNUWuVxZ616RwJWPbiJFozVEprDkPwTbsl2sjAmVVMYGL+Eb1ri6SQAYUz0weLM7XWI6A6Wogi7QCDX9SUB8p2rpV0AYpGl6nsr+5KylJxgW8ECOLg4deAUIj3NOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=naEK9Uob; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48694QXs019645;
	Fri, 6 Sep 2024 19:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WezLRs6mwYp
	Bkc/lG8d02YW5Vzlf7wmsqYtCZfTAmfE=; b=naEK9UobFmZee8BpGmBpvuW6oOY
	k7UMb88tkwlBmA2qprHKAsYr6MvtiXw51T4Vf8mDZ8CNADAvFtukYaTi7mu4qloF
	RXWrtT6J0wIEhkJryDlxf4Tg5EyCdlmy6I9k8wbdxGQUAxFc89OcDr/a/87f16BK
	iiRaIhAGBsHy07gutHrX2AfrjU066Qnw9FJX+S40Xg3IlmT4Esto5bxLlqZy8Gan
	/A8RYF21iJSEjhrDkuuXknBGY2gLVwVupiS7GeG87BINcz27O1/3+v5vkgQfLwsL
	WlnOXlREvEtmIxcCrhgT/4oQe0nvfgfTD1hc51Jyzr7FtNdhbWSHntViWnQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu37w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 486JEhZo013069;
	Fri, 6 Sep 2024 19:14:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41bv8mxy1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 486JEgbr013060;
	Fri, 6 Sep 2024 19:14:42 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 486JEgai013059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:42 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id AA3DE24186; Sat,  7 Sep 2024 00:44:41 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
Date: Sat,  7 Sep 2024 00:44:35 +0530
Message-Id: <20240906191438.4104329-2-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sXxg6jZ62EotY6s4uyvpkLZKfr5lCXrx
X-Proofpoint-GUID: sXxg6jZ62EotY6s4uyvpkLZKfr5lCXrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_04,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060141

Adds qcom,shared-se flag usage. Use this when particular I2C serial
controller needs to be shared between two subsystems.

SE = Serial Engine, meant for I2C controller here.
TRE = Transfer Ring Element, refers to Queued Descriptor.

Example :
Two clients from different SS can share an I2C SE for same slave device
OR their owned slave devices.
Assume I2C Slave EEPROM device connected with I2C controller.
Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..ae423127f736 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -60,6 +60,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,shared-se:
+    description: True if I2C needs to be shared between two or more subsystems.
+    type: boolean
+
   reg:
     maxItems: 1
 
-- 
2.25.1


