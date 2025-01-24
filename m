Return-Path: <linux-i2c+bounces-9166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E73DA1B406
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 11:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 757D916227A
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 10:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED2D21B19F;
	Fri, 24 Jan 2025 10:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cvvucMuq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0D1D14E2;
	Fri, 24 Jan 2025 10:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716011; cv=none; b=WVkKbirGGgjIb0svNovRpBp+AWjagLlh+Q+dS3x/kLrwoZCkVD/A7WBCC3EGbcF57Odd9U2RTfoD0oy4703ElzD5W+6/oIih6YDGUjEzUR/lvIAZFYkQQzduidZaz0aGaTCR3kwpsFCbxJvEatsX+xP+Ip9wloUegLr5iZiPjSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716011; c=relaxed/simple;
	bh=BLhdSSEk1S61Tb0Mx2ZTnvcc4+9CDKBV0779gxniSx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=srrEMDjbanIGtzi6UHXh/ulze1lWR+r5PaZuQL1YzLsQCMK9l9hDsvuCQiU/CecPxmWB8dpkySqe5iJZgvHrHQvNP4MmbJxICTVOol0nR5BJNn+KfjgBegx/g1U7nl9y5UY0IRxkaREuYWWjWL//xecDPBYqrqUMTN6ai424VVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cvvucMuq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAKRV6018287;
	Fri, 24 Jan 2025 10:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fag0U275aZa
	rw6i6SbCB2rOyE3aFl+6A6ASbleH4LsQ=; b=cvvucMuqRNWjX36qaYmS7xikNQJ
	wIVZHYV/aFcWKyWHkZBfBQ+8OmrmivosEgcoYzsdZLt/T1lJXYSreFsNAyhyYqHw
	0peUrB8FMS4VWcA6UPadjHJaEGCRtdwSSDVYx3GVDD3kvM5vZwmhj8wm0krg9NzL
	HDvwaiOmDYZhJATdNrkVVrYJvtwdLBijNteNMVuk5O6Mj9XKdDUAPKFszTrPvZKe
	C3CeMMzH3JNHNEot+0/PHfnQ/YPZKRddAhYRZPX8L+4cZd01WC86JrQSZJPYkq/g
	8LaL/hBypXHGk0Tcj6Mt6hHjMWtiLixe9ER3tsqJI0hwsjZwAGJICeM1ORg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c91ag3kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50OArLY4016291;
	Fri, 24 Jan 2025 10:53:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485cm9h0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:21 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50OArLRj016285;
	Fri, 24 Jan 2025 10:53:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 50OArKkF016284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:21 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 6C2F655C; Fri, 24 Jan 2025 16:23:20 +0530 (+0530)
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
Subject: [PATCH v2 2/8] dt-bindings: i2c: qcom,i2c-geni: Add support for selecting data transfer mode
Date: Fri, 24 Jan 2025 16:23:03 +0530
Message-Id: <20250124105309.295769-3-quic_vdadhani@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Z9hZOKDbuLarUJtzNLSm3tK5N_7xPbvO
X-Proofpoint-GUID: Z9hZOKDbuLarUJtzNLSm3tK5N_7xPbvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240079

Data transfer mode is fixed by TrustZone (TZ), which currently restricts
developers from modifying the transfer mode from the APPS side.

Document the 'qcom,xfer-mode' properties to select the data transfer mode,
either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).

I2C controller can operate in one of two modes based on the
'qcom,xfer-mode' property, and the firmware is loaded accordingly.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---

v1 -> v2:

- Drop 'qcom,load-firmware' property and add 'firmware-name' property in
  qup common driver.
- Update commit log.

v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-2-quic_vdadhani@quicinc.com/
---
---
 .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..68e4bf0c84d1 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -66,6 +66,12 @@ properties:
   required-opps:
     maxItems: 1
 
+  qcom,xfer-mode:
+    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
+      The default mode is FIFO.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 3]
+
 required:
   - compatible
   - interrupts
@@ -142,5 +148,6 @@ examples:
         interconnect-names = "qup-core", "qup-config", "qup-memory";
         power-domains = <&rpmhpd SC7180_CX>;
         required-opps = <&rpmhpd_opp_low_svs>;
+        qcom,xfer-mode = <1>;
     };
 ...
-- 
2.34.1


