Return-Path: <linux-i2c+bounces-14219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A229C7C753
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C2CC235AA16
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE382C0265;
	Sat, 22 Nov 2025 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYysS++j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCVEn1Xx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DEE2BEFFA
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787658; cv=none; b=pdKz9cLPEnbQLOVdAYzSEsDptYQv/aPZt/9St45w4lkMmwqZY79d05bFwVcltG/4L29rS5n+7vIDzkVnf+7iUxEdPcOHt4A0cJOXNsO0l+Ze5GcfDao7PAuZdyja0t35PJ8013Zy2rG6+yhQ1sflKuSNkclW/HSiwoVgHmXwAz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787658; c=relaxed/simple;
	bh=/V2HiqHRTagdoM/UG+lUbNaX0k+Kw6ZShhne0ecUo/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KgVEprQyRgKSwOLpohwx7O5Zua0ZQ3x+hB9Ocd0/9h9aExlfyzEYpKruUAlmTZA4m4RdEfLVOD+UXqaPBJDYyxh4i1hQz9EWYqTb9BSGv+rk2pfZyBHtOBvjBy27BConR4L2ZjBY9tM8V9A3yL9SNoZo62x7ps3REJtDt4lzEIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYysS++j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCVEn1Xx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4ma661950385
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FCrpcuk9fFr
	tiN7BZFbGUYQ63JJ5c9epSjjdaq9PEb4=; b=oYysS++j0bk7K2K5hIA9IjGOTSq
	a7YlowAkzWuyggeUCpzznU4IOUsei7p9apBriBLxNNEhPD4r+2ak6gXleM027Mwj
	cnLk2XTlnaQprq77FfFRlSsPaF+LI8/mglFxBR3a2vx74TuJ9cyUVacpvKA9y4ie
	T3lhTF9PGhx4Xt4WH3vIl/zO0AEuXhBmmimyp48iBvsxKP4jZkYbsLpBhfWx3stX
	u34RDGka3ksv8kWXTrLk4Jg/JclreMk/FDnK6XfCWrUU4AC+88zY8GxECVxymbJn
	zN3fmrKnKci/SLzlk9BULriyPLUUeQmoBKaKyXG5PjXJGEvNmDTx1OP9PMg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ff80ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295915934bfso44216075ad.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787654; x=1764392454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCrpcuk9fFrtiN7BZFbGUYQ63JJ5c9epSjjdaq9PEb4=;
        b=DCVEn1Xx3j1Mo4zPAvuBkgu/MoYfazBKg70X1SGTOwLj1v7XimsUevpf/5OesL49XQ
         epyX66KY7xT/Zkeguw7Q2upCagAX3NmAmQA8n5F0rU8AJa43akwBcoPJx1wMJDP965Ji
         7KaYExM6wj3WYjBdbmyOWtDvzwAIEVQ6nmXuvPpS+3y1TG/lr2U2Fivtmyso03ru8LzC
         CKSaFk17/LEPDz3m/HhscGZhjw9TqAAoLvYvE7T4I/KFpAhgqH5NOWii12Czg8oxWm/D
         Etzfhdu+LdrzQYMzgVx1O9DpftmnD+bhmg6ZO+QeXEzbG0AtRcskNjJchxbtL8NybUYt
         ZrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787654; x=1764392454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FCrpcuk9fFrtiN7BZFbGUYQ63JJ5c9epSjjdaq9PEb4=;
        b=ALigN4T3I4mWn/sZ4G5vTMKJKl6DHJ/uhHo6r28z4Z9D8cjFBJ+9t33EhBLeWg5OSi
         uhwpHyFGbo2u1MtLg5tz4nhqArx/Ck7QA6s59pSENENI3j0yhECKhZDqYJpG3UlLPeIJ
         BBOrZq8/Iv+NsRnVckoK1nrrY+D8NoWtmdpRNVbTowT7AgrjwCrjcU4gChVEC0Bs7W6L
         vsMU13G3oj+xR8SW+fQorW+ADTrD+DIr1Hz6AhSmdi+n8S2n6Oj1F4sQQhf7Zsv8ZQ+p
         siYcEyTF9NaJQMrCD5p5jr6PhTiXjCDyOzn973pK3pTwi8FkuHUWYEtulQEWcR0FOQh5
         MCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM3tTh5MQTdwzCNMKgujQBTfZkYtFj/U7UBZRWCfI4EbLDrxMPH8klbF/yXt1eomvQLzS09lNx9jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxfXkATGTBWicNBXIRHqb5IfFkmA9y0l6bTmLrCbDcbFt7Z8Iq
	K1HLzxAtFsDlFM0RdoTRxh/Rbz2JWgtxrFLegl6LilV7gCuYEpvvCJjfwPswvzerfpDTZA/iQZL
	lGARacbMKdYe+7E6YYCACddBqUUh0enFZuK4wjymXslJESlxo7nu+UdznjVz3+xI=
X-Gm-Gg: ASbGncv3s9k/18pRlcx+CctE8pbob/W2oECjxZ5MdMBroSQFguFqK6RdD1tOtESXAMc
	ZSGs8PdI5EwR6f6a30UW2iJ7CpoC2vLe/Fg8l46JaP27++xyOsmoEcqS9kWD3F4CNTbXrzAez9K
	KcXdvrpfWZSght2afUpK0kNpEl9nA1SnO+x9b+kwCST4s3qEPpUCurwzq051N5wIIlwxQyXMneJ
	dbbr+aKYh3j9DLPyTXxG7ugk0nU3OE3hjD8BD6jyR9zMji7fmIAxsreo5O1e7e0D6KqOFFYOzxI
	Q47KNmn6gRpmyuxFJIhHGGSTkZnIrypEnERshhlLg8HeYgnexhJhZ5Hsi+5NhpqWbc8+b/hWbQl
	eiGqirbymy5f/mZhCOzXFFS4yjPbkci8D/Q65+JaUcgY=
X-Received: by 2002:a17:903:2b0f:b0:297:e66a:2065 with SMTP id d9443c01a7336-29b6c6d0d46mr60059315ad.56.1763787653768;
        Fri, 21 Nov 2025 21:00:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/mNuFf6gCC+7MmuWo7dXP/0lbXv246+Po5thoKfHT0jW8uzLQuLrJkW6FdiLXiKFa4MyLJA==
X-Received: by 2002:a17:903:2b0f:b0:297:e66a:2065 with SMTP id d9443c01a7336-29b6c6d0d46mr60058835ad.56.1763787653171;
        Fri, 21 Nov 2025 21:00:53 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:00:52 -0800 (PST)
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
Subject: [PATCH v1 03/12] soc: qcom: geni-se: Introduce helper API for resource initialization
Date: Sat, 22 Nov 2025 10:30:09 +0530
Message-Id: <20251122050018.283669-4-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: vbZmtNWAqll_IGOum9m5mAYSsdkQLTXW
X-Proofpoint-ORIG-GUID: vbZmtNWAqll_IGOum9m5mAYSsdkQLTXW
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=69214386 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LzVv7VdzltUCoGm_cYIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX71KXVAXcjW2h
 RHCafwSP0T72Ujzm1r2uvdbwL8cilWNOB7bfVOD6/HtQJlmSzep3Ck7a9WKbC6PG+M7oYUY2knE
 Z9fisZ9mJKPFS4gSNlFvRx4QeaqBhbvBwFqsFqme1q4TddwrxY2kuoynVYi8uXZuJi9qW6izapF
 fH8sDW8CdVNU8UN6CoffHALtqwKMJBHmfbQBhUTVLj14e7nK8fR5rwPO+lAR5KGPqqYmcfg6tme
 F7gxmWVq53QuZPQfUUVXGBnMAiEJtd/YLLK0h5D6ri88nC5hsNyhelBeyu1otJZuOGigkF10fy1
 6pTR96Rk05Djff5PpMc4WXnQ9wgO9wm1o/iaKihiyDx1YKdbYbZmOCRapFM5zUdu2EViAHoo2/b
 /uPNMwlgLHAj6jW8fza7N3O9lmYlKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently duplicate
code for initializing shared resources such as clocks and interconnect
paths.

Introduce a new helper API, geni_se_resources_init(), to centralize this
initialization logic, improving modularity and simplifying the probe
function.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 47 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  6 ++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index b0542f836453..726b77650007 100644
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
+		return ERR_PTR(ret);
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


