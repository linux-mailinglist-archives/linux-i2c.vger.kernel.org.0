Return-Path: <linux-i2c+bounces-9687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBC4A4C0A1
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 13:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DE7A3A7E0A
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 12:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C9C211462;
	Mon,  3 Mar 2025 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ES1/oqjF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B8520FAB5;
	Mon,  3 Mar 2025 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005851; cv=none; b=j4tXQ8YRsWSE9sxSYkG6D63/V5ZYPCBu1D2qJs20Ir9TsssErWqgo/yawJMyKEX1j9hA/6TgqkfIvLok9m4vU9KNcW7JugPBe+AvOkC5wDP0o+EcJX/hZ6UJfTkIyZThc7wKboPXR/tZC0DYA5I7+2Ui+4jG2nTZpG1EIaOCu5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005851; c=relaxed/simple;
	bh=0Q9ukCmABBvCJwLH5vcBmSdbONmIGEP/qxDhPui/44I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=suvWuaatucCULNZVP8xU84hqnmXFBv6NEjfRyl6l2vrWkp+XBZ6lpPiMetvSAyAmMvs1ctym+ZUTsk/fLXoLZVhK5wJ6iDpOxz5USKu8zYIEZOa/bIruTTzy1z5aE1AHJv24BRk98Jh992VpCie6tqD9kMfVzORH7qHu2AByAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ES1/oqjF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5237ioJE025781;
	Mon, 3 Mar 2025 12:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5TwXO6Q/fMH
	lWogbjZG6bz6Rc4U9FlDAPzYXVx6L7MA=; b=ES1/oqjFQBGpMYVQoGSea+wRoGd
	EdjB4GOuuRLvZt3sruGQnbD/UjEjC2VswZZlC1w3FS3hheJv+ltJQFpmbG7e3FFL
	VJlvviXBayprTKP/XBGGyxY2K6oXQMoXYJ2Qabefn9RIbKYXc3WNeCpfl4gyg5/o
	9EAAQ0RvrepZ4OYZbBFqWilwawPhUIj4LCcql6gaaHWUemVIulOF+S2dvmvgW+fz
	fh7rFgcngtCxKfNBC9LW3oNqKBdph4D+ci2OfRZtZW6z2z5CNLVa3E2Muf3vzrzP
	BIaWYcHRA55I39L6Gim/vmneXe8DGroHUqfjr129syHb4kUMTeotlArsq5Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4558a60wn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:04 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 523Ci13K015175;
	Mon, 3 Mar 2025 12:44:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 453uakx554-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:01 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 523Ci1cY015167;
	Mon, 3 Mar 2025 12:44:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 523Ci1HH015100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:01 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 58C4153B; Mon,  3 Mar 2025 18:14:00 +0530 (+0530)
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
Subject: [PATCH v3 1/9] dt-bindings: qcom: geni-se: Add 'firmware-name' property for firmware loading
Date: Mon,  3 Mar 2025 18:13:41 +0530
Message-Id: <20250303124349.3474185-2-quic_vdadhani@quicinc.com>
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
X-Proofpoint-GUID: OWzgBg5ASEwBKhLBXsJ1EM4BDZQT0MTv
X-Proofpoint-ORIG-GUID: OWzgBg5ASEwBKhLBXsJ1EM4BDZQT0MTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 phishscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030098

Document the 'firmware-name' property in the device tree bindings to
support loading SE (Serial Engine) firmware from the protocol driver,
allowing for more flexible firmware management.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
v2 -> v3:

- Remove ref and add maxItem element.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-2-quic_vdadhani@quicinc.com/
---
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 7b031ef09669..54cd585f19e3 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -54,6 +54,10 @@ properties:
 
   dma-coherent: true
 
+  firmware-name:
+    maxItems: 1
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


