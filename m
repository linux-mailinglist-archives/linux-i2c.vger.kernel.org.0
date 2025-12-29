Return-Path: <linux-i2c+bounces-14824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE309CE5F18
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 05:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39E6E301F270
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 04:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC2A21ABB9;
	Mon, 29 Dec 2025 04:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQtWb0y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJYEQA1U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C2275B05
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984158; cv=none; b=cX68mJ+TzW06tfXQtOU81nPUqX9E5Fc3QuOX6UVASjG+CGxUgDwS+KsJl43rdEYT2YH90I5Lf1/AoUdkmndRTgLe0U0OQtA/RnwjaTtMI2KhDOla6pm61mqBdr1582J+JyOCG67bAPmk0RNq5VJfb0PQHX4Ba3CKQ5wv03SkYNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984158; c=relaxed/simple;
	bh=5xsApeJnKutP/DbrLu9m78Eok6FpXw0T47Onyc9grx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ctmK0Fs1GJZ1qnwRZA7PvWe7nmoSWf5l+AixVM6SJWBZMfuMLqHyxQbmdK6BBvowCnCPaJZqzFjUCnsZaU9vqdkzjM7lJX+SnOCbSlvNgm5KAAG5L8e6bgtPqCwM6WOk/BNp2uQIxeUfjwtWsX2Mgpfhd+EtwyUg9YU4wVOxeV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQtWb0y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJYEQA1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNj29a1461913
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sqaUgDVKZ6m
	4wCTCNsu1hZ5yx1Nzly5OMpjbviE6Ct8=; b=QQtWb0y5GRMV2upvKejX5YFVhPS
	folry3j5gp5TVU7hK2borz4hSnzJLt+mOY3LNoHVtfCDS1fURhGFVsljV1n6KOUp
	wAa/SpfOL5Ysg1tTBk+nuQsvICsKmJSA5hFHamrrea6rCO+ZxOdaTuZtK6q9qBjo
	ELD+jm5PhWwo6FXzKYvSOn9nDyU1ek2btmo7ffw/vW/jm7Mo8US8FmHAdyjGSzHA
	pdItY6EQMzxLywQCwMhjoJh9bsN6tTgANJGmvGHG3sdAxZNgzgoaFHMgBJGxcTDf
	I/rd781vbpCkKMbLfCq86EE3et2qlw88dGiDVcCLq++TJ9WDZomQFsJHiDg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj1te9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7dd05696910so13591068b3a.2
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 20:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984155; x=1767588955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqaUgDVKZ6m4wCTCNsu1hZ5yx1Nzly5OMpjbviE6Ct8=;
        b=JJYEQA1UNXhyjAGzVVoFhKTAI1o2uOISs9XiK5PfYBDAZg+GECKYHXWG73WrdtxWdl
         igzbUB7gv0Fx+P2KEXfbphYeHxzfKEot9jB9wVZ7YAUluAaFLfGifQSosEX5IVBR0h9b
         KqJSe9NURzvr0On61J4QeNPWTEFXYCGEr2ZP1+9kNRMerEIfVjYrO81BiSRdWnhYD8Pv
         iS4vufdjDPhAvNALHuMCpXRWD51/hZ1PVgfzUFqSKTWpxcOTbXoxarX04ikIpZmOBtYJ
         SfX9JNwrpMMNN2P7tayPKKHP5ytsmcyltt25bCH0MRWyiyQnW8dMOPvS6whsTaMkX7Nh
         Ad1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984155; x=1767588955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqaUgDVKZ6m4wCTCNsu1hZ5yx1Nzly5OMpjbviE6Ct8=;
        b=kTId0ADpLepwGP1v7Y3h7dKOJsKalDdhcLSs8WKIVfSmiYGKxsGKgR4RKb9CYNXdsf
         Q7piv9Y56DenwMdTHXrqnIoQKgEF5sUX7x3Hm0lX7DRMGja7POgRkWTxussO5nMEcXlZ
         ORpicEIASCm00hMLk0FoKm1JShXaxLBpqCqyIx/WlNkeSSW1DI/i8lqPmn3G6uNKaVCH
         xxEM2F5IJ+OmADxcY+YUETyONKG7BGNVgbT0sEfNOi5XmNlGtpG51FtB1I+mvXvldlsv
         DHer7CyvSaBKvNZdoVLXVN1VMdEt/FWU1m3RMCzJdDqBE7bojnjrKgl8TgcXgG9YddRh
         0vGg==
X-Forwarded-Encrypted: i=1; AJvYcCVzkC5DM1xeqpKtc1dtsiOzM+j9ID+kdV0zznMHUxf8Vzqrx9ws4GJR86aI1zFfAgffpM6QUye58Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+EgnKjdkQp4UTObnvzsu8fUz0CeeR1gEavVIBN4dEteSWSvKL
	6iqVLpByzmP85hlhfJ/vTkCbI8yqXSo5I98qDjT5+xQLu2RdT2aRY7K9HPTGwo+ZXSbekpc5WcA
	Oe76mr8IektXwCTqVVllO1WI4FEN8zLN9rcaXpSCEq+nzwu64goTqngd/oUXtsxM=
X-Gm-Gg: AY/fxX7xVPnSj3KrS/l84if4uH66YTCWDKeZzU5KVv+X3hQ7TmZN/INzit60riPiJSv
	QO1HatJxaH6rqex/gQRzsJwsly8qBwebIFrivsoeyWD4iVR724C2I+cUioq+grDG0e1DCpIrJiO
	Ya+mwLZzfU02FzIqqlc7pGXIW+QDjPEzgewcwjLxAryMh13SOeRpaUirCYG9S5ApG0f1tQXeVaB
	kdUVJF5qP5mS1VjpFj6Ztu8r5cCNiy3tmzq0EIA2LDMf7kHRdkvvTKfY1cc6gLsTGBTLona4tTK
	b9urulzIloUJM8UBz551PMeYGKAvYaM+Z76xgWCu7kH80kzkmV3dN3fXsD2HlFY7Dy0VrdjHtvJ
	RjMrsRjyWmUpXIr3l3Zb227Yja7I95pWQt9HZYG6Dtrk=
X-Received: by 2002:a05:6a00:414b:b0:7e8:450c:61b6 with SMTP id d2e1a72fcca58-7ff6607cf9emr29366165b3a.38.1766984155064;
        Sun, 28 Dec 2025 20:55:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVWAN3I3GIksPa2s4fGOxAGvD5QkitCuunHhLaFdnhBZjdXLBug8IwYxrjA4PPSx+ZGFqufA==
X-Received: by 2002:a05:6a00:414b:b0:7e8:450c:61b6 with SMTP id d2e1a72fcca58-7ff6607cf9emr29366138b3a.38.1766984154479;
        Sun, 28 Dec 2025 20:55:54 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:55:54 -0800 (PST)
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
Subject: [PATCH v2 08/12] i2c: qcom-geni: Isolate serial engine setup
Date: Mon, 29 Dec 2025 10:24:42 +0530
Message-Id: <20251229045446.3227667-9-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: VEx_FhnpAAO-NDy9C-X2aco5q_0Zl_yc
X-Proofpoint-GUID: VEx_FhnpAAO-NDy9C-X2aco5q_0Zl_yc
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=695209db cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6GPvvr__t7aM35KwLhsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfX+AqfTc9d5Hfz
 WywUB/05MhUoRqg75MidadnZWHHKZhokifXpktCMi2ZIbdC6AsQQ2tRMRtciaNrArR4lyV2aaBG
 cEY1kdjJo55xBhViUVM9waTihKfmukeitKN8Y5W0fthnbpGRhdhk8IchiJXPC6iE/9Dc/upKjfa
 GnpsGW1TWogdXwvJBSITIHHtdXk+YuQS4VXsA5HEFvNkCotvsKb36wrGziMT/D4kk4+ROmaXrou
 oTSor4V6N3jRZQEeRUjUrIc9uMX6O5dPlfpde3ve9neksuVaV+Hf8wAjeltId+DuAAYKOZxTEYj
 l+06y+3+Dh33EcXSrrgrNyc3DySZbCLX0rWf4JTrbEVa29UNhlBphhdPNZM71Vt3KtVfzUsj2fM
 LUwyHqU668YwuPcMCXZKa1AjOJW3o2NFn5NbMO8I9uSZU627vP49vOTIDR11QjI6F5nW2mT+jZV
 7tjGvYuzd2B0PxBa67A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

Moving the serial engine setup to geni_i2c_init() API for a cleaner
probe function and utilizes the PM runtime API to control resources
instead of direct clock-related APIs for better resource management.

Enables reusability of the serial engine initialization like
hibernation and deep sleep features where hardware context is lost.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Updated commit text.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 154 ++++++++++++++---------------
 1 file changed, 73 insertions(+), 81 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3a04016db2c3..58c32ffbd150 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -976,10 +976,75 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static int geni_i2c_init(struct geni_i2c_dev *gi2c)
+{
+	const struct geni_i2c_desc *desc = NULL;
+	u32 proto, tx_depth;
+	bool fifo_disable;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
+		return ret;
+	}
+
+	proto = geni_se_read_proto(&gi2c->se);
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
+		if (ret) {
+			dev_err_probe(gi2c->se.dev, ret, "i2c firmware load failed ret: %d\n", ret);
+			goto err;
+		}
+	} else if (proto != GENI_SE_I2C) {
+		ret = dev_err_probe(gi2c->se.dev, -ENXIO, "Invalid proto %d\n", proto);
+		goto err;
+	}
+
+	desc = device_get_match_data(gi2c->se.dev);
+	if (desc && desc->no_dma_support)
+		fifo_disable = false;
+	else
+		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+
+	if (fifo_disable) {
+		/* FIFO is disabled, so we can only use GPI DMA */
+		gi2c->gpi_mode = true;
+		ret = setup_gpi_dma(gi2c);
+		if (ret)
+			goto err;
+
+		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
+	} else {
+		gi2c->gpi_mode = false;
+		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
+
+		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
+		if (!tx_depth && desc)
+			tx_depth = desc->tx_fifo_depth;
+
+		if (!tx_depth) {
+			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
+					    "Invalid TX FIFO depth\n");
+			goto err;
+		}
+
+		gi2c->tx_wm = tx_depth - 1;
+		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
+		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
+				       PACKING_BYTES_PW, true, true, true);
+
+		dev_dbg(gi2c->se.dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+	}
+
+err:
+	pm_runtime_put(gi2c->se.dev);
+	return ret;
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
-	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
 	const struct geni_i2c_desc *desc = NULL;
@@ -1059,100 +1124,27 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning on resources\n");
-		goto err_clk;
-	}
-	proto = geni_se_read_proto(&gi2c->se);
-	if (proto == GENI_SE_INVALID_PROTO) {
-		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
-		if (ret) {
-			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
-			goto err_resources;
-		}
-	} else if (proto != GENI_SE_I2C) {
-		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
-		goto err_resources;
-	}
-
-	if (desc && desc->no_dma_support)
-		fifo_disable = false;
-	else
-		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
-
-	if (fifo_disable) {
-		/* FIFO is disabled, so we can only use GPI DMA */
-		gi2c->gpi_mode = true;
-		ret = setup_gpi_dma(gi2c);
-		if (ret)
-			goto err_resources;
-
-		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
-	} else {
-		gi2c->gpi_mode = false;
-		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
-
-		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
-
-		if (!tx_depth) {
-			ret = dev_err_probe(dev, -EINVAL,
-					    "Invalid TX FIFO depth\n");
-			goto err_resources;
-		}
-
-		gi2c->tx_wm = tx_depth - 1;
-		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
-		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
-				       PACKING_BYTES_PW, true, true, true);
-
-		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
-	}
-
-	clk_disable_unprepare(gi2c->core_clk);
-	ret = geni_se_resources_off(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning off resources\n");
-		goto err_dma;
-	}
-
-	ret = geni_icc_disable(&gi2c->se);
-	if (ret)
-		goto err_dma;
-
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
 	pm_runtime_use_autosuspend(gi2c->se.dev);
 	pm_runtime_enable(gi2c->se.dev);
 
+	ret =  geni_i2c_init(gi2c);
+	if (ret < 0) {
+		pm_runtime_disable(gi2c->se.dev);
+		return ret;
+	}
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
 		pm_runtime_disable(gi2c->se.dev);
-		goto err_dma;
+		return ret;
 	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
-	return ret;
-
-err_resources:
-	geni_se_resources_off(&gi2c->se);
-err_clk:
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return ret;
-
-err_dma:
-	release_gpi_dma(gi2c);
-
 	return ret;
 }
 
-- 
2.34.1


