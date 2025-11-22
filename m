Return-Path: <linux-i2c+bounces-14222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3BC7C768
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 54F094E2569
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4B52BEC57;
	Sat, 22 Nov 2025 05:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDuI3xSo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/lvXTeb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB562C0F7C
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787677; cv=none; b=rXDXF0DL9MnWLK7pZsFKXYpsgzV8NABQSRo+audS0SbOOiDjAbv/6R4Oel5lXapZFHbHcycQ5bdFyA1i1OcU7pCj1sbNeegSJBLCYXkDDRTZzn/MmRmN6ZDuDeIYfJjsqHhx0USIqYUQ7caeXx0E5C+ELvcAhxTJYVWZOoTUGOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787677; c=relaxed/simple;
	bh=sK6XaW/k9ZaxCDlbgWVWFCP1NGxYDP2lPv4LzeW4fDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DcGyTBKAwKN2K+5H4JAWBmVN7FebbHuNuPPFTMu8L+02ewiTKepKRuZuFCL7zpvFMWniqN6gZ2bqyEHKJqr4+1GYXHOV3zTMB2PkDBpLCfX3n4SXSHKg4Fk39VZM1J4z+NhYkDvHPm5iWK0ugT930rBhKTC8m1F1Yrj1pnro88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDuI3xSo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/lvXTeb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4dcD61090874
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zTkqjG69O6X
	OIlKcqlqk2XhnP8nX431WPafAy0gUQM4=; b=eDuI3xSo69u574bnJ8T13iUAIQF
	wHEK3sFXBZM45YEbZBOjLfm7nAb+D4TXHWWC4Qg0wudcspY6J1Chg5kN2t5KddVI
	YCLlvPKSww1rkzCo4MchqaQH3KmdMBxXEjq6+L5U8iLjXKcTlnzfzf40AO+CM4Er
	zSElcBdDcU6oSAIt58AZEJJAJ75lhU1dsvJ8y/m6spkWoHM2+YjCQm6LHhp4vPbl
	c+cn18bGWmtZXCWUoOpBaUulvrYWZg0n3nQxBifOaouOs2V+FlybMY3n4V47DJ2+
	fjU+8+NKRGN1KCsd/mc+36/sIL5Trh5kiiBziynGb0I+dC4xOLSNOsjTAcg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6bgr11d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295915934bfso44218765ad.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787674; x=1764392474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTkqjG69O6XOIlKcqlqk2XhnP8nX431WPafAy0gUQM4=;
        b=a/lvXTebe/cE7i/3Y+fKjKx1H8RMGL+giy7b2nTq5s///iWIvU+6f1kHL+H+BvNSxX
         aZw5rzfo13COkYzGq9qzHZ3iYn2WPyVEdEIKmqAxlBikFzGz8Xn+kakNPwi8XMN3E4AT
         vJrhNbee5/XUimafZmDWpfSHAk6PM9/Rn+jY55HJimQhItn3PhA1+N/fDJXJKtneu8M0
         RPsQ9ZNU7CngPSAlw53FveXYHp1o1Z65N3kS79JKyaDNwLYw1CyW12escetdN4EK1kBf
         DYBsaru09QEJn0ccOKF0i+HfM/BYOyN/87vbWIcztrb9NmkXVVLmt3oUMfIvQ3kBN7td
         yCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787674; x=1764392474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zTkqjG69O6XOIlKcqlqk2XhnP8nX431WPafAy0gUQM4=;
        b=bIpjVyMnMym8+VF24ePSWku600rxMO0adXA7LrMtzVW27fmVP+E6hCC8jP79ZHbOdy
         wrQgUiTkSkOw4vKJQfcoPLPe0Auq8tvcKAu7ty0K4+cgcMnccWdIxOCnPhcp3L/YUnnZ
         VdzLfKFan4idXbxSVmrcPfv60NXana1ASS7NeNr7MEeV/A8rS36fdvN17HwGpyAPodbc
         BYPc++O6RqycuTCup69Nv4bx04zmDqUk7NSJOmlQJirOumudslo+FPAm+rRsnCEoHlDj
         5z+VDPEAGB6jWFZPS7LHgu9eOmavTiN2jwdxwG4DJBVdcxueXeMNZ7GAUMF+d1Bhn42e
         Wc3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXYze++lvbk8yU61JTczNO0x2fdEvta1ei9QAH4nFzeWJBodzViNnb0JwGqEcrIXXdQBhefnnIiHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0QI4r3CEvznWII7Rho5JNWxTe0aA+vdiGDbLwASDkTgw5mJ9z
	p44qodBNMlIftfyXUaZqNx5ipp4P8uThIBb/OrLF8CH3KEjCb40YGf+7saSm17KGE9CdsLGjA0+
	qHoUvFP1bwHO+87jaxtfB+vbgh2MWGcInQd66O7oT2ztuWq8DvgA5jxmuCkVz95c=
X-Gm-Gg: ASbGncu76u8tBf0c+Ytdr+UtzpeQMURwI83DKDhILAh1A17SR3EJdwBqaJownOcvrNp
	ygPyh7xRMoUUsNPu5ROJUuEjrM2HX+A0SugeESo2ermGBxQAdE0JcQ/KRLBAcVBSJO0/n1RetpP
	X7mWxf56YqYdVg5ZUfpsC179elcDB+CTDM0hAkUIz6Wg87rZqqXheamejibB/6BavtTPAgR5dbo
	7fxB2o/U/X+2Uun0nli+0m89wUFRtEeKBJGL6bLJmTj80BSyebjW3xI4S63naknzsdiSxhDALRA
	3JaqTXUEiFizxOfjYvtXInXvfJ5N0uN4EWuytZzFVhyhXI5+zi6Fy+h0BIHxDq9x57IRh9Ru63d
	RC+eoVGDpyZ6GmfLt1vZVfrlgO3nT0vEzYrRuBE8TyfU=
X-Received: by 2002:a17:902:f706:b0:297:c889:ba37 with SMTP id d9443c01a7336-29b6c6a4a1fmr53069885ad.41.1763787673443;
        Fri, 21 Nov 2025 21:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ0RoRjWzpRX7f/7wrrm6o9a/zKalm16NuLlRAP24ZnpVfbAe1bUNnw6cUjpQSbL2g3JKMGg==
X-Received: by 2002:a17:902:f706:b0:297:c889:ba37 with SMTP id d9443c01a7336-29b6c6a4a1fmr53069485ad.41.1763787672866;
        Fri, 21 Nov 2025 21:01:12 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:12 -0800 (PST)
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
Subject: [PATCH v1 06/12] soc: qcom: geni-se: Introduce helper APIs for performance control
Date: Sat, 22 Nov 2025 10:30:12 +0530
Message-Id: <20251122050018.283669-7-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: flB7GCWSmu7WiMXLQCk3wxj3lCVnky1A
X-Authority-Analysis: v=2.4 cv=MtJfKmae c=1 sm=1 tr=0 ts=6921439a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NwCh5GMA9Nt760FYQHkA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: flB7GCWSmu7WiMXLQCk3wxj3lCVnky1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX3vMveW02qr0f
 IKoCNl1Z8x0Pj8e4dvA/j6AXx6m6wPerBxZ9t9+7cXK5s8rXU8tRxx8BkLVqpnrU63ytDpfIyne
 ttcVkUH32zt9lTbaJ0t6NUavIdp08NXFlBnfx+w9QR9u2U9qAesVgVDuFaOvM7yK6yklOur1yy9
 STeEvOWFUspHh5696hVGMJXrqKXUzIE2tmfvtcr9oskp8E9ELjBDdgHhRhKJ3/OCQo63214/lg9
 kLeba5EfqOX4SmyNuGtVzwnxc3igHhvAHuJJIhiVJlEH1aZpbjmmSc6+M0OT1RJQ6JhQ4tmT5hR
 JZdQEdVKBLYhZGRS+938+e8oEhm8MTg9ize+L39YHTprQ2SNCaW35OFc1lICHtSyfwLbONPcXFh
 8ft2+Lvs5ani7Cu1+GwftiElgOlvbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
manage performance levels and operating points directly. This resulting
in code duplication across drivers. such as configuring a specific level
or find and apply an OPP based on a clock frequency.

Introduce two new helper APIs, geni_se_set_perf_level() and
geni_se_set_perf_opp(), addresses this issue by providing a streamlined
method for the GENI Serial Engine (SE) drivers to find and set the OPP
based on the desired performance level, thereby eliminating redundancy.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 50 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 +++
 2 files changed, 54 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 30b58f2f2e5d..292afa18b86c 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -282,6 +282,12 @@ struct se_fw_hdr {
 #define geni_setbits32(_addr, _v) writel(readl(_addr) |  (_v), _addr)
 #define geni_clrbits32(_addr, _v) writel(readl(_addr) & ~(_v), _addr)
 
+enum domain_idx {
+	DOMAIN_IDX_POWER,
+	DOMAIN_IDX_PERF,
+	DOMAIN_IDX_MAX
+};
+
 /**
  * geni_se_get_qup_hw_version() - Read the QUP wrapper Hardware version
  * @se:	Pointer to the corresponding serial engine.
@@ -1075,6 +1081,50 @@ int geni_se_resources_state(struct geni_se *se, bool power_on)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_state);
 
+/**
+ * geni_se_set_perf_level() - Set performance level for GENI SE.
+ * @se: Pointer to the struct geni_se instance.
+ * @level: The desired performance level.
+ *
+ * Sets the performance level by directly calling dev_pm_opp_set_level
+ * on the performance device associated with the SE.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
+{
+	return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
+}
+EXPORT_SYMBOL_GPL(geni_se_set_perf_level);
+
+/**
+ * geni_se_set_perf_opp() - Set performance OPP for GENI SE by frequency.
+ * @se: Pointer to the struct geni_se instance.
+ * @clk_freq: The requested clock frequency.
+ *
+ * Finds the nearest operating performance point (OPP) for the given
+ * clock frequency and applies it to the SE's performance device.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
+{
+	struct device *perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+	struct dev_pm_opp *opp;
+	int ret;
+
+	opp = dev_pm_opp_find_freq_floor(perf_dev, &clk_freq);
+	if (IS_ERR(opp)) {
+		dev_err(se->dev, "failed to find opp for freq %lu\n", clk_freq);
+		return PTR_ERR(opp);
+	}
+
+	ret = dev_pm_opp_set_opp(perf_dev, opp);
+	dev_pm_opp_put(opp);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
+
 /**
  * geni_se_domain_attach() - Attach power domains to a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 8c9b847aaf20..cac999d6ca31 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -548,5 +548,9 @@ int geni_se_resources_state(struct geni_se *se, bool power_on);
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 
 int geni_se_domain_attach(struct geni_se *se);
+
+int geni_se_set_perf_level(struct geni_se *se, unsigned long level);
+
+int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq);
 #endif
 #endif
-- 
2.34.1


