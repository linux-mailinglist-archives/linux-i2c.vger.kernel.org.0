Return-Path: <linux-i2c+bounces-12372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71832B3105B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 09:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3BB3ACA71
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 07:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072E02EA478;
	Fri, 22 Aug 2025 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZTLG8Ud"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ED92E7BDE
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847636; cv=none; b=CSKyJagcyRwltAHQ2JWj+AdmfsvYs4AATIQx98AZyg6A4Ujtp9PB5VbjyJ1CqgpDXDi92sWmlt6vaFZw6thoNcRrfmaFkxZDvPyxj8MLTCnO5aL8UsAGOKX85S705mTPqgrqIjRbjYQ6q5Z/DcIs35XdFW295J0aErbvnMpaSKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847636; c=relaxed/simple;
	bh=zRF/SWKg7J8zSJMhgoR7B0BpUTYTZqskWOwFGNr7t0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AmNMMvAUr1YTOF0GX9MWBiKR6aLLMwnA9eb6FcsRu4PB9uM1KXOtur7z0DpZA2xZKF0AxLcakjT10Pl89Qg294qrag07n9IqODu3hFa821TkVIZ7oZ8vCyl7ColoXAwTRxb3VKEpNTIR1NdFgAorGVyYp+GCXUUM9f4ssWBt4H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZTLG8Ud; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uQXd032146
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sLkMtTr2Bn5
	K4bQdcvBu5RXJWEJPuqmisraPjRoHi84=; b=JZTLG8UdvEGhrXgafJghaE6AEqz
	KW55gyrCFst3Dkb30kMhwcH2RTRQBMGwO0Q0CrIdytViNa+cqappP4w8mfH/g4gz
	OYsIHDJKMKlLpthKIAkopTa17fT73C3AhTYieIIOsUTbocIzF0aFN9Ivl03r2KDS
	ofUNn/USOsRMASyUIfFkMPssqSyiD6EpEvHNHisce3+0WYn71xvR3lsx5kqCxVER
	kzanZv7iwaX+SC4iJJwSgJfHIIFwMNhDqpVesbZ7izj/VdwnrTkYQzJ2acB/1TNC
	J7bDrHlWCMr2BohPQm092sV+aP3P8ILA7x/g/MPWeNNDSu2jNvC7azY8EnQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52988ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32326e09c5fso1924383a91.2
        for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 00:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847634; x=1756452434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLkMtTr2Bn5K4bQdcvBu5RXJWEJPuqmisraPjRoHi84=;
        b=aFPXzxzp9q/qHdgT99DqpQ9yvcrNMcpjnFcdw5rOYOsw1FwAeiOeCZhU9pRg/GwMeg
         5aiYN7ajwo+Ku9T9sc342LykmrM/69FeaNco/otpVNTdobkTr/LzEyZHrTUMKZzeQ3o6
         Zmrcc2QdDn+7RGhCILoa11jT3t3eje5YbmiPZ9mFNlDisY+7ve5S5YIAjeQtusJhwuYu
         TgtVRXT82eGkr5HUXL1/TCs+hFkBrfVIbfiZR9CgKT22G9VvX59eSAWyV50HQ8W472vc
         Vc7nARbx8IjeNS5FNMnztvWf/6qJMwkbaJO4SLHlKY2PmFv9rc+wWMcUAbSEpQTTnS/K
         Pilw==
X-Forwarded-Encrypted: i=1; AJvYcCUVpUiqXByqVYX/09g1eXfmpAXLpX+qDk39I9kDRaI7B+C/dXw2+eiu9Y0L2+YTkRF6bcUWrIGF64k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyECkKiGq+DKf2j51wlsk8JI2YnEe1h3Y+rnYxQN7AKAyEhTGWC
	z1g1fESKBGb97lHI/OiG0L6vczAyY6DsoqL/ZxGxTENa7A5hQ603O9rGQxQYHVOH/B+9L+GJGz3
	53j7d7sxmp+WnUXDCsfWo7MkACYxX5Owp5SNGvoFYAn/Aqy+NbO5kSNMZVkRb/Dc=
X-Gm-Gg: ASbGncsLoTrvfiu7TCW7SAYus6R9P7UQNrfRMtC2Y9m7Tfr9AsWZqg14X68hfjeUlL7
	aqd2xKkNyaDJtTmXmkLTw2LRsMeKUpQ8KVzI/jd+P2SyighLBG9qG7vafaVhLVx5VUjfeqO3fJC
	ezUovSb7GcOjrQk7kNKN0uKAzGWfxMWzvzve8uaoxgz52f56aE0dicpRt3WVbBpiAzi5rMLacha
	pZgCGVJ3y3Yipoh6Evm9LYlptX4KUf0vWu6+OJM0HB/5EmQyWFakJbyFl8fU+ky0ltMfn4VfT+d
	BXKJNdpH6+wp+AsmmhriwlBp6yAUWWh2oLCLLsC19yiSqvvND9oENYTrKUidMYBBg8w/KV0tNPQ
	x
X-Received: by 2002:a17:90b:55c7:b0:321:1680:e056 with SMTP id 98e67ed59e1d1-32515e36b50mr2995199a91.9.1755847633546;
        Fri, 22 Aug 2025 00:27:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsnvfjM+sJnS56KF2zpncH91f2aO5DeQUnn9KXd7VBs1w3xVslfyycQjtQYddBs5i+aAOL0g==
X-Received: by 2002:a17:90b:55c7:b0:321:1680:e056 with SMTP id 98e67ed59e1d1-32515e36b50mr2995158a91.9.1755847632922;
        Fri, 22 Aug 2025 00:27:12 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fe3047sm6416367a12.17.2025.08.22.00.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:27:12 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, broonie@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v6 2/6] soc: qcom: geni-se: Cleanup register defines and update copyright
Date: Fri, 22 Aug 2025 12:56:47 +0530
Message-Id: <20250822072651.510027-3-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2Ds5a4NdcdQksUe5B3V_Yy44xf_jfNTO
X-Proofpoint-ORIG-GUID: 2Ds5a4NdcdQksUe5B3V_Yy44xf_jfNTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4+VVHeMx7QKE
 UppoI+u0EoJ/Fkr/53pRoMQeppNkAcuNnTTIUJYRc7OU+KAW/iam538p77WZtHBkHZA7L3Nvhny
 ugzIMSPZWajJ1F9ZSUeSODJyM1ATv1ySI6um1DiDy1ppiigiSH50ntPqCNAEx1ynli1O8x4VYcR
 oYmL+JRLIrgTEtuGgHm3F5yxZebeCqLbrkUzJEejCGppLViHwPvw2K2e6Cn9RJwNA5ufeoSwx73
 ltn0Q/2r/atJwBadllNt+90IJ9RChAzbY2H1PXTu8VTlUbr3kckn5XVTUgZK0yhgK1vtmiT9W64
 79A0TvWRKxPAhpEvj4GBG4j1pMp+KI8MWwmdy3qA1zTZQ0JtCh1pfTeQjjerNpl+qt4X/RFMO06
 2f5JbgdrYsvIJDce32eyuOa0tgDbjA==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a81bd2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=cWaLTDLleWsxmrQceUoA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Refactor register macros for consistency and clarity and remove redundant
definitions and update naming for better alignment.
Update copyright to include Qualcomm Technologies, Inc.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 3c3b796333a6..e8ab2833815e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,5 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+/*
+ *  Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ *  Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
 
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
@@ -110,22 +113,20 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
-#define QUP_HW_VER_REG			0x4
+/* Common QUPV3 registers */
+#define QUPV3_HW_VER_REG		0x4
 
 /* Common SE registers */
-#define GENI_INIT_CFG_REVISION		0x0
-#define GENI_S_INIT_CFG_REVISION	0x4
-#define GENI_OUTPUT_CTRL		0x24
-#define GENI_CGC_CTRL			0x28
-#define GENI_CLK_CTRL_RO		0x60
-#define GENI_FW_S_REVISION_RO		0x6c
+#define SE_GENI_INIT_CFG_REVISION	0x0
+#define SE_GENI_S_INIT_CFG_REVISION	0x4
+#define SE_GENI_CGC_CTRL		0x28
+#define SE_GENI_CLK_CTRL_RO		0x60
+#define SE_GENI_FW_S_REVISION_RO	0x6c
 #define SE_GENI_BYTE_GRAN		0x254
 #define SE_GENI_TX_PACKING_CFG0		0x260
 #define SE_GENI_TX_PACKING_CFG1		0x264
 #define SE_GENI_RX_PACKING_CFG0		0x284
 #define SE_GENI_RX_PACKING_CFG1		0x288
-#define SE_GENI_M_GP_LENGTH		0x910
-#define SE_GENI_S_GP_LENGTH		0x914
 #define SE_DMA_TX_PTR_L			0xc30
 #define SE_DMA_TX_PTR_H			0xc34
 #define SE_DMA_TX_ATTR			0xc38
@@ -142,7 +143,6 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 #define SE_DMA_RX_IRQ_EN		0xd48
 #define SE_DMA_RX_IRQ_EN_SET		0xd4c
 #define SE_DMA_RX_IRQ_EN_CLR		0xd50
-#define SE_DMA_RX_LEN_IN		0xd54
 #define SE_DMA_RX_MAX_BURST		0xd5c
 #define SE_DMA_RX_FLUSH			0xd60
 #define SE_GSI_EVENT_EN			0xe18
@@ -179,7 +179,7 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 /* SE_DMA_GENERAL_CFG */
 #define DMA_RX_CLK_CGC_ON		BIT(0)
 #define DMA_TX_CLK_CGC_ON		BIT(1)
-#define DMA_AHB_SLV_CFG_ON		BIT(2)
+#define DMA_AHB_SLV_CLK_CGC_ON		BIT(2)
 #define AHB_SEC_SLV_CLK_CGC_ON		BIT(3)
 #define DUMMY_RX_NON_BUFFERABLE		BIT(4)
 #define RX_DMA_ZERO_PADDING_EN		BIT(5)
@@ -196,7 +196,7 @@ u32 geni_se_get_qup_hw_version(struct geni_se *se)
 {
 	struct geni_wrapper *wrapper = se->wrapper;
 
-	return readl_relaxed(wrapper->base + QUP_HW_VER_REG);
+	return readl_relaxed(wrapper->base + QUPV3_HW_VER_REG);
 }
 EXPORT_SYMBOL_GPL(geni_se_get_qup_hw_version);
 
@@ -220,12 +220,12 @@ static void geni_se_io_init(void __iomem *base)
 {
 	u32 val;
 
-	val = readl_relaxed(base + GENI_CGC_CTRL);
+	val = readl_relaxed(base + SE_GENI_CGC_CTRL);
 	val |= DEFAULT_CGC_EN;
-	writel_relaxed(val, base + GENI_CGC_CTRL);
+	writel_relaxed(val, base + SE_GENI_CGC_CTRL);
 
 	val = readl_relaxed(base + SE_DMA_GENERAL_CFG);
-	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CFG_ON;
+	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CLK_CGC_ON;
 	val |= DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
 	writel_relaxed(val, base + SE_DMA_GENERAL_CFG);
 
-- 
2.34.1


