Return-Path: <linux-i2c+bounces-9163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ECAA1B3F6
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 11:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E021882028
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 10:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41222219E86;
	Fri, 24 Jan 2025 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E8QLaiIG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6823B0;
	Fri, 24 Jan 2025 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716010; cv=none; b=mjgQIM4ORirOqE43ep9VqSsaEqgeut/fyIHjT9TPaL12vxMocCVU7BFYOqMt1mSdIX7VG9wRdMMw/lEHTSeIXXCGlpDp4sq442EWDmj5hf5KzIvXUovPz982Vyty6QKvenPPwY9b9Gm6O+EoeQwR4tKmkqBWbWcTK170BffSrtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716010; c=relaxed/simple;
	bh=fwRs0M6wQrVv6R5E7ixYp1uSf49BU6RtPbmGg09b7pY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p37uL+CI58qe3JDBSu+hYsSY7jhfYicuVkWYnHkiHu/ViR4cTS2PglS/psKMq3tyrBslJx1pI4Xosn2l9YHWEpf/gxAL+RzaKzE8z2tWfe0lvhjGQIDXynt6Lk3Wndaif7188UW5P+6PaaLBhiVLAlzwpFDQxlBTuUozCTCjC18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E8QLaiIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAKRLL018282;
	Fri, 24 Jan 2025 10:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/WZKAzPK5yS
	mLS7unqhWA28vUAftnm6t0QD7Z/i/fSU=; b=E8QLaiIGzbcwe+uZ2ZkDtDPMKQp
	H7CW5LNOxjjatrXe3IrT/9VAR+vDwq62Ct7pifyEJKn9ZMVFC+LmVhTX4gjV/yLQ
	Jln5pFPyfL5kwAastl2GlvWSphZq4+njfdmUCdntmrfxPuCJ38f/+R5OeVmF6eJ4
	EAalEvLfjPyAouFh4/OnkyToaW2TLmPoBtYiQS4eWcSTlqk53zyQUy0CHdxpfQ38
	PtBfTQkB4PxNLl5Z1Q8YUMVpN60jtMiybZP4C5j+i4MFJbrJH+8/1st1/Mqpfz+i
	7RW/N79zJK0sA0gaEDWqhriAsNFMGlmlL1dfqx7n8MQBcXtIt8pn9/+xEag==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c91ag3ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50OArKOg016276;
	Fri, 24 Jan 2025 10:53:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485cm9h05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:20 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50OArKSh016269;
	Fri, 24 Jan 2025 10:53:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 50OArJ7d016268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 6069655C; Fri, 24 Jan 2025 16:23:19 +0530 (+0530)
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
Subject: [PATCH v2 1/8] dt-bindings: qcom: geni-se: Add 'firmware-name' property for firmware loading
Date: Fri, 24 Jan 2025 16:23:02 +0530
Message-Id: <20250124105309.295769-2-quic_vdadhani@quicinc.com>
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
X-Proofpoint-ORIG-GUID: YDHbwbX1z3SV2z6EIJloLC2qX0Xpl1mf
X-Proofpoint-GUID: YDHbwbX1z3SV2z6EIJloLC2qX0Xpl1mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240079

Document the 'firmware-name' property in the device tree bindings to
support loading SE (Serial Engine) firmware from the protocol driver,
allowing for more flexible firmware management.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 7b031ef09669..3e029d4d6f58 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -54,6 +54,10 @@ properties:
 
   dma-coherent: true
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Specify the name of the QUP firmware to load.
+
 required:
   - compatible
   - reg
@@ -135,6 +139,7 @@ examples:
             #address-cells = <2>;
             #size-cells = <2>;
             ranges;
+            firmware-name = "qcom/sa8775p/qupv3fw.elf";
 
             i2c0: i2c@a94000 {
                 compatible = "qcom,geni-i2c";
-- 
2.34.1


