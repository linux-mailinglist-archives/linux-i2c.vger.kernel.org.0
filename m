Return-Path: <linux-i2c+bounces-7967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C87FE9C788A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C33CB32544
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E745166F06;
	Wed, 13 Nov 2024 16:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nqequ2QT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A26E15ADA4;
	Wed, 13 Nov 2024 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514485; cv=none; b=Wb+iWcVtsIiU9x8J84ufbnYZ/yDzp/4jciWe3IcWUaKA2d8yTzPe08x7isabU6MP8R/mqwp7wx0oAR/jfs0PhjE26oYlPe7u2TJcaY3RkB9qpFQA9JuGojzfxIXT0PDFyu317TLuy3Cdn1qRqrFaBhmRZohAASPAD+YvMLXaI2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514485; c=relaxed/simple;
	bh=i3Gvx4oIrN9JtPLl4Np+5HFAMLxiVZ3mZ7by2oLgv48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SCBrOWxjEn917t7KiWG3zW8+Xu1d+vXZNodMzCvDI3XcoMLJ09uKKALUXQo00VQsUfUkpQFBxyJfxwVrQgIv8DG3odkI3hnaM09sE7LPTBc97YGsHR1NNW6MASG7k9iedkdC+OknKw1DQzz31qLHbWhfvSs/WKozStgi1ZqARbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nqequ2QT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADCpfpl031445;
	Wed, 13 Nov 2024 16:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pE4jUlEFe8I
	KNgwAP6nXKzAS8DoRqP6c9TBbCUZuaP4=; b=Nqequ2QT8At4TxRTCTo/dWB7M0q
	CAUn7P5xbe78ce4BdEpShrp4HY4NVgx1AI5mtj5ZCcNnFvvp7TZ8mmqcqjfAXFjp
	9JJ52vbeoEj7XhTxLMEXLbpQdaYAWE1fcL2Hp/L/f3+hVjjhsTcC6U1hQJ56t5O7
	lIuKZUKORhzw1Ougyrgg9OheWPhXaJ9OXT/IzTwqoNsKnTc/lKlYRl4oZB2f3pSM
	Vqp87yx2lBXnvvV/CrDPZDjrwFyEpJUCNxMAFS+ySAXybUBApwO4Wz0Pfwmj4pbG
	fdyMyiREXtCcuMtZ/EiKtN4IBvjMvXih34f5Hmn4xPqwLWY5huxy1SF+jbA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vkvr9x5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADGEVuF032551;
	Wed, 13 Nov 2024 16:14:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tmhvff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:31 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4ADGEVWq032545;
	Wed, 13 Nov 2024 16:14:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ADGEUQn032542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:31 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 1FA9C24055; Wed, 13 Nov 2024 21:44:30 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v4 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
Date: Wed, 13 Nov 2024 21:44:10 +0530
Message-Id: <20241113161413.3821858-2-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: vvMW508obI3bKraa-LIz-cveIYLBB5u0
X-Proofpoint-GUID: vvMW508obI3bKraa-LIz-cveIYLBB5u0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130135

Adds qcom,is-shared flag usage. Use this flag when I2C serial controller
needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.

Two clients from different processors can share an I2C controller for same
slave device OR their owned slave devices. Assume I2C Slave EEPROM device
connected with I2C controller. Each client from ADSP SS and APPS Linux SS
can perform i2c transactions.

Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..fe36938712f7 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -60,6 +60,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,shared-se:
+    description: True if I2C controller is shared between two or more system processors.
+    type: boolean
+
   reg:
     maxItems: 1
 
-- 
2.25.1


