Return-Path: <linux-i2c+bounces-8325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC379E3DA3
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 16:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AA3E280BDA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 15:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985EA20C499;
	Wed,  4 Dec 2024 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nMlPrHI3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C758420B21E;
	Wed,  4 Dec 2024 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324623; cv=none; b=DLVDeEmBq7mDuFqVr7PNsUmU1KPhS95AAIZIu0TDGF8WiRj4/XjGyxfXBhJQ5YFBRiX8I0QLpfkqNR365nQwEmilkAzs3+cLke+K07/IhdoFyBNe5TDXITAQNOf1eJKBxDSxIy2jA7+X1kAX8WG2P7u/MzlbsLJM8XLVc2Tuwr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324623; c=relaxed/simple;
	bh=ukDd2ttVlpVl+h2y37dUIac4YRcNHjs8fx1+XjW+2AY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tTl39GgolzztYAbkIjYJtfB8D0RMjIL7jA3Bpn5BnC4Sst9mFgAT/tQLZnPleEayZ+TzpN50JnMWMxs+pZxiqKYx+iEu0LOr/icP9OnYQ3n2MWRQwNptDjpV8HZ3kuIHK3JACd/toL/QxNOAzV8y3e1TU/393CXHdnHh8SmWRTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nMlPrHI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4EFal1021235;
	Wed, 4 Dec 2024 15:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D4EduatCrUo
	Gq9qnX1UQU1h+37w44nr6GSYnnfMkD/k=; b=nMlPrHI3Ns7NkqzJfekZd15bQ4s
	mzOlZA93WUEHtKkB2fTBNF1jfmklAbfTqHoY5H4jYGJS2VrMGQ9L6409nc9PwBk2
	ehYv0nnVynB5kRnIX9uHEKtJ14ry2mPKjTOU3NuVvM/ZlZqDQr2QCzK2AS17k4aJ
	6mX8tbpFv7hxsTAjYldoRNAomzvMUE2vh9WhuHaZ7c6UmPXJDgXtHfnmNugqNd8X
	hw5MhfHZsEgzmCMV857JaRLnR3+ONtI/y6brtODGsfNylcrdUVLOINhl127rM9Sn
	dWoH9wtK6rAPwrjbDL9fpl31+N/Ez1hOUFzsdxqgeuIWhxGXjWkAYKVPYmw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3exbh54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4F3WRG025795;
	Wed, 4 Dec 2024 15:03:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 437uskx4u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B4F3Wrt025789;
	Wed, 4 Dec 2024 15:03:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4B4F3W53025782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:32 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id CFEB1503; Wed,  4 Dec 2024 20:33:31 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: =quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 3/7] dt-bindings: serial: Document DT properties for QUP firmware loading
Date: Wed,  4 Dec 2024 20:33:22 +0530
Message-Id: <20241204150326.1470749-4-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
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
X-Proofpoint-ORIG-GUID: KcJf1QN-MeTbp1BVdQLRxjJotUoNPdfi
X-Proofpoint-GUID: KcJf1QN-MeTbp1BVdQLRxjJotUoNPdfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040115

Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
support SE(Serial Engine) firmware loading from the protocol driver and to
select the data transfer mode, either GPI DMA (Generic Packet Interface)
or non-GPI mode (PIO/CPU DMA).

UART controller can operate in one of two modes based on the
'qcom,xfer-mode' property, and the firmware is loaded accordingly.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 .../bindings/serial/qcom,serial-geni-qcom.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
index dd33794b3534..21a5b0dafbe0 100644
--- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
@@ -56,6 +56,16 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,load-firmware:
+    type: boolean
+    description: Optional property to load SE (serial engine) Firmware from protocol driver.
+
+  qcom,xfer-mode:
+    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA mode respectively.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+
+
 required:
   - compatible
   - clocks
@@ -82,5 +92,7 @@ examples:
         interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
                         <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
         interconnect-names = "qup-core", "qup-config";
+        qcom,load-firmware;
+        qcom,xfer-mode = <1>;
     };
 ...
-- 
2.34.1


