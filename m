Return-Path: <linux-i2c+bounces-15045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBAED120AB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 11:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C43B3116B22
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6F634D4EF;
	Mon, 12 Jan 2026 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKAfdB4d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQBRWp/E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48246349AFE
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214931; cv=none; b=CWdHxRuNdFvOoL09+06wlFELFg1OX83jbmYb2+/JxK8Cy+IUSufcKVLR5hBchR2NapMMe/lmuY8BJZyFHADQT9+Bp/QSHO33Hi7ebj3HB9ACrKhDDcZuwOsFeUowYGM+o6dNuriLtRsT6z8UfGO7Q3Ogr+tg6PnDT1VtEU75K4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214931; c=relaxed/simple;
	bh=xDkyBPuRfFQUeONjgjh4SZDmWk1ekP9KQszR2YZ49MA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RYgQt/ea/0LM15wX5Bd9B/QobsvmfVkmjgcyBA8TVUVGYTeZYmGPzUSsq3IQKIx+1+pHdreAPhSfAp7ZLiOW50m9w/yLpLUEsX43IQp6LgRV/qPLsAmBsSsdPbtP4x57ITMZobeI98sshfh++YJ4p19iNar6qlttZgqTWSm/YpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKAfdB4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQBRWp/E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9WcWb309114
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DgcATLdadUu
	BZeeDX28NTXhmDobAIOP7dtiFb52lyrc=; b=JKAfdB4dHfaB9u1ww6gVBJ1Avxt
	entuwA825HhlBUx+3pWqp70dBCqTUk7jWAQWpHD0WB5T3H1B0FgV1UtDfymIqW2a
	MWzQzyatvO6aiB0juOs5/UhEJUo9HjoiScskWSQSioKjPHSJry3aQUldRzfNhT4K
	f6Ru0MDE9Fi2vwJzac0+HBNd4MF2L5HtsBwfqbPNXAj2/dNe1q9ANEh6fI9+r0gy
	mpd8rK17ylFJ8Q6GjfaJ9s8uPHe47ePbOaigKrQ+IkYgzVTJumnXMm61e2O6iTnr
	8vIYvKeI7trN7RJrpZk1xuWZj4e52wBVxWDwEZYJd3j6ugRseuAZbrwQjKQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxdvr7aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81e6ec1da28so1785390b3a.0
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 02:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214924; x=1768819724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgcATLdadUuBZeeDX28NTXhmDobAIOP7dtiFb52lyrc=;
        b=gQBRWp/E1Rx8LBnWpP/TaY/Cq0UKrpdQ7o9tI8pzPWsqK5vG/fyEIbfow3bTFQ40MJ
         xaSjBrTlsDP0IkovSGge37duzlS8UMEEMdei+/VkRcCP2/dYQsMg2Hg8vIRgUiB2cPH1
         1QlpftashsF/0DyFBPiOgKceRlQ+vY5JQpdeP59IC001Yq14ayKUZRs3KuDD6mTzb5aN
         kHrHkMi0Nx6yeh7+Hzyyf+/kBgsR+U11IHVyTrrj49sAiy/OiuTRPcbbHgg7gSlSmM8r
         QB+h9NB8iPUBcln4a0pgoHEnZPQ3yLpvTMQx0Wegl0RtHYHPoEcxvwT6t6ZWZF71fJdo
         3uxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214924; x=1768819724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DgcATLdadUuBZeeDX28NTXhmDobAIOP7dtiFb52lyrc=;
        b=HSrswAQlt80w8SDExEkEs2gLrQZznVWxOqq4lUBdHxpUH9IY6NYS0lGio7ychZdrWE
         9vqY0rVXs11o0YHvqGEKruOVdl3wsXn/07Y/gFhY3FyzThrW/wnOVdUPjK4q0IOut1lm
         MPqpxmNS6olNvxnSFpmDJb6RO+Fg9xyqEuQQdG/qZm72RF0g6m7V5QhFHeQr9lBa5eYQ
         efRMvDxJJwjHb/QoNmFaPjKbcrWkpBsXdhEEYyDzBVXPVciONWs5lLB5vCmfv05/v6Nn
         R5rXzKEcOCS+/O+zdqokr7K155Qu2U6iVKDW5ma88ka88YYhNJnCpVEYVOMlMPyrxoye
         gYqA==
X-Forwarded-Encrypted: i=1; AJvYcCUQTzdaoeCUTDJwA4eBHsl88Jx9mAvi/ahVt8sf7p7mj+iIh1hW9/RraJS91mlHi4ELUMWf+K5l/lg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5d3xlFC3AJZVw6z0QWpgy/O+dX9P2YTNKZ1Diy7/aVtjLwKLb
	9bkBA3IpHhxCksc5S5sKU5pb3+apJnqUaNh+qDU2/Oc3Yno6u92pwMdwKy380kwGraiSPGJCVFW
	bvGfX7NoIKLjajbcoPtnsnlygecfNnMmrvSLwCqeaCszUByz4VQ83AmZ+/J7geGw=
X-Gm-Gg: AY/fxX7bq4zb5tnZL0P7Nk0YDky2wlUq84Ek1LW1305b6oC5g1JCDRI+crn4XiQ6Uc6
	VH1zoIZJm7y2g08xXPFe0xYVM9keko90b1nuHwse2LGOLI6sI8hM8xLAL5QH4VX4ac5qpQ/dRDx
	7p8LZoLfPQkxiS2/ORba+0wH1ULr5XhDz0qrJid9a6eKcQEHsveQ/Bskns1wjt8+qKchrmm60Jc
	dD7CghgL6YRRfnnWmCFHciK/JXP33orJadCP+8NXZM97EoP6RC0DZfr5gU+s/ZOmzOIA9o2j+RN
	yuon06ESyfBE/UU5LgdSwb9VRPScebBAeLQwNljHwYmtHYMy+hXQzA1ND2fId0oQ5sDwczmj6Mz
	soeuOduHCURw+ublrSh+C8yR6AIOFifShRdJWzvBiLrE=
X-Received: by 2002:a05:6a00:2c85:b0:7e8:4471:8d9 with SMTP id d2e1a72fcca58-81b7f6e0b44mr15813983b3a.58.1768214924290;
        Mon, 12 Jan 2026 02:48:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiy1O1m10aedAjMGwqF5rmnMlSOnYznyA7LCV0CRzi5hXIOLAynz0ndP1rRsqUmnbm0WcHlw==
X-Received: by 2002:a05:6a00:2c85:b0:7e8:4471:8d9 with SMTP id d2e1a72fcca58-81b7f6e0b44mr15813955b3a.58.1768214923736;
        Mon, 12 Jan 2026 02:48:43 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:43 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v3 11/12] i2c: qcom-geni: Store of_device_id data in driver private struct
Date: Mon, 12 Jan 2026 16:17:21 +0530
Message-Id: <20260112104722.591521-12-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oPNavllY9jFeecc0oMIVol93UdEDtcK4
X-Proofpoint-GUID: oPNavllY9jFeecc0oMIVol93UdEDtcK4
X-Authority-Analysis: v=2.4 cv=HoZ72kTS c=1 sm=1 tr=0 ts=6964d18d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mUiiJuWc4wU39pmrI74A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX2vqL6u12WafA
 P5RpdliWFAiL2h8W41xwIiqkTmou/udCm+k3jKLh70WdEldlWNWkmaB9y6a13KZy6P8vVUXe6Vn
 U8LnzdJbL5b0JaT5Q3Q0dhBOpHCm4U0CRibk8oTRkZbyKNJ3z6yikemRfpxo55pzw5FfOIafvqs
 GUc/1T5kszyVnrTFjJcGGUeE0jP2gZmbOX2KVM1HIQVL7IWsipkgBQHAJANYdkrhukT+4BOODpn
 2QAaZIgZfjcHUP6C2hy+qJxQxFcghnDQX3MYD1r2rn865CZElZkPOS+aWu+/e4uSRbVoNMixq6C
 BedtfqCiypssYMp3fqX70BbeVf9cppmyLRW0IESlsQwEhiwF3yQfjInNT60wYuF2CqW9r8uCFYo
 dIbMa+iRcobRTRPnAi4QOHtWxhH8E2OBInpV2hlNnu1XrU5oN753R4R5t2trQ4RLUDWFnxZd9Si
 R/5DpEWIBP7NTvxWA+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

To avoid repeatedly fetching and checking platform data across various
functions, store the struct of_device_id data directly in the i2c
private structure. This change enhances code maintainability and reduces
redundancy.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index b0a18e3d57d9..1c9356e13b97 100644
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
@@ -1215,6 +1213,10 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+static const struct geni_i2c_desc geni_i2c = {
+	.icc_ddr = "qup-memory",
+};
+
 static const struct geni_i2c_desc i2c_master_hub = {
 	.has_core_clk = true,
 	.icc_ddr = NULL,
@@ -1223,7 +1225,7 @@ static const struct geni_i2c_desc i2c_master_hub = {
 };
 
 static const struct of_device_id geni_i2c_dt_match[] = {
-	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };
-- 
2.34.1


