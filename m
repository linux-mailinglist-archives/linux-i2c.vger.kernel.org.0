Return-Path: <linux-i2c+bounces-9167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF164A1B40E
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 11:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF82D3A9821
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 10:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DED21C171;
	Fri, 24 Jan 2025 10:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d+reKn/G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3ED21A95D;
	Fri, 24 Jan 2025 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716012; cv=none; b=Ds6xJciGfjlOSaVMEtSHJx2sdVZosO6WRpqgOCuQl/KdZTiJPJ29+1etsSooljC0TQqZoWf1vRhmGCEzk9dZwYOpuysoaSmFrVLOdp694sWBCq3nZW0xI7CSfdhegKYuahSkAb8gO0fgkNKIPmrQrQJnKF/c2i/Yp8cwYomaq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716012; c=relaxed/simple;
	bh=I+yBw+DlvvnKR4kLVSLP4pwhHhikkHkzEAA8mPyFAaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qwqETY9ZhDHXcYRy7n4UVaSrDjkUlrV7H8APBtWEf3tkz1GqeG1Y11gozQfb90oMWTIf7p8Q5VyOZylMeolFD68bra7jPoej1PkZLbutoEVce/ZqZuEHSmTEBg1m+lsb2KTRJmwH+ZsEZK9ghYGc+tTq/9NXsgeCboYF57JbX8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d+reKn/G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O3ImFu027174;
	Fri, 24 Jan 2025 10:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r7p01gwF0W4
	hF7X0lGgyCwNEZh2S1ObQcS6alAV1DIY=; b=d+reKn/GN+VlrVzNUyUdex2Q3+X
	t8n1kYaQg5dNAC9SjU2ImQIYMiepdyde0dgLLjBPq8gHchboMxvOOiQ/ijPnTS08
	NJxxRxcnoKE56jdErzSOPKfqogAvegshc+WBtUp456kti+B2GCPZ7ZlLlK2o9Wqu
	rApmf9p4lFjssztsybN9QaCNyHJwHYKyKZ83SnFPn0UXh8vk+zkQcZ+C1fMHwhxV
	zqJeaNL9z62VJLEWiYgqNjC9ruM80o6wce05eN0UGw3oy1EMCQOzfvduSVB1rUiF
	CVMr4NTvy3Fb8quaeI4oXPaAMAT7rDgrXuhPzcaflY11z956SYefkaiuIyg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c2uj937d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:26 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50OArKFc016274;
	Fri, 24 Jan 2025 10:53:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485cm9h0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:23 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50OArN3M016309;
	Fri, 24 Jan 2025 10:53:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 50OArMiu016308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:23 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 4783D55C; Fri, 24 Jan 2025 16:23:22 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v2 4/8] dt-bindings: serial: Add support for selecting data transfer mode
Date: Fri, 24 Jan 2025 16:23:05 +0530
Message-Id: <20250124105309.295769-5-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 4hAwMS46lxGbZ5Yh8_Hqmgk7biIS9RPK
X-Proofpoint-GUID: 4hAwMS46lxGbZ5Yh8_Hqmgk7biIS9RPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240079

Data transfer mode is fixed by TrustZone (TZ), which currently restricts
developers from modifying the transfer mode from the APPS side.

Document the 'qcom,xfer-mode' properties to select the data transfer mode,
either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).

UART controller can operate in one of two modes based on the
'qcom,xfer-mode' property, and the firmware is loaded accordingly.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---

v1 -> v2:

- Drop 'qcom,load-firmware' property and add 'firmware-name' property in
  qup common driver.
- Update commit log.

v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-4-quic_vdadhani@quicinc.com/
---
---
 .../devicetree/bindings/serial/qcom,serial-geni-qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
index dd33794b3534..383773b32e47 100644
--- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
@@ -56,6 +56,13 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,xfer-mode:
+    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
+      The default mode is FIFO.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 3]
+
+
 required:
   - compatible
   - clocks
@@ -82,5 +89,6 @@ examples:
         interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
                         <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
         interconnect-names = "qup-core", "qup-config";
+        qcom,xfer-mode = <1>;
     };
 ...
-- 
2.34.1


