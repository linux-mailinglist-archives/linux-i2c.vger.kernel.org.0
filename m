Return-Path: <linux-i2c+bounces-9721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1EA4E492
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 16:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAB9219C36C2
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 15:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B14B27FE63;
	Tue,  4 Mar 2025 15:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QQbVVHDu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9593C27EC9D
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102538; cv=fail; b=Fok40Yd/+4gvBWO+QBiyyxuemIAYNPY9ppCf8980+zieKHNQWrFMr4zLxFHj9tPC+xKdHlDkL1NT0+K+k23kV6WhdTg4/gfGt4Dsa+4G9fqMqLbYa1HZjh+eHg71thFBC4JaW7uV0sHP3/1UBQh4iqlRUEl1WvmxXtxujwu7Abg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102538; c=relaxed/simple;
	bh=1DarwwdcHSgo8NBv1NWEBooWSWcuDdO8/nohsDYSTd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M+Zy23NWxFwIYlc5a9UCSKdnaPiNEyXg4JS3Lgu7fwQhdOo/qNF8cAcgW/YZUQ2aczrQctDrP0pn0/STdC7hSSzb89C3nJX/cq8QGIkrYuj0LL8vuntnMzAF7kp8SicXnvvl4cbqi2kephEOt6aYzHUSguHzjmvf2gOziLoAgaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QQbVVHDu reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; arc=fail smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id C83BB40CF138
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 18:35:34 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fpF3ND1zG0kP
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 18:33:09 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 5608E400C6; Tue,  4 Mar 2025 18:32:57 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QQbVVHDu
X-Envelope-From: <linux-kernel+bounces-541723-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QQbVVHDu
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 7BF904221D
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:45:41 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by fgw2.itu.edu.tr (Postfix) with SMTP id BC5C42DCE0
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:45:40 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36C1F7A3E55
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0834A212FA1;
	Mon,  3 Mar 2025 12:44:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957220FABB;
	Mon,  3 Mar 2025 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005854; cv=none; b=iAZuhgvSiZYj1tvHIuLMq4CE6VHIr7AMWpk9EHp71i+/4NfHxUigNXucQGXZWLPhBvn1+rjFsYfU3oWCtBL3Fo4DtfdJk9qqj22vJuQS7cJpzjEjGbqEZ9Gf1jZAtzkb3Sq6dIhnGU599tfnbvY3wIWncGhPA7aUAhO9Ia4UfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005854; c=relaxed/simple;
	bh=5Pz3E1OrB0yL84X+0ShTfpEPaw1Jt/X9ouBXYxIxOFc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KcaaQdLKf3xrldVK0Yd9O6ehRGoo+e1NUalCvFwSqovm242HH2u0BOB0DI1qOFW+4TKN5KmRUJFAhCJn3Tolh8sSaz9phSryckAITH3Nht4dgFad4l0YdE0SyV+tJzk8ReEqkBtO81g+IWKnQ+MAl7FOEm6u0ehVjCnh7rONV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QQbVVHDu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523APJ4i000940;
	Mon, 3 Mar 2025 12:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ap+Is/pFfik
	mdzgl/IVzBjkMnJpe+CGzhQU6WoEkJiM=; b=QQbVVHDuxVxfMJRO39yDOHtn23T
	+6Q9gCrKGC0ASurjdovwdoqcJynDRsFvr/fJf6ieQg/SaAgYY/cX4Zmnyz7nuoNN
	d+2p9iEO4Y7tAMtOIB2ng53nkcVDghPa1Sx1I0Gi5uvGKuu1Xii2Jv9n2pHMDN5J
	thWdv5n31TJFNFj+tIDlHoRjQDaCMvwztj3sNMPKZjvPa/4PLXt/+U/KVNr47Q3y
	k9wyEVnZuuASgX0vHdZG2ucCkNAx7H6pJuZkHZ/ZPWhuUj8p7REYsPMTdOD+bg0t
	WDH2eSArWuRXwFvX4LLEhAWjdKKi6VeNyy42A5ndsct3liOnFXic01KCasg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tascy3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 523Ci5iB015256;
	Mon, 3 Mar 2025 12:44:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 453uakx56x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:05 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 523Ci5wt015251;
	Mon, 3 Mar 2025 12:44:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 523Ci5v3015250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 83A5253B; Mon,  3 Mar 2025 18:14:04 +0530 (+0530)
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
Subject: [PATCH v3 4/9] spi: dt-bindings: document qcom,gsi-dma-allowed
Date: Mon,  3 Mar 2025 18:13:44 +0530
Message-Id: <20250303124349.3474185-5-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aiwDP_jtpYWrqfwNxMPcl13ED4_nc1Zk
X-Proofpoint-ORIG-GUID: aiwDP_jtpYWrqfwNxMPcl13ED4_nc1Zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030098
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fpF3ND1zG0kP
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741707214.26848@U+ZUAOSykKI2+/tQuZnwkg
X-ITU-MailScanner-SpamCheck: not spam

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

- Drop the 'qcom,xfer-mode' property and add the 'qcom,gsi-dma-allowed' p=
roperty.
- Add a reference for the QUP peripheral shared YAML.
- Update commit log.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-4-qu=
ic_vdadhani@quicinc.com/

v1 -> v2:

- Drop 'qcom,load-firmware' property and add 'firmware-name' property in
  qup common driver.
- Update commit log.

v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-3-qu=
ic_vdadhani@quicinc.com/
---
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yam=
l b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index 2e20ca313ec1..012cb7aecb3d 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -25,6 +25,7 @@ description:
=20
 allOf:
   - $ref: /schemas/spi/spi-controller.yaml#
+  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
=20
 properties:
   compatible:
@@ -63,6 +64,8 @@ properties:
   power-domains:
     maxItems: 1
=20
+  qcom,gsi-dma-allowed: true
+
   reg:
     maxItems: 1
=20
--=20
2.34.1



