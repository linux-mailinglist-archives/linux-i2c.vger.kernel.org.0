Return-Path: <linux-i2c+bounces-14221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE85C7C77A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0BC13A7A93
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FF72C0F70;
	Sat, 22 Nov 2025 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc1CfRTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZn5GU2i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D12C0F76
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787671; cv=none; b=eXqJjGLo2KQH8srnMUSGUiYdCn3IfWHhYCL44nLtvpvvgwvZEHIAxEJ6H4x2HYLBRurMilvic2dlZOCbeTFMQbQc30OJAJkgjaUAi0T8h8POnKYGquOV9ijo3agp37XS0asZ6kgmlE3kYNVX3zDL+ojc14tz6Pj0TyeRBBeKfV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787671; c=relaxed/simple;
	bh=5FymjPfvlgC+qNA+t/Omj53maDcsKpdv2H50iHJArm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=itwtDsGHqRyyW3TnxmLbZHFdEw/0Vy6ixQ4Gpmel55BGaTqe1Lr+1PkKqlly8nQ3QjLdtR1T6pDsnPq/EOUx4bRVsSQHU9ojR6fDx8WBbGa3w+LHlBI2rf5jYvIrtSadSqlobEHTovKInBBDyS0TzPAEUNK+pIAMJeKCdCqEVLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc1CfRTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZn5GU2i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4fV1t1733990
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=caicS9Fdeoo
	pePrrAT2bbtFvVaxE0HhhLndEP+/8Hlo=; b=hc1CfRTdHPe5JLU+lSidJkTIuDD
	I+gUAKj0rm8M3J0qQjx2SmqkkZbYVrg59sz6b/oSs4yEvUklNaCAN1Iw+HwAAk61
	M9kXR8btSdy4fe/ZAzMTdyaqUAJ4K3ZCqeNq9UjSXbWkPCE7HhaRMggQgVp4o4Pf
	d5fKQz81XagmEG2yg1Zgs7FhBEYAeSqk0rVlO3jJi+O/VGW5v3GYICjDHmzdJTB1
	THNBMOIbIACLu9wvOiNHoCdTJmWJsgHSCDQAYwIUeIEjs6gFLZOmPIeBJhkyAgug
	A8HTMHZco5QbkKV84r8VMXu2a7TkNAKs/7ST7AOoS2ubfuFQ2BEvSQXZUdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdr0xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299ddb0269eso37385925ad.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787667; x=1764392467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caicS9FdeoopePrrAT2bbtFvVaxE0HhhLndEP+/8Hlo=;
        b=bZn5GU2iWTDJ9i8wDo2SQT4eNR0rlad024W0X83MepibPGdzYwzk8XTs9OhPh18iG5
         Eu5cdrDoQyerbkRP28VOtOQG40ykuXw7JRDNOcLhMPCvgfjtTwzreDzMMMwRkHoYgLa3
         uhR7VrmiKB8KHkKRnOcpEB/Lqyg+4o/ApdEbzK8tVHm1JKOr2Hr66ITjpL/SKhHVbZB/
         trdYF4ZF2rvkw4FDYl3ZUsEiROAgUSuWi2ER17YeXuvO01M1IR4xcIMy6FNL7B0wJk+u
         xnQHV9ASFeu0OZnH7UqWznlKHr5oi++sIuTh/Ml1aCwp/aVT4Ith6eGp3ZTgJqdfPKy7
         xmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787667; x=1764392467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=caicS9FdeoopePrrAT2bbtFvVaxE0HhhLndEP+/8Hlo=;
        b=HaJBOwYLqUkOiWJQE4p5WsTobIm4suQa2aYqGaQwkCZMborXHyM/qsT47QnaSvJyed
         2+ZMxzjW5bnoGoxx450e1HFPXr8kCbdWS1hPmAlmrmAbeNVm9C3yfjfJGUNKHHOKfXLh
         877CbK8Vhz2xvdKR/bAaI4k9ZbPYrUPXDjhnXEe/94MiDM9RiPRryZDf5Q4RzyeBay+n
         EPcYgYvYQAqjThNBBLttpXj2ooYEMs2wIvxQSgi+N8nouLIDJ6uUZeUddOLw+U7R8Akc
         ZHMpAL2dMdRVK5t6etcWOABSb2tcvKFxEuj0BYeyy4eHMwZG128iIJ9K3t98Oa9yKneQ
         bbsg==
X-Forwarded-Encrypted: i=1; AJvYcCVld7fHQiq4uszxgPPPodRe7WnAFx8D/Wj/rmWB23BoVCwDxV9a98JPU3YpPY4eZOWtOmGo6WOdLsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZTBT9Vu/MACp3dEN8huHpYM0DLBAUPxSvdYknIAFc/s5UoHBw
	4sCWiTJUBBqYjUEoAp933D6OcrMNSjzV2vUNhAH4WD1LhH00nevbFm/Xh8i73g2q8yUUEqM52vx
	k44RZc7ULON91BjhXtC1K09HvgcioKcJ2hVzkuhfPhkp3+iayYValXUtQTBWLFeo=
X-Gm-Gg: ASbGncuHTbQ2XL/xQvIqidJNnhexg/JjVKsj3wgwD5J60XS6g87Zt7N+iDn52UGJmvJ
	tD6MrOhkDlzPMwJv1j1Hj8QAcl0Z2IvPWEF8UCTq6xSCKCKbPynbANXPC+iWrFdL5IQfms1pjgG
	XS6SyIcAxZjgiYSuBHQFuKGvLbkB+64QF6a5QOmVzyByDu4xTbjbtGSC8sbARPYajnkZ9mezWLM
	vpmhITWFtwjrD4xz9oS82JOETsYmBzZ1ogEFx7CsIDJtUDOkhhQmVaEucFLA2EAAbSdf57Ll28z
	HvpzL18O7CqlYOizu4qqnV8+DWD1W1+CPHcY/7Qmyu5PkMkIwSmsdRqEJPIolvrex1q24ZLx1vC
	IRBmqHZ5PE3qs5yzEal38G1uU02B8UIvntzDPMgw510I=
X-Received: by 2002:a17:902:ce0c:b0:298:33c9:eda1 with SMTP id d9443c01a7336-29b6bf65137mr56078085ad.43.1763787666733;
        Fri, 21 Nov 2025 21:01:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj6JCjZt8nVOBBiOy+gR454eyBDzt5Ff3v0Xzoc343F1gSDY+4aAHMdKCxPgSNrEMmfXXj8g==
X-Received: by 2002:a17:902:ce0c:b0:298:33c9:eda1 with SMTP id d9443c01a7336-29b6bf65137mr56077555ad.43.1763787666132;
        Fri, 21 Nov 2025 21:01:06 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:05 -0800 (PST)
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
Subject: [PATCH v1 05/12] soc: qcom: geni-se: Introduce helper API for attaching power domains
Date: Sat, 22 Nov 2025 10:30:11 +0530
Message-Id: <20251122050018.283669-6-praveen.talari@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=69214394 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dV-XI41DVKgoCQLr4ZQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mSdroxSjj8L85g1axNf0Qqs_Z6aMn5EJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX7Uagz0ORUNzb
 87ch1v6g9ZcyvRg2mefeI/3hClEyyOAqMF28bjT0N/6p/TO3IV9QsnhamViGwOfc61bBLrQwQzc
 WzM2mag+h0PM773lURUoKESfJCAFextCWLatK1uvj+QdqiCqBwQYgpMI5t7h+eIGT89XRsAwyci
 5NInWeOseSGVn4jj9TyCgpL3arJZkPM1xYWBPprTUC235ZNpcu7PUmTnkOCpP5Jbi75RKz5zLM1
 JHJpz/SqKYF7o5757uGqaXuK0kEjci+Sy9EWLPFHgHEdp0XjQmRI8N4jiu0c78hAs2sqMkPiGNG
 TyqF9nIZaURyjUtNR9VH1qy+lw+fOpNfbOs8IdWLdg8qbP3TrwnmdeR4zwOQlcEmB+oBRuYii+J
 BbeBAo4VWyiiv+wtj9r6+yQlBXk3aw==
X-Proofpoint-GUID: mSdroxSjj8L85g1axNf0Qqs_Z6aMn5EJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1011 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
the attachment of power domains. This often leads to duplicated code
logic across different driver probe functions.

Introduce a new helper API, geni_se_domain_attach(), to centralize
the logic for attaching "power" and "perf" domains to the GENI SE
device.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 29 +++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 7aee7fd2e240..30b58f2f2e5d 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
@@ -1074,6 +1075,34 @@ int geni_se_resources_state(struct geni_se *se, bool power_on)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_state);
 
+/**
+ * geni_se_domain_attach() - Attach power domains to a GENI SE device.
+ * @se: Pointer to the geni_se structure representing the GENI SE device.
+ *
+ * This function attaches the necessary power domains ("power" and "perf")
+ * to the GENI Serial Engine device. It initializes `se->pd_list` with the
+ * attached domains.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_domain_attach(struct geni_se *se)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char*[]) { "power", "perf" },
+		.num_pd_names = 2,
+	};
+	int ret;
+
+	ret = dev_pm_domain_attach_list(se->dev,
+					&pd_data, &se->pd_list);
+	if (ret <= 0)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(geni_se_domain_attach);
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index d1ca13a4e54c..8c9b847aaf20 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -64,6 +64,7 @@ struct geni_icc_path {
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @pd_list:		Power domain list for managing power domains
  * @has_opp:		Indicates if OPP is supported
  */
 struct geni_se {
@@ -75,6 +76,7 @@ struct geni_se {
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	struct dev_pm_domain_list *pd_list;
 	bool has_opp;
 };
 
@@ -544,5 +546,7 @@ int geni_se_resources_init(struct geni_se *se);
 int geni_se_resources_state(struct geni_se *se, bool power_on);
 
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
+
+int geni_se_domain_attach(struct geni_se *se);
 #endif
 #endif
-- 
2.34.1


