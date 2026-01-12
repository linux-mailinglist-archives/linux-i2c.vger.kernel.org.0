Return-Path: <linux-i2c+bounces-15043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58514D1202F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 11:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CE353026D9E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8A034B414;
	Mon, 12 Jan 2026 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Deh3uicR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2Ks2+I0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3146E34BA46
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214916; cv=none; b=CcXTwHlibqyZ26/yeO3dSrAReUyDkoqmWYl7x0sSo2z8pi+J0yVs6x18le4ehlERHhEl1CTII/nW9USGmHjR6V5HLlh+F64rmN9+BVJw8U28/ynzBLE3E/6d7s5EpaV3OD5oKAzWv8AfqcBSxePFIN5jIaiRtp4lepjyMJJJFqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214916; c=relaxed/simple;
	bh=sd+Xljnfm0clwQKZjvueg2pzkap7XowUeh/WoLCloXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=atNwlsy7tM5voGBVh4nO6zDvSRe+yFUDX8YEoFY2h4PnyD6DQle5Q2BEMALEQeu6ZV5cwBzL6YoW8wPvFKP4wrDagvGrkZs2b1BLbLjDbcZlbVZ9MBU3IKv5xW9fpBAr/k2M3EnB+nyd+bcsASW2RMeQEuX7bbvKbXZoCx4uqV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Deh3uicR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2Ks2+I0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8aItv113636
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yHj7LcjuyR7
	44fhCZ9TThkC8k2+KnabV2Ku2dES356o=; b=Deh3uicRFQLSACT59v/PjKASHc9
	YfffzKQzP2PGasG56JoK6OB0DZQG9y9WQmJguogbI7S9pj9rfgjpF4CcmYDg4dRE
	A1FdAbgaNS9s+dSYqJMi+VGOgXvPh1UoGn0ICAHcpux1tFfKpnK3GBRoWyNSaLps
	+0FCAiPoL4Kap6mnAXc3m/WJPcHbVWGQUMi9964XH/bcKMTCGSET2MW9nd2xMfMB
	2LDmFEIt48+mw4v39ZtQdAqUYObKX7BLxFVmst33OP+X/7JnJlt6vLfZc4m82qt9
	hQAThmfoT2qhdrY9W3Teb0aLQu4KxfhgSEfTIt2QVYxME+Ev8IYUUcdJG9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhe7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f5381d17dso723853b3a.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 02:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214911; x=1768819711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHj7LcjuyR744fhCZ9TThkC8k2+KnabV2Ku2dES356o=;
        b=c2Ks2+I0y/fIrKGspQPu7Rfa2dcW9nWIXr5HH4kFTZxl3FZKzpWJXfrHvVpUl32/y9
         oUrSMJajIGQ9wvIiqOSxUaEypGLxwDJM2UhQcLUrTHKGRn5rWhX1HWEmpa6aJhhryrDk
         YrOjsf1Dz/UuEJkoeqD8a39kG8LtsMZQTJ+36rt/7UXPNZyBgWbDKCRvlWlEKmk6avL5
         TIdjks+rcSBwgmteyJbXx/DdQzewf9zfIyQb3haNqFJ7MEITkNh8Au44FFU/pgts4CIh
         GuZmK7t7lWz8baSMT86MlWEYu0KCUAh5e8sYhlgHosNXelEDQIyCG2C2kbukeETcJxqS
         cKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214911; x=1768819711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yHj7LcjuyR744fhCZ9TThkC8k2+KnabV2Ku2dES356o=;
        b=g6XoqwUywsoeQumNYviBAr9SXQdhbQ3yjj7786J96RxBwn1obw5zPaUpVjz3rRPx+V
         +2yIEo3RXv2qH+woJHUP7nop4n6WuMq3h6GDh//2NjWgR7v5mOyQ3jCilDcgMbCWD9zq
         YNBhWjL5FRTSlPZuZp6K0jsRnEEvQFCm9e7ZB/TzZPoGEgM2rhZ7KKNVoE0GgmU0CueO
         fvlOGp7ElzlinygSDhxfVaLcGUhI4YRQOmLZhngEe9KROVUCYbfrEE0f88PFCkjmX17z
         X0U2D1KBr54MntsbR7LMFQM1otTbDawDW5BNComIxNICJEzI4959pn8NFRZgpTNV0IFj
         Vh+w==
X-Forwarded-Encrypted: i=1; AJvYcCXX59xCxqNd6nr3AYmNtxZwdmHG5rH06CGBgNfK3uT8gLMY1rx55vMjK0F8i8QS7OkKg9WqgbsNciI=@vger.kernel.org
X-Gm-Message-State: AOJu0YysFYKLUguLRNfYeO8R60RwzgpRfdgBWHvT00CmxdEYliBWtLZ3
	kA1q2j7pcQ8lFyl+x7n8s7ZCpAaVJVEc/TofnXc58NLq7ak78nQpj6DJre6E4S3RWYWegyWF8Sn
	2e+hF4fvnk6k5OGjWu253OyEZo5jtPgtIFevhjV5bif7l1hRSUQAWR2+62VSi7Iw=
X-Gm-Gg: AY/fxX4o3SIlzIEXA7+NimFsVpaLC1dKFpadEbm6d49BuPDNAMYZfYcLTKe5BxqCxft
	2JlHkiKSpt359vELYCjrJipqkXEk3cPPxpxYgQj0VHMOK7q+kLsA+AtUwqqf+SH23VaLRfsGJQz
	BrBrhMuaERuh8+BPyCX+XTp4XrwnOiNowDNFjVxGlxShb7h04mIgiz8npVa3BwrFXE3xx/4IWHg
	BFe3aH4zkTZ1Urtr9Oc+bQfAENHtYqD434oglaOPEoTOpZGXvaLeNzBwPa78f9SDKYxoZI0AmbC
	WkFHn4GunsS0zKCFdbsXKLIu/ak8Pn8dmMhRbxOSONwlnJF4k2mcnQM+e3EhgaAFsbpRjCZmBMg
	zwgjwDGmStMpDPk2cuc+GqHLhjR86JPXm6HghH9TT9SA=
X-Received: by 2002:a05:6a00:ac08:b0:7e8:4471:8e4 with SMTP id d2e1a72fcca58-81b7fbc8679mr14341476b3a.69.1768214911546;
        Mon, 12 Jan 2026 02:48:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDTPGU5slDB2kB8F/ynpy1LZeQQTfK5nYm0t3d2XETK87JyZOzn4TZMieDp9ZkH04X69aC2Q==
X-Received: by 2002:a05:6a00:ac08:b0:7e8:4471:8e4 with SMTP id d2e1a72fcca58-81b7fbc8679mr14341458b3a.69.1768214910941;
        Mon, 12 Jan 2026 02:48:30 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:30 -0800 (PST)
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
Subject: [PATCH v3 09/12] i2c: qcom-geni: Move resource initialization to separate function
Date: Mon, 12 Jan 2026 16:17:19 +0530
Message-Id: <20260112104722.591521-10-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX/CQLYBpb19cJ
 t3GGgIJZJjOO9QDgLuC4VexV+g8kT8P/a7PIOKmqWghDkCut/YaMV1io+onIY/5CqcU5sXjW3et
 VvQbNKNVU+mTMhOoX4k0ZbWRw6LuO0ytwO4y/oyUdRAguOclL68UT+JB0Xz0l9w0WNorUISZ7qr
 +SKToFDnc+eCEECXfKRkHv9HLre/1FMQTS9lQU73NYEnRh15ne/MTg6P8lmqfo9NO0GgkLZD3yV
 qU/7seggPTS7lQBQlwkWd95FJMiG84Lk1hs7//caW+Dvf6r6HodUMPylLrtKYlqysXbaITATj3z
 1jZx2kLiwLjx7t9xhYar/EWl3AaM8JVRDZ4KDKoG5dltuwJjysy7/WHpcyJmg6uECoEmN6bzW+D
 Fe3yLcljQK/LVyOJDpFMZu1ExL0IGG4v35Y+7w2Z52gqwmmvSOhtfYkqnZ/S27enW5vbshomoaP
 8e30jW92hzYcDZV2DBQ==
X-Proofpoint-ORIG-GUID: uKdqN_nqbj_0DJnnEycVdDjRTdJKdjP8
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964d180 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V89BwkbFsXdiYDgkWuoA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: uKdqN_nqbj_0DJnnEycVdDjRTdJKdjP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

Refactor the resource initialization in geni_i2c_probe() by introducing
a new geni_i2c_resources_init() function and utilizing the common
geni_se_resources_init() framework and clock frequency mapping, making the
probe function cleaner.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
- Updated commit text.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 53 ++++++++++++------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 58c32ffbd150..a4b13022e508 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1042,6 +1042,23 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+{
+	int ret;
+
+	ret = geni_se_resources_init(&gi2c->se);
+	if (ret)
+		return ret;
+
+	ret = geni_i2c_clk_map_idx(gi2c);
+	if (ret)
+		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
+				     gi2c->clk_freq_out);
+
+	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
+				  Bps_to_icc(gi2c->clk_freq_out));
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
@@ -1061,16 +1078,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	desc = device_get_match_data(&pdev->dev);
 
-	if (desc && desc->has_core_clk) {
-		gi2c->core_clk = devm_clk_get(dev, "core");
-		if (IS_ERR(gi2c->core_clk))
-			return PTR_ERR(gi2c->core_clk);
-	}
-
-	gi2c->se.clk = devm_clk_get(dev, "se");
-	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
-		return PTR_ERR(gi2c->se.clk);
-
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
 	if (ret) {
@@ -1085,16 +1092,15 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (gi2c->irq < 0)
 		return gi2c->irq;
 
-	ret = geni_i2c_clk_map_idx(gi2c);
-	if (ret)
-		return dev_err_probe(dev, ret, "Invalid clk frequency %d Hz\n",
-				     gi2c->clk_freq_out);
-
 	gi2c->adap.algo = &geni_i2c_algo;
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
+	ret = geni_i2c_resources_init(gi2c);
+	if (ret)
+		return ret;
+
 	/* Keep interrupts disabled initially to allow for low-power modes */
 	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
 			       dev_name(dev), gi2c);
@@ -1107,23 +1113,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	gi2c->adap.dev.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
-	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");
-	if (ret)
-		return ret;
-	/*
-	 * Set the bus quota for core and cpu to a reasonable value for
-	 * register access.
-	 * Set quota for DDR based on bus speed.
-	 */
-	gi2c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
-	gi2c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-	if (!desc || desc->icc_ddr)
-		gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
-
-	ret = geni_icc_set_bw(&gi2c->se);
-	if (ret)
-		return ret;
-
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
-- 
2.34.1


