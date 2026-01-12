Return-Path: <linux-i2c+bounces-15037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F175D12002
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 11:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F049E304BC9B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A641D283C87;
	Mon, 12 Jan 2026 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQGJQWTQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNqXn5Oc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1E52673A5
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214875; cv=none; b=S5+6owp8h7j2RWhuroomdWE6iJfpDGYtPL1vjX+lLDOjvDx2DPdkOMr3oH/RlYIEN9fn1U7wfvn+Tf3T6QIiBk19gENT8nqxSHyT6xgsIJLvll/svtBU05oqHEeUR+sTSzQHfMTAcjzaZ5uMWp9NDAMr38pfP0vuQkdiX6Y3Ggs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214875; c=relaxed/simple;
	bh=aNFoPhCzK98jZhwkTUn8Ng4tLog3h9ErdlG5j8XEi8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fw9qtzqT/x/p7L1K1J4uLixZkPdviicyjgK+GuEVXuRhHFQlouzS3DZYkjQOVxHedlnsN1i7AAhgaNf8pCmhqoAD/ltrRq6S4GN4r44iQke94gjnBGpNQ61rMaFCYUuh+KrlnTz0NkDpSv7gU2rlVytbl0IZ4toif6RunBbcj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQGJQWTQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNqXn5Oc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEXNj1315847
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=coMCstee7sz
	aR5m5p6HnyI6xCasetiM+wXF6qx7XZKc=; b=NQGJQWTQBE4KQu8sYmqBwFDbOTW
	lQNUQO6yqBr/YstNhJDU04xkhzgXqgtCnxsJc7TqMsbQiMkwO7PQCTuEPJQ8Vx72
	/4hrCtsg5NNDn3rJRPXA/5TBKHj58rOVEcicSEZDO4X3rb3O3lFadVver2ezwwBO
	0H/PCowSkinrEsVOSAAlAytlqsLk4jDpG7SIMQNMhHBwl6ppoiDBGyQ0jVyKT7lb
	6z7NkhTcg0WPV5CPppKfR4Elgw3k1g99DiITaKqPoJtvt9o6SvdqYHdl2ZqoEN5L
	qJNuONWpdLiztQJgNQFQU0fVaEWnfI0RX+kzBpFC40+bDH4fmmSUf5Bkf4Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg2sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:47:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f42368322so1191864b3a.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214873; x=1768819673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coMCstee7szaR5m5p6HnyI6xCasetiM+wXF6qx7XZKc=;
        b=ZNqXn5Ocapz+i4C8g7Zqt3Aa+9lGnMw4E712hQ+WHZw7u6sH/3b4oW5ZQ8chj4OPHB
         4erZZ631aCOF2689PlzoFi0131+pRQidJ/KPsC3dg8dLW4U+yY3IsmFKzq5dTour2Zya
         TozW/v09NLgmtDh/mKwhkKezejUcYej+dJvi0hnM7tF1iyrY2dAWDlrGrEZ7MrppHHdn
         KmX+dVOr+9Npj9e/1gQQe5BPcJjXjsPW9JYDfZh6FBiJ/ALel4t3Pf6g6DEQ7gM1fgRZ
         XX3HbbuiCvpiaNFKoElQmw+haEEuJHt3jxYmAgcq1J+9wN+BkcrifP0OWcqlunHRx/ZO
         ErfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214873; x=1768819673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coMCstee7szaR5m5p6HnyI6xCasetiM+wXF6qx7XZKc=;
        b=RgdrOu9WjJ1gw7Blai4LEdmgIbRF3MkkQxyeMwnzD/5I6Xyqjeo3diYKBUDU5sQU3X
         xEhxm0/uMm3CfZvTWVVNIGI7suT48JncJj2ul2xh1ES6cLI7X46V0u9tpnMcyt0uppuq
         YCM60b2eN/kkATR0452RdMjEhsJ88mMKJ3itLEF3zpHW9grK4rroizkOyPHCft01rjMq
         wX1T5vWdULjzPDDAMpEYc2cEhgYRO7b2AbpAn8VP6nnrzsg+PsqHTeHr7vBnQk9IkqU7
         o4Ii1Ek9l5gWd2FmoBeTu7jf1NOmgTK48vnfmIzVgXm+xzyJXKIgCxq7LetSn11Mcday
         qujw==
X-Forwarded-Encrypted: i=1; AJvYcCUQhLq5Gzl7V+uMjJMtd6fH06xnJSLUOQ6eYHN8jz700fmyVWvqFhikH3mvcALzhvlwZtPAHBF25cY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnrGrDSDNgMLS0Jp3k4NBC/AGl0VJ3gIVO6ZT4dLEhVkzQxR2E
	Sl+x+8D39knNmrjoSUdG9XLA6kpgPqUxzoZstjBsTa43I/lt+O0VMQ+hcC5IQ39WJbSt1c9Q3UX
	y5uqDVjHuEzTnrF5gM/rWt8uI1lmItQ2lbVzRh72TifY5v/C6/vTFq1HlQt/VTTc=
X-Gm-Gg: AY/fxX53f+Bo5hlLiod0343OGp+iPdhOqvDMyobK5AuU2K+y4s1uzXGTwIodfy5jhct
	ERANQJIeC7CwEuW3l+J4Tbj+zRAVcEYyoIWqttxCcQeBh5Q8OwBklb5F43AklXquEzK/H1CLXSC
	6bsFYwhHKuCsYywwnd9KQ+Z9q+x6byWNwbzAIEgzpdmsnuYSqoXJ8xbJgDSVy3rz66Bem9NcBf7
	oLdsCWqM3k86ZFILQq0/MJ2MyOQej7cThalKFhxLCSApFzqdav57sN5E/4CsccoARWBJhZYG5WW
	LUl1JZnFtBk/Az3ImSIL4h5KzFeNJAojdK23L0ww9cU0gYr1WMkq2rD/S3oOfrlcuu9zaF9wo/i
	UQYn6m3hQGEfyUCJcTyed96J8UX9yBkEK9bnj10lb4Vk=
X-Received: by 2002:a05:6a00:3497:b0:81f:521c:b645 with SMTP id d2e1a72fcca58-81f521d04f4mr3579676b3a.51.1768214872773;
        Mon, 12 Jan 2026 02:47:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiZKUIz5YIpwAv4P7EKAra9UVtYRBVWXXWo6WhNlH8oQGUeKhjGYITgMfF7CTfdabqu4Xo4Q==
X-Received: by 2002:a05:6a00:3497:b0:81f:521c:b645 with SMTP id d2e1a72fcca58-81f521d04f4mr3579657b3a.51.1768214872227;
        Mon, 12 Jan 2026 02:47:52 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:51 -0800 (PST)
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
Subject: [PATCH v3 03/12] soc: qcom: geni-se: Introduce helper API for resource initialization
Date: Mon, 12 Jan 2026 16:17:13 +0530
Message-Id: <20260112104722.591521-4-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: oZ1ynHTpip-j4Q3vkDa13HTGPS4rOdDL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX9uFv3VSPbpAh
 lpX+ENdtY5jqzvjDE/jzfpwgmK02SY4VQbpetgS7gEHZYv9DfH0LEv5MqiHI238NyKSE70kpj3B
 gY+8JpdRv8c+kcHfDl1No+zLpi2YQjwnCWPNR/3s5XuUPVrk19e9zEm9Y6f8mIEQTR78lsqUXeY
 L+bufDR1DbEKpclzM/Ro2Y9Ll11/W6h0ujgA4kLI02aESdvyjIxMgdbhrL2VOtZyzaHAR56krGe
 AdnCsbQcNXwfcm/tLCNfTEEmzzFxeLU9sbQYJW9a6ldlFcGmHdMEtbftZIXRLT5OgVwI8+vuWIS
 ZjU6qqqqLIv58WdorwvGb26h5Mp2Z6Sh4rzMlOdugBgbRkVFR/iNMMYYqsaiZx596XWAxEpDCdb
 OUxmXRbDG92VeDhbhRLnGQDIHl4EYwV6rKBQYfSBQ4A2zc94V3c0+wZIPUPLiY6c/Hr2haMCIek
 CbF5pJmUTaB6xVgIt1g==
X-Proofpoint-ORIG-GUID: oZ1ynHTpip-j4Q3vkDa13HTGPS4rOdDL
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d159 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OYYzyx7XpuDNtx8IVW4A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120085

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently duplicate
code for initializing shared resources such as clocks and interconnect
paths.

Introduce a new helper API, geni_se_resources_init(), to centralize this
initialization logic, improving modularity and simplifying the probe
function.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1 -> v2:
From kernel test robot
- Updated proper return value for devm_pm_opp_set_clkname()
---
 drivers/soc/qcom/qcom-geni-se.c  | 47 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  6 ++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index b0542f836453..75e722cd1a94 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
 /**
@@ -1012,6 +1013,52 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_se_resources_init() - Initialize resources for a GENI SE device.
+ * @se: Pointer to the geni_se structure representing the GENI SE device.
+ *
+ * This function initializes various resources required by the GENI Serial Engine
+ * (SE) device, including clock resources (core and SE clocks), interconnect
+ * paths for communication.
+ * It retrieves optional and mandatory clock resources, adds an OF-based
+ * operating performance point (OPP) table, and sets up interconnect paths
+ * with default bandwidths. The function also sets a flag (`has_opp`) to
+ * indicate whether OPP support is available for the device.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int geni_se_resources_init(struct geni_se *se)
+{
+	int ret;
+
+	se->core_clk = devm_clk_get_optional(se->dev, "core");
+	if (IS_ERR(se->core_clk))
+		return dev_err_probe(se->dev, PTR_ERR(se->core_clk),
+				     "Failed to get optional core clk\n");
+
+	se->clk = devm_clk_get(se->dev, "se");
+	if (IS_ERR(se->clk) && !has_acpi_companion(se->dev))
+		return dev_err_probe(se->dev, PTR_ERR(se->clk),
+				     "Failed to get SE clk\n");
+
+	ret = devm_pm_opp_set_clkname(se->dev, "se");
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_of_add_table(se->dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(se->dev, ret, "Failed to add OPP table\n");
+
+	se->has_opp = (ret == 0);
+
+	ret = geni_icc_get(se, "qup-memory");
+	if (ret)
+		return ret;
+
+	return geni_icc_set_bw_ab(se, GENI_DEFAULT_BW, GENI_DEFAULT_BW, GENI_DEFAULT_BW);
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_init);
+
 /**
  * geni_find_protocol_fw() - Locate and validate SE firmware for a protocol.
  * @dev: Pointer to the device structure.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 980aabea2157..c182dd0f0bde 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -60,18 +60,22 @@ struct geni_icc_path {
  * @dev:		Pointer to the Serial Engine device
  * @wrapper:		Pointer to the parent QUP Wrapper core
  * @clk:		Handle to the core serial engine clock
+ * @core_clk:		Auxiliary clock, which may be required by a protocol
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @has_opp:		Indicates if OPP is supported
  */
 struct geni_se {
 	void __iomem *base;
 	struct device *dev;
 	struct geni_wrapper *wrapper;
 	struct clk *clk;
+	struct clk *core_clk;
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	bool has_opp;
 };
 
 /* Common SE registers */
@@ -535,6 +539,8 @@ int geni_icc_enable(struct geni_se *se);
 
 int geni_icc_disable(struct geni_se *se);
 
+int geni_se_resources_init(struct geni_se *se);
+
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


