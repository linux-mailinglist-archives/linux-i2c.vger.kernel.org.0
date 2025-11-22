Return-Path: <linux-i2c+bounces-14227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4CC7C7B0
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A6F14E4907
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A3B29B777;
	Sat, 22 Nov 2025 05:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2A9yWiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYT2vFif"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B82D3A70
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787708; cv=none; b=kaHd6iTKqIkT83dWl9oYyxH55I+pC0LAb4F9Xaixv5x4DeMJD20VGbjCsJ96X5kadVjD6btZZEsvEgK9ZEBnwJZQoaiH6VpRUimQu27e/P71b61r4GCcgfpvvViaLBdjN9xtFZb5dRyJn0/paTJEKR/ynIZwubdAdESaB3mWMrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787708; c=relaxed/simple;
	bh=mbJR727ggrtrvgHXfUkmla3xXcuIgQNfVcXl74QOnS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bvkPBbV383TVErjNKPvcE/c/AlKCFKIzGJ+4ZKGEeK8b0HA2oADaECVZ9le1/HIMlaccf9ykgrDfHYO4K9rAwKh75jf2NdxP1p8b+jwYLmdh8yyP6FtbXoii8GXJ2So4tW/70S4N5leng/YJ4Q6ZpOgrdrz0Dj9z1zDZxiAozwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2A9yWiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYT2vFif; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4la5P1252714
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cYCVHWiTnrq
	EYRLdnl7gmKSduhx1q7VxqZ9bihRVOkM=; b=Y2A9yWiH2h8PnKlKwMmELGn/esn
	4YP6EU39sTHCsSRqvo/cuRSZg+yrY5MxHmJpbHiOy3QqeGNjgt9rOROTNLpt+f6K
	w8ZOqGKEMObVdf2EKkWDFNfUcU1tFA9d3wBH4+uNbATFmVOV30JeokbKx3oh0RRa
	vq6U6S/ptnBdwH6HdG7C9BYbbELwZx8zMUPQLtz2h8HejgYIX+tfgbg0jwdvwbkn
	zh/3E/MDnupynFWrk5D5i6bsh57gp5j5rvTqzhOxSe0alwozGx2rXrZB1bImnMPR
	3sx/sctzhpg0hmZCE4Dhp3fsYdbGdTUC+53pIBOFmkwkk4ro5F2VsSgP8HA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6f800rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2954d676f9dso20194395ad.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787705; x=1764392505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYCVHWiTnrqEYRLdnl7gmKSduhx1q7VxqZ9bihRVOkM=;
        b=HYT2vFifSwdIHkpKVzdByw77aKDuIh0hhPeRbUjpXn7yhEnTZ1jBXFrO3syX88g8Uz
         lkbdWz3H+MBdLdgAybSvstXIYNFGdy/H1V9z09ny0y4IC2+11gPN3+IWnmQCW1h643Uq
         3D3RUcWooWPsMkMyQL8RiDTF94Oq9esM09c8L3bLu2VtqevUZcH/Wf0B/b2qqVbo7hcN
         EUauQr6T2Im7l2MEsi64PwE3ajjoRCqnZG2fmx7jDJRsT3BEjAd83Ds4qPr7MEnj+Vj6
         nRxjj9kDM9E2yzlp9bMl6iF1rcqJMwlxE/gkI0QCt2Myq5d3BeVMmXDfmaXPhQX4/+3P
         /DZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787705; x=1764392505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYCVHWiTnrqEYRLdnl7gmKSduhx1q7VxqZ9bihRVOkM=;
        b=r3tyzpmOGwi1eoEAD0xwKnJycSNiFKsROYgE+8wJ6WOwrokbLSAqkmqHoLNsnrmuRT
         6YdjOjMGgREnoj2qVt4C3P01Xy/yb+Ix0n10fsYWyxLl7wjDkLiCQhjjU37i+hpghs4Y
         PIo3FL0UPSl5o7yHEcs5R7Q1NK/Ayul3XtP7L1fDjDj3hTIwh4PH8EmIoDIqwHpIY+oX
         yaqcNXv5Hbd02FhnpIJG5kWZcXEDb5E8XMBDkhGacZgJQparnNU5DPxxvvcM8y4SsoxC
         57i1710ZexAJ4JUngfQ/NLkuiqYmQMLyIisr6w4gNoPTRH4GR1LzlYjObSjQ4zP1kTbw
         m/TA==
X-Forwarded-Encrypted: i=1; AJvYcCX+arqCFC4lfk/Ue+sfyoZMjGYffqayxmoSeSoTC+lMU51rg1pOxqehb8umXl0UP9Mjy7V8DB3QK9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT0DpNFdnVVKBgZ2wewwHs8u66Rinc9ksnv+8RU4bx7qpwTyHc
	fsGmfG+nwnOYWd6PK6Er+ttXDbO7w0OfzzOyDC9JJt8uKGyZyLbuWDpwIeOwUoRT4NM5oE6NUlB
	zZHwqN1GWoMJP7ntjPpSW75y3unjJP+6SElCrxJpcCSH9CLAH6/6pY7bo1ZiQgOs=
X-Gm-Gg: ASbGncuUofPN8RsExQ+Jmj5NFBdLl0fEur/KBdxvpbCYL9fDQrq9A2DlNpFu6CMgY0B
	swMgEIbZ7Fz6s/5kDzlP4AttOxeagbSAvZGLueHuWuQs0ubThGdWCBSna/wwQArzuHkEDaN1QYE
	+BD7Rek+URnOrhEh4A1bc6pCjrJ35j+UOdK0lm55CAEppL+Lbeo5/zP9XrhWsbTY4SMj6gx6YzW
	w8Yrv1MBfjcdj2OuI7YM8A2RBsvFSS3sj7v5XG5uhZPFgtnCplAV66ZbYS15CS0rJ0TCxs/Qauk
	T6qHvahGg4NEHboYioGorrcVhAL35rckZ6VwK8enJMJqMUclGF8NkitvlvBCbcMJPGFhkZAXZq1
	M0XE5K17Dkp3EJRET+7xEUhnEKUkg4a6/Rk7pGDll/Rs=
X-Received: by 2002:a17:902:d588:b0:295:c2e7:7199 with SMTP id d9443c01a7336-29b6bf38528mr51869605ad.29.1763787705417;
        Fri, 21 Nov 2025 21:01:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8OAiROK7F5GVWbTxASpswDLwPXSs+Afy8DSzGXuPGImfgg2wHiAcv4P7FgsnG632nij/7gQ==
X-Received: by 2002:a17:902:d588:b0:295:c2e7:7199 with SMTP id d9443c01a7336-29b6bf38528mr51869315ad.29.1763787704849;
        Fri, 21 Nov 2025 21:01:44 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:44 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: [PATCH v1 11/12] i2c: qcom-geni: Store of_device_id data in driver private struct
Date: Sat, 22 Nov 2025 10:30:17 +0530
Message-Id: <20251122050018.283669-12-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: anhk-orF-yGpcdLFvYX2PdEtuPUP0Fxw
X-Proofpoint-GUID: anhk-orF-yGpcdLFvYX2PdEtuPUP0Fxw
X-Authority-Analysis: v=2.4 cv=SINPlevH c=1 sm=1 tr=0 ts=692143ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mUiiJuWc4wU39pmrI74A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX3Z7/VjFY7EiT
 PC+/eXaCvRr/d3N72ZjBV0aY/9HySmomnNQDMPGC9+khs+AtZ6b2ciphgnJlLKG1W7symtrWV2F
 1bOZCd1FcoYrY40cEXKbF8JxcnSNwYqTW6A9Fu3tPVU544q05nrhrAptComBfEtuMwakfVJ8RxB
 7VRaXNHZqfdSzEzFadzAXDdB5YKpqPVdKHaQ9mgqmYIHw9KwicQAd3Kq3rcCUj3L450qrtvwiww
 mm2TZ5tLYVskWj2VsbrQnRBIxmnrRj5YReAjUklenx2J/+BLGjhUnX0XHVhxfpxUWbgwshzTCP7
 A/lUNtplM3X5rCwI3KD1ZIekPW4B45+KGUFhBVYcaSMZk2ToUH+fyAAg5treHs1RWDh723hGFzV
 eisPcQc/beNnqldx1BFcc0Ni4jDjrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

To avoid repeatedly fetching and checking platform data across various
functions, store the struct of_device_id data directly in the i2c
private structure. This change enhances code maintainability and reduces
redundancy.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ea117a4667e0..a0f68fdd4078 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -77,6 +77,13 @@ enum geni_i2c_err_code {
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+struct geni_i2c_desc {
+	bool has_core_clk;
+	char *icc_ddr;
+	bool no_dma_support;
+	unsigned int tx_fifo_depth;
+};
+
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
 
 /**
@@ -121,13 +128,7 @@ struct geni_i2c_dev {
 	bool is_tx_multi_desc_xfer;
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
-};
-
-struct geni_i2c_desc {
-	bool has_core_clk;
-	char *icc_ddr;
-	bool no_dma_support;
-	unsigned int tx_fifo_depth;
+	const struct geni_i2c_desc *dev_data;
 };
 
 struct geni_i2c_err_log {
@@ -978,7 +979,6 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
-	const struct geni_i2c_desc *desc = NULL;
 	u32 proto, tx_depth;
 	bool fifo_disable;
 	int ret;
@@ -1001,8 +1001,7 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		goto err;
 	}
 
-	desc = device_get_match_data(gi2c->se.dev);
-	if (desc && desc->no_dma_support)
+	if (gi2c->dev_data->no_dma_support)
 		fifo_disable = false;
 	else
 		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
@@ -1020,8 +1019,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 
 		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
+		if (!tx_depth && gi2c->dev_data->has_core_clk)
+			tx_depth = gi2c->dev_data->tx_fifo_depth;
 
 		if (!tx_depth) {
 			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
@@ -1064,7 +1063,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	struct geni_i2c_dev *gi2c;
 	int ret;
 	struct device *dev = &pdev->dev;
-	const struct geni_i2c_desc *desc = NULL;
 
 	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
@@ -1076,7 +1074,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
-	desc = device_get_match_data(&pdev->dev);
+	gi2c->dev_data = device_get_match_data(&pdev->dev);
 
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
@@ -1221,6 +1219,10 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+static const struct geni_i2c_desc geni_i2c = {
+	.icc_ddr = "qup-memory",
+};
+
 static const struct geni_i2c_desc i2c_master_hub = {
 	.has_core_clk = true,
 	.icc_ddr = NULL,
@@ -1229,7 +1231,7 @@ static const struct geni_i2c_desc i2c_master_hub = {
 };
 
 static const struct of_device_id geni_i2c_dt_match[] = {
-	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };
-- 
2.34.1


