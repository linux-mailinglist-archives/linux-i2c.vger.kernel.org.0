Return-Path: <linux-i2c+bounces-8269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDC59DE8C5
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 15:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EB9B1642ED
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 14:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C22D1448C7;
	Fri, 29 Nov 2024 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UQJ9RKfs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A65588F;
	Fri, 29 Nov 2024 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732891463; cv=none; b=DPcX1qfm+BUgXb4Asqz0XCVbgo6mQCNQP+SxmnvLlrnl9LgOxMxoHbvtbawioY8R+cmH5E4Wv5yV7+meo8zyH64ZTEM2UY4wlA9BV9pCkTXmzgXaDam12DihbI+0gSIjayK2mTyytB99Ohr3/CdIXcr8/rInnu3gRGagrHxY/jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732891463; c=relaxed/simple;
	bh=FP7yRmJQPQZCBbrSZlB6BKqK70qzi8+9UQ8bDdyVAFE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=saisL3eemvrBxlR38e3J4ZTFeUu9f4SjmdelDaeVM3s/d+SNJSHDiHCPeg6qubhgt6IViviA7V08SbJ1a3Nqe9FkvGPcOcfpfbJy8MoOAV25AcaHtD2Ur5PtmCJpC/2b5ltutztLtKXPxBh1qLFUf9vAoBCZgcgp4NZEsWcWfac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UQJ9RKfs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATCXaso025126;
	Fri, 29 Nov 2024 14:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cnpt82TZsA8
	oh2kg81MEcffUx1MlvNet8dsLOFHB3eY=; b=UQJ9RKfsDkwT2fD2pjl5NbyofNk
	t4MV8VpHLriKOPsohMUkhuO5w2GbbW3JnjKG2G7PAvVBaZxyouapi4VYr8emwt9B
	NUYRVAasMla6znMUs7pOHFpfGApMSkdJBFW2bxjHBmfbfK16oye88+v3yWwo+haR
	EJCgTXVoWdL19jiNoO9r8Ee/DtekdB5G81ZgntloQrKX1yh4t6rEo2V+AdbaqoYj
	lmBYWIM0rReCb2oxXFieMN0Jcn8SWKvvT014XZTPhugb0d4B4Cc6ZbyUfeCDuFFv
	9WmEEpcbMeb36vwMQNsj6tUTEnUREr4ecgbrbJk3lNZPGtR3vSSOVC378og==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvnumv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:44:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATEiB2j028753;
	Fri, 29 Nov 2024 14:44:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 43384m8h8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:44:10 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4ATEi3GV028668;
	Fri, 29 Nov 2024 14:44:10 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ATEiA0H028745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:44:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id A4170240E9; Fri, 29 Nov 2024 20:14:09 +0530 (+0530)
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
Subject: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
Date: Fri, 29 Nov 2024 20:13:54 +0530
Message-Id: <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: hxdXg0jVhNM7qigSCcz_KfmVSaLUVO_S
X-Proofpoint-ORIG-GUID: hxdXg0jVhNM7qigSCcz_KfmVSaLUVO_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290119

Adds qcom,shared-se flag usage. Use this flag when I2C serial controller
needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.

SE(Serial Engine HW controller acting as protocol master controller) is an
I2C controller. Basically a programmable SERDES(serializer/deserializer)
coupled with data DMA entity, capable in handling a bus protocol, and data
moves to/from system memory.

Two clients from different processors can share an I2C controller for same
slave device OR their owned slave devices. Assume I2C Slave EEPROM device
connected with I2C controller. Each client from ADSP SS and APPS Linux SS
can perform i2c transactions.

Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..88682a333399 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -60,6 +60,14 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,shared-se:
+    description: True if I2C controller is shared between two or more system processors.
+        SE(Serial Engine HW controller working as protocol master controller) is an
+        I2C controller. Basically, a programmable SERDES(serializer/deserializer)
+        coupled with data DMA entity, capable in handling a bus protocol, and data
+        moves to/from system memory.
+    type: boolean
+
   reg:
     maxItems: 1
 
-- 
2.25.1


