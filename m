Return-Path: <linux-i2c+bounces-9689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E82A4C0B0
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 13:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F0993AC107
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 12:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5480F211A38;
	Mon,  3 Mar 2025 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V48H4VvG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A553211481;
	Mon,  3 Mar 2025 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005854; cv=none; b=lUFjwV6/xAUdqB9gjgvLLS0YyN6gPj0T5CZy8zJtK8zWzZBSiEbTMfEzwCZB+uiKD5UEDqULOFYKgyDyWyo1y6nwrrN3qvmdqZTMfgNzJSqJ/ARtCld4BC66S7ofn9ofKQwyQx+AYWIANhLatbNXcPZCsmU0vOTKdI8PdzuWldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005854; c=relaxed/simple;
	bh=EK8afcXFiIUIuDpZu6btW6pDuR+DeVFJfVuAAQVn8Ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LeCbl922ji0xX1fCCqIpmzhrzU5T6CVrRw1U7FeonJvBPFZ5MeUgHANr3fZMWDWbmxerr1AEjIf6gFyBw5qvAdB2lT01IAyPUlFvWeLdhbpc8XcRVtX5oeuyANrGUqKfdgkIaBSlRd9dbIEkj6n33NFvTvNPCXyijTTMUBBA4cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V48H4VvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AWgcG020559;
	Mon, 3 Mar 2025 12:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ps8c+s7wlHf
	8VRJAld8lQkcMmD3pAI+WVvUT8ojSVhQ=; b=V48H4VvGKaDwfams4TVMpmcfiN7
	WDQZQFoWK0FabFi7riq9c9QGEAthdLgYDDsBtm0GDvQFZZ9HqL0/FU9z1Xm6oC3i
	9ra9mmOrOWNEzdJaep41yCALYORlE87MDppZXLhar46ChiLm3wsYkKN+z95UyZLo
	YAvXVZKlSPCdmY4oOdV5J59rWPeDC7rclVY434cH0Sf3I3X2eU7N/HTjD8KsbjTy
	AqM9I30ejyFk8Hil1pbFUe0TzZr6CpGbPd0cTHnMp8EnuUWEBPAR1gGXWCyVOEvv
	oWrhbbZFyC1GXn1K4FnRswLAyoY8GH8Z+oWs3D2eD0XIfy+0mzHWtMs5AmQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453uh74n17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 523ChqLC015069;
	Mon, 3 Mar 2025 12:44:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 453uakx56r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 523Ci4In015238;
	Mon, 3 Mar 2025 12:44:04 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 523Ci4Et015232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:04 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 7E76E53B; Mon,  3 Mar 2025 18:14:03 +0530 (+0530)
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
Subject: [PATCH v3 3/9] dt-bindings: i2c: qcom,i2c-geni: document qcom,gsi-dma-allowed
Date: Mon,  3 Mar 2025 18:13:43 +0530
Message-Id: <20250303124349.3474185-4-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
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
X-Proofpoint-GUID: p7sa65pgeGHucDqPyKxifddePVcKveBW
X-Proofpoint-ORIG-GUID: p7sa65pgeGHucDqPyKxifddePVcKveBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030098

Data transfer mode is fixed by TrustZone (TZ), which currently restricts
developers from modifying the transfer mode from the APPS side.

Document the 'qcom,gsi-dma-allowed' property to select the data transfer
mode to GPI DMA (Generic Packet Interface). If not set, FIFO mode
(PIO/CPU DMA) will be selected by default.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
v2 -> v3:

- Drop the 'qcom,xfer-mode' property and add the 'qcom,gsi-dma-allowed' property.
- Add a reference for the QUP peripheral shared YAML.
- Update commit log.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-3-quic_vdadhani@quicinc.com/

v1 -> v2:

- Drop 'qcom,load-firmware' property and add 'firmware-name' property in
  qup common driver.
- Update commit log.

v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-2-quic_vdadhani@quicinc.com/
---
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..8c2675c65455 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -60,6 +60,8 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,gsi-dma-allowed: true
+
   reg:
     maxItems: 1
 
@@ -75,6 +77,7 @@ required:
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
+  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
   - if:
       properties:
         compatible:
-- 
2.34.1


