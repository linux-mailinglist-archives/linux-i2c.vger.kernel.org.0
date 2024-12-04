Return-Path: <linux-i2c+bounces-8323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE49E3D9C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 16:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07865280EEA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 15:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4481420C028;
	Wed,  4 Dec 2024 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ocJEQV/V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715AF20B1EC;
	Wed,  4 Dec 2024 15:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324622; cv=none; b=OGkem5l65KGMoTVsLqtJQaQmhI9bwp6jc3ZPITalVeWVlcJSDZh76uXkYB9Qp24Se/EDffui+J0gvjlBLhwMwvbb4qlY5kxl1sBT8H2eKLtc+Fmud5rtvIb+U7S/o9jxfpZpTTjVOi03AyRC19n/F2/1JPbh4T/yWrG12XE7JLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324622; c=relaxed/simple;
	bh=NW6KWXq1TAraQa2HgYaq+YjmXKZisi0dq71Jbl0TBrM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QMfit+9AM8emPtKM88HJQpgpNYY5DhRQIY+W5iJNc1YAPJETpMHjJQbTbbXcWY/8twGuCQ5zxgVW2l9b4S87vKmEaFo6iu9Mc1FVPCWltbWhMiPHGVWlRelzrRqxmBCnp9IcmTbgekFxEXvOzkeoysd0Brzc+h7foD9AizlQxEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ocJEQV/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Chl50027138;
	Wed, 4 Dec 2024 15:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qt0dYNFDMZX
	Y4hvrRnF9l6WWhkVFYK3uQ+2e1ZZi1A0=; b=ocJEQV/Vo2FWboAlxhwnwJw/6dw
	I+EP35Bhc+h2RKjpRvCNWW5lsZvsQSp+OtGaFhjZ41sMRGRsvIsRkDdtIhmsWoEN
	UQ4vRq3u0j+3ZM/Gy1G5rsQLWbw/xpodizg+L/2yS+ZzdajwZkQo25OmSF5kjBGG
	mxB6XTk8BCLm+FjwtAa34tbRui36LrFi3+frPycFapBLDNogJTIw1S2iPPFklwrz
	wLdhV+mX2ELkBQYXUWbqQUHqwdt+IKBFh5mx3VFbXglAImVEBOysi+FPiOQXP95X
	edTr9paMhhdI6wHjicp0qLUyFZLO11Bvg0uZ2jnGJLbuJ8HASx3QItA4mlg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a1g5ksbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4F3VIk025768;
	Wed, 4 Dec 2024 15:03:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 437uskx4tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:31 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B4F3VnE025762;
	Wed, 4 Dec 2024 15:03:31 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4B4F3Vk6025753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:31 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id B3679503; Wed,  4 Dec 2024 20:33:30 +0530 (+0530)
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
Subject: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT properties for QUP firmware loading
Date: Wed,  4 Dec 2024 20:33:20 +0530
Message-Id: <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
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
X-Proofpoint-GUID: m1NrKg0VaxRUraW892HVKkNi3Mx2B5vq
X-Proofpoint-ORIG-GUID: m1NrKg0VaxRUraW892HVKkNi3Mx2B5vq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040115

Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
support SE(Serial Engine) firmware loading from the protocol driver and to
select the data transfer mode, either GPI DMA (Generic Packet Interface)
or non-GPI mode (PIO/CPU DMA).

I2C controller can operate in one of two modes based on the
'qcom,xfer-mode' property, and the firmware is loaded accordingly.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..a26f34fce1bb 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -66,6 +66,15 @@ properties:
   required-opps:
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
 required:
   - compatible
   - interrupts
@@ -142,5 +151,7 @@ examples:
         interconnect-names = "qup-core", "qup-config", "qup-memory";
         power-domains = <&rpmhpd SC7180_CX>;
         required-opps = <&rpmhpd_opp_low_svs>;
+        qcom,load-firmware;
+        qcom,xfer-mode = <1>;
     };
 ...
-- 
2.34.1


