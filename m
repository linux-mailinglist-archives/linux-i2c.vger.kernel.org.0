Return-Path: <linux-i2c+bounces-14226-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B1C7C79E
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E28135A99C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7BB2D23B8;
	Sat, 22 Nov 2025 05:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuwjSvey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEpuEePf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F762D238C
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787703; cv=none; b=IjLFK1aqBJFk6TtcpjW1ePaluhkhkp+W2ECWkAVsow1R++dz8jYcGcvc9m7PnkxU8EJINpDqK1xrWqI0KCiMgG7F2R8uLUrG3LiQQRLm6lIzC438EmecAVti1JFZYMsXnGpvCYB3di7PjOwvwrezJR8x96XAibob/6BXnQgy194=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787703; c=relaxed/simple;
	bh=pjl6cY91tXoDWcWfEEAwSSE3Iw/3tG+J8zq8C/zS7lg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CBp9iuGQ1PkeN27V+Qn2GozLxU0Cnyjjp+k+h4rY6w91UVczQE1XfcfyPeTET3QHBARmP8vD8/V9O9HKCbs+29K3hLQKzNe0v5V/zQVIuA6M7QfItG1mbFL2Q32H6PuCaEWufGkF9Nxyny1JDBRhtqAUgHM0d8wIv7EYNkMn61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuwjSvey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEpuEePf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4ZT7a1582218
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2E9YZHi8mVm
	UUCdAPl94Gdnvp6FNNgZ6ghFgArKR1ZM=; b=nuwjSveyM24yjI0jH+ly7AvqFFV
	kFOOcKUa2Ew4+4dqZDTWoyWLNmzZmAthMontcHTIWFlShtS675ZHYcLpnn0bPUDJ
	8Qyuf2PVA0RbbF9CTvsQSkXD97s4U8suXPiqktrQziF8CZQNQefYY153hPxcUSeE
	D6E9XRuK62ToM558lis8m9LxTI36UlclqCREKXlEFmrzL2ftU3kv3Gk9wz1T5fb0
	pTyWefuGFWVLKFHjKG0VfO4qdhxOcFIEwZJmNf7FvT8PVlEXNGSzOKdcVZRLnKxm
	MTwm6FiCpwH1+twCni6hN20aiB79Zxv2jrlzUa+6ZBMi/uruw/Lth9eEiIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69er193-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29809acd049so54413465ad.3
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787699; x=1764392499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E9YZHi8mVmUUCdAPl94Gdnvp6FNNgZ6ghFgArKR1ZM=;
        b=cEpuEePfdyKRJQv3NMe2tkTkHwoWpQUwzLHHYhfQk0WjxVw3HPHDEAlju45bBFvkAO
         09J5htsrGRsTWL1I7Ayp7ROWJj7aVkuYxn4jZfd7pZdrXTcZ/C9lHDR64/PfdUbqLosm
         UiCeMQAW3UK8Y0f1p1itdFWAiDEO53jolcWvES5kFZ4ulNo9nWkGO0rGyhT9d37/gu8X
         J76HNgxsQMrCtgt0+wDS2S1td9pFHHhfjL8qmz6kaSsyznxxbsll3Mj9UDsjGJ8z7JYs
         HwfLikcAe2NGa9X7bGQIQ+PwdWyqhhGzl18mQAE2kwCL/a131zIJLQZrKATs+YDLE21J
         MHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787699; x=1764392499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2E9YZHi8mVmUUCdAPl94Gdnvp6FNNgZ6ghFgArKR1ZM=;
        b=LYeAYcBo1ToZTEUG3q6Bzpu8YnBrReyMdxlBEo78S3vtnh23DV3Ci+EdiQ6uOVsbX2
         TfBEax1+G+K9ezIHjc4YywR1M35GfnTvY2f14TgztR36BP0GcJIOCjbQZjSOUZObG3Gy
         bGdApEDxAARMRbBPf8Kblql+1lrEMMQnaxJGCWXD1Dq9QNkSxCYmG+zMSwFqX7uScfto
         +9y8W552NKfqtMfUrNbIfyb8xJmEIBuIr8+pZRTYTyAxegFWXeQ32zjvhoZe7vBRutg5
         gH+3peZ9y1rfxAECHuRi8Oy6grIQNCWy5T1K6sWJ0lrLfOVHEswjkfN+P6y1l/deTuwk
         CoDg==
X-Forwarded-Encrypted: i=1; AJvYcCU6b2Gdp081trgOG5Mw0nZacvast4EVNSHMoK/05+zYACztbS0J+N4J0kHvw9eKEOkMsWhrqH3hoKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbYirXW9ZmAHzUMUTuilJx1fIMKCLwahaJN8Bp1JYeUUJY8r8z
	r15RLn2MlsefgMJr6FkcsSMod2+CTRYbQM1PU4l+vPm1N2oVJ5L1ooyf2MkENV+QGZaiWpSiLIQ
	eA/Wfm8kAJiRt8OmmrKTe7wByGtXxSzmWsv0kEsXowwpdjee29RIvaDO/Lv6yccQ=
X-Gm-Gg: ASbGncsavBZzPJsvjVrOglHDDo/of0DIOlWFARW5tBLn/j4RABzGiYpmsCpf1rGZyHj
	6CEGyAJidEGVBTjpjt/zXkcpUuPcaBPiVSDmKJEdZ++E/Lv4KZ5BfmLkYe0CEP26GQfLPtmvCk5
	Yt7BCuDJm3vad9f11wWTPJCS/vaz0lDfjQ97USO2kTSz9aHii1Tj/RPEibOIC5/i2niLohGR3li
	hXj/GoWdswrjn1O33DJMk2B1I7nG7VfKD3fMEViq5oYEfM1M+he0DeU58LUl6do7S4pwcO9vNVz
	x/TTBRUHj04XHePJLE9v14cNlt2aXvye92z1Jminio1HtpStmzfpg77QMbTyyMzfQMHlhOx2Zep
	eYmN34iO2eyET2iuQniEveRQtqQQh+FKOxLU2y00NFD0=
X-Received: by 2002:a17:902:fc43:b0:295:73f:90d0 with SMTP id d9443c01a7336-29b6bf76f59mr57983915ad.50.1763787699088;
        Fri, 21 Nov 2025 21:01:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoRvXLUuA8WOlFW5EjeyHiUFDI6eRZdYMUcLr1xpYwDsGXQPm3VjjJU/KUwQK2LYPNTZeJhA==
X-Received: by 2002:a17:902:fc43:b0:295:73f:90d0 with SMTP id d9443c01a7336-29b6bf76f59mr57983435ad.50.1763787698469;
        Fri, 21 Nov 2025 21:01:38 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:38 -0800 (PST)
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
Subject: [PATCH v1 10/12] i2c: qcom-geni: Use geni_se_resources_state() API in runtime PM functions
Date: Sat, 22 Nov 2025 10:30:16 +0530
Message-Id: <20251122050018.283669-11-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX0Ux9UoWQjL06
 ai4lqiNprPFXF9hJYH/emM92KHHomAkGd28pLToY10ODZFyNNDr4+R8Up/nw6EwUPVvo1wwPp6F
 yXq0sbn7GeIDS8LJV4sG/+P4FtfymU8uoIMHO6v7lVe5Po9YT1SiOHxOMATewzmnBiuscXdIiMJ
 Dl7Homc8qvHLA3Q7n7vTPE7+hcVcCaDUTxIakirHh3UljA5ZBpR32UwldA4e6ge3TzHGkf4HiWK
 TenYQTG2ZnR9bWmiPX2JSNzRT1ZF1PF4fGfvrBDHImBZzXd17ogV3gSyRVgPeVLTL0FjWyPBilg
 yszKEeKblN3V2EeetKuFO6ErffAykR3B9WRDel8n3Lh04BuCXWqydxX4EgeMiYZhEEgZpZydAnu
 Hi8u1I7VarnGk2UWRaEpmCuENl2VIQ==
X-Authority-Analysis: v=2.4 cv=cMjtc1eN c=1 sm=1 tr=0 ts=692143b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=467v_uBPdO_cN_CSUdMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: evErJsvzTbJMWr1bbUAAPTrW-j_06CZn
X-Proofpoint-GUID: evErJsvzTbJMWr1bbUAAPTrW-j_06CZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_state() helper API addresses this issue by
providing a streamlined method to enable or disable all resources
based on a boolean parameter, thereby eliminating redundancy across
drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 790cbca2c22e..ea117a4667e0 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1166,18 +1166,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
+
+	ret = geni_se_resources_state(&gi2c->se, false);
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
-	} else {
-		gi2c->suspended = 1;
 	}
 
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return geni_icc_disable(&gi2c->se);
+	gi2c->suspended = 1;
+	return ret;
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -1185,28 +1182,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_icc_enable(&gi2c->se);
+	ret = geni_se_resources_state(&gi2c->se, true);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		goto out_icc_disable;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
-		goto out_clk_disable;
-
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
 
-	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(gi2c->core_clk);
-out_icc_disable:
-	geni_icc_disable(&gi2c->se);
-
 	return ret;
 }
 
-- 
2.34.1


