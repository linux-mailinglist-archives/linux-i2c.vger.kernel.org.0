Return-Path: <linux-i2c+bounces-14821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B30CE5EB8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 05:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7BD93000B4B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 04:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6839E253B42;
	Mon, 29 Dec 2025 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8WsmCbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJQJQdmE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013D246BD5
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984137; cv=none; b=Ac5aZ+cxap7Ow83u3vM9Kliea5udn74kBWaD9kYHpGMllKP2qemZDOWd+o1AIdwnZdPGslxTL4eB8odlYEx5D3IxM1uyesp4iJOsUpAfSP+DitkeG49UtLBGx/iQBXUbZ3ub1oEpVpw9T3yiaoeemUYqMSlcsG93TUEDdFF7d9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984137; c=relaxed/simple;
	bh=EGBrdo8xfCGWQxoXF51GtE4cCGhklXb6jAd/dFEN7Cs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BfjHYqKBXGHi+COmezYU5A2I1h3+++cvi6rrOgRvdWWTWtqir4mYIgaPMYs1yGkOOLO7agioZzkqh9Q8+QpCZT36y1XxbU4EfNpId8ZI++1HqOCwGToFxKvVwY832vMiR2NUMwhUIJrhUWO4XoQXj2a95dIeHZWqtvLVaFC/kbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8WsmCbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJQJQdmE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSLoajW1243307
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nydlZRXh2Gc
	bUBdbnw+kHfcLVpk8WHSQUJ49LzRaQSI=; b=W8WsmCbbl61BfxI/H++bWohOEgK
	EoRNhTCYgDN5FLclykCGpPL6IsVQaIEFiMPRLHmZvregWO6scuwTKk+7y1/E76ZK
	vOq9vbxNJOZ3PBVYqfnsYifdy4Y6m9wh9/oQsVHVK4YocokhK6dp7uU9R2f+8rIe
	2Y05ewdLJti7dRg2uv0DVz0lcPXQrJMq0AmoYBZsRiW3i2lj1h0racvuu16f0wkS
	Wk9gqEfyOXsCHsvNHZtiVXgk/IfPeggO/IgZCKq5hdClErkWHeAZF+q8ZHv1cCwf
	LbOkz6kgx4JJKCuUxL8d/dZ17Oh/rrd5Gf8+hPEm9+nyGfus6jKJ72HkDQA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj1td5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7f21951c317so7230856b3a.2
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 20:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984134; x=1767588934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nydlZRXh2GcbUBdbnw+kHfcLVpk8WHSQUJ49LzRaQSI=;
        b=KJQJQdmEyyaEEEaxw+ELz2kzodW+Rv7g8+jEnTO8xM5xqNZXeB8d2x8HhINCZQYJL7
         cvVIYQQrbMZnuocHFepAukamkiAUsdlxr7ZVLLnPkIt+cvoEVBTe00V5GD2gcvJGQWDk
         USYrYvdGDoF22OVnHYfRzVndvOXkPHnCuZYqJErREyGt/IoWv7D++ZKcp7hYiFy8WegQ
         gp/YlRrB0vLLdwijKvcYyN4fq4d5isR5LGASnu+nIlmWgkJ0J+sMlQtLDDpn0aSxcYbi
         l67oF+pI/aGOGjmdnyFswAAqDgCeaStDIOFE1KY5D/rIoP/jmJl0m2d/mgxLd9cPiUZx
         k78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984134; x=1767588934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nydlZRXh2GcbUBdbnw+kHfcLVpk8WHSQUJ49LzRaQSI=;
        b=ab4KNNAplbK3npypYevjQQF6mIbjSs7uyhGGqIUNEesIU1qa6LH8oX2vzaL3PVnfXF
         jcEpeD1/IBIwXlKBICsXCpe3CtGDFbI4i4KfaubH+AgvcMV/T9/arQQ/STsOrNhFmhFR
         7y66UbiN19ZqUMSowtC5NSn7atohwZMvyCHRlHIAN3KscRY+zu4cNC03h/jKZueTVDtP
         yiXz6Fwn9CgN6Bcg6aYgw9ISa/WofLwEl/EEu0nOqfMuDMHG4DfWxDgS1CAliaV+c7zZ
         MpuaobRgfTMmxNfCnqidRSY0JgBkoKLJSSxPwI7g2SiilO96r2u5oYUp/Ivtv/HE710D
         Ix+w==
X-Forwarded-Encrypted: i=1; AJvYcCWNMSIfYqLK8xIPL7gMQfXlWUg9vTwDPif07esOGm6Jeam/MGMpsH0LaZ0AK43UOPXX2ZUCPliNM18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy7ZOrjwxAsD0hA0YTQ+fWpsZDA516101Qk/5WC8Buf+CCHQ9H
	rTNgcgs55b5Y2N9BhQP23KrZmG2LB9RDNbZpELSuL6/Mt4E6kQRyimyRruFsKwHCGcZi2A6ikkA
	0oFi+FOiOMXcSVX6q1R47HeLIUrLhQv2h4naUNS1TkH+dc7mAfbUvsiGh0t0vJxo=
X-Gm-Gg: AY/fxX4UqnRldRUrshbcdChCLoiRDPcf6x3PFtug+C/cn8z5H3BA1T8OGAwlub3Za9i
	0RGPTl9Wou2GDVn/HnF/E81hJN49GnhR3JSZzeeJj5v6+S+6mysh09vllfBIalpU4mTqSLzEBxR
	VqYhpr4UDOcaV9KIFSTL/a1FglG8ZstXsyS8hPVMK5dXHCsSr6s21uADP0Pxg5xXeLuAtAwCA76
	83CncBcwrbXpMUpbkr52V4oBOWs4qyh++7mFE5llBwXsrXviTnDjxjFtdwWzIhZ9ugi7ZkDHslQ
	VTRIWvOQpRkKlR3uCk/Izmg7u0JufvdaSMHxqjvisUSlGD8QO/gwyniCZovKnjus1v22ReCXGt5
	GUlDoyKXztAQ1Rs46wsfa/u5NuxIAVkhn0+XXExPzPBI=
X-Received: by 2002:a05:6a00:6087:b0:7e8:4471:8d4 with SMTP id d2e1a72fcca58-7ff66872056mr27510892b3a.53.1766984133718;
        Sun, 28 Dec 2025 20:55:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZxmwTAmUviEZ56U5D4TninHmYRGSu8zH8cpwfduJno8fotS1CNw8R/ycrKIDtiC/oLzPK1w==
X-Received: by 2002:a05:6a00:6087:b0:7e8:4471:8d4 with SMTP id d2e1a72fcca58-7ff66872056mr27510869b3a.53.1766984133160;
        Sun, 28 Dec 2025 20:55:33 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:55:32 -0800 (PST)
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
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v2 05/12] soc: qcom: geni-se: Introduce helper API for attaching power domains
Date: Mon, 29 Dec 2025 10:24:39 +0530
Message-Id: <20251229045446.3227667-6-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wXqSwhvn27zjZxJbGrccF3w1B_Lqv5Oe
X-Proofpoint-GUID: wXqSwhvn27zjZxJbGrccF3w1B_Lqv5Oe
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=695209c6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZDeCJnArDvxsiKwEaIQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfXxCB5Ut+p4iNU
 CO10FhRJkiQd4tEtkFwsoYiaKANBjCbNvOQacVIQSrpaT40aQGQkOPc9MGWfDrWrdN50q2WcdE1
 wWWYdG1oyYeZdBOq71kNo5UwPKBipY5T+Wh4PGG144HDrzq3DDluBytMP1bdf9oFMeld3cLw53D
 Z7v5FN8+jA9ApK8piOzjyb2rw3L3otCXBj9E0qTr2Z2FRrhVFmnkjvBEu/Pzp3uLj0Y+xyDIqLk
 b3fv8lkbngkPBKG9nXTTKDAjN0pj96aoy3WIUAjTZeyBCTMgL6zMxtjlVbjcXbXyDJLaD+14rDg
 uYaTR5Rfe4Fqk+13RLb1r6WOVstHOanTRIJU2YFloLqh8SZiRA8r0Wp4BR498i6FML6j7dP2XC9
 qlBHSXiVo7WiLxhYsRWee9tOT10HbUDCLHk9AXcijG7aOCIbSeTWyWkXB6hY66YBbNKrr5fyn+D
 YcCNo4z5P4TgEC1r0iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

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
index fbffbc9ea7a6..decf7cf5172e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
@@ -1090,6 +1091,34 @@ int geni_se_resources_activate(struct geni_se *se)
 	return ret;
 }
 
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
index 36a68149345c..5f75159c5531 100644
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
 
@@ -546,5 +548,7 @@ int geni_se_resources_activate(struct geni_se *se);
 int geni_se_resources_deactivate(struct geni_se *se);
 
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
+
+int geni_se_domain_attach(struct geni_se *se);
 #endif
 #endif
-- 
2.34.1


