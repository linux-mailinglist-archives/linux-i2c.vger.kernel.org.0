Return-Path: <linux-i2c+bounces-7043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBDF987E64
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 08:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91A31F2360D
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 06:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913F5176AA1;
	Fri, 27 Sep 2024 06:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NIwbHujM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC652C9A;
	Fri, 27 Sep 2024 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727418694; cv=none; b=DAc/A5Ot/Ieghb4cAPEpIUzdxDiKwzuYFZYs1WRc+0p6LUAfJBgb8VOcqp+VJEnVe/OcNMcsy5QhOzKmg4SV36tLakLiAvhxjkWcFWvFKCWNZl2jhqiAKbPuJt/xjND+2Rh4vKVxtcMGR0ZFtIfMEFy5HAi5ZFlmXKCIxg4t09I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727418694; c=relaxed/simple;
	bh=rUqfjJCAfy1LrtgWHiQ+oEM5KcGDH97xXKrdNM0YKNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DRgW6uSa59lmaj6xLr6t5u0vU8KM9+M+KkBEIioj2Z8uVP+/FEzUoYnbO2A2n1MWWxZc1LQ6kg591+pDtT/u2mu3+KNhP7Xd72EUWQwfx0Y7/IkgQK2WC5E+p5dc6yxpzltkS/8eXk+W49vy41wiIZYh3ELFcmlCrPx55NkvLF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NIwbHujM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48QG9aOX027971;
	Fri, 27 Sep 2024 06:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HBxhraJN5WF
	DpCdwp/Cci0BXLl9DvlJdB7mbPSiBMCM=; b=NIwbHujM+ux+TeWmGZrAQiVFxDT
	WA/nw1heFlo626MsNi9P7G2qJASwsdkq1lTW5i/LV3OT/G5iq1F6GwkPUUomvRZO
	MXLmhWdPu5nFdQ3QXJpS7wDxMkgfh4atWrwFsNlrkBVx8zt95q8hiU6yFBw+vhpW
	J/ivuR8Y6penHNDcygBcV/u2CgZys7aiEV+/+hO3Ol/NVI/LaaPn56V8v8bk6P5x
	nO4M3oDxHCPaUn3HG4zKRD5VmrAQ1vm5kw1dpDDV8x4m61f931lAlk8QNjIq55Av
	9AOFRXkDFYpPuTmtBdTtDCeq3PpGGjqx2K+VoiuIaRsZRrap8N7mvFi7kgg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skuf219v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6VJ4O001845;
	Fri, 27 Sep 2024 06:31:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41sq7mnbn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:19 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48R6VJGD001832;
	Fri, 27 Sep 2024 06:31:19 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48R6VIeA001830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:19 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 491322408B; Fri, 27 Sep 2024 12:01:18 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v3 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
Date: Fri, 27 Sep 2024 12:01:05 +0530
Message-Id: <20240927063108.2773304-2-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: s5bbIV4iZjwRAE0a7PneTwOXCcIfgVAo
X-Proofpoint-ORIG-GUID: s5bbIV4iZjwRAE0a7PneTwOXCcIfgVAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270043

Adds qcom,shared-se flag usage. Use this when particular I2C serial
controller needs to be shared between two subsystems.

SE = Serial Engine, meant for I2C controller here.
TRE = Transfer Ring Element, refers to Queued Descriptor.
SS = Subsystems (APPS processor, Modem, TZ, ADSP etc).

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
index 9f66a3bb1f80..3b9b20a0edff 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -60,6 +60,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,shared-se:
+    description: True if I2C needs to be shared between two or more subsystems(SS).
+    type: boolean
+
   reg:
     maxItems: 1
 
-- 
2.25.1


