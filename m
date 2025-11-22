Return-Path: <linux-i2c+bounces-14224-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1FC7C780
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CC154E3A72
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B8C2BCF7F;
	Sat, 22 Nov 2025 05:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dc3TXP21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThYE3Vsg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8B32C0262
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787689; cv=none; b=exK497XnvxudvJ+8fgekTHHk2lOwfi7FOFP7wvXD1BuF1XBpRGkrGDttEaSQL9iz0AETzPDLUWX93x4N/s0aW/3x9lUbyI4OaI0CioQ+UtTK4U0XxBDuz2oLTIjcVsjGq41FBGy1eImMwwIqjP/xRrf3M3JQ/Abnu2JVDTJ4fBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787689; c=relaxed/simple;
	bh=LhJuKA2MQMHo9RRWRHBlEbIB6tUr7IjpiYBDNYGMC8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tQQ70Y2GWn2WaBI7A3CvY6iNz4+jW42M8hifpNZUJJmX7cnYKkIRK2SCgWwjid0Fbben1sWvWM9POzicq39RYYdWi4/+qN9g6XPNB2txo3iyZ3nXvwxXbHPH+o2SQhCjlCk14zWOktGZ2iIRMg4TICO7QcvubS3QmIH5dWGoaRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dc3TXP21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThYE3Vsg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4dhWG1091007
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ba/8yXeN/Cp
	a8rrPju5CylcOxI0VUEDX1A3sMcUJl3s=; b=Dc3TXP21NbkyvgV+PkzEpPOOK5n
	ecjVxDk2J7irzED2nzofIBlVuFNetNI8hqGdBDK8WilN4ROdz25F5RTJ7LCXpnmi
	UHm93cuZCdsG1U+gGi6UjiSGYZDRxzHSRdr/R5VUkUVtf6pwCFgBsNFwwunXR0mg
	BDpRT1vPRycwFrRkmvYjlRmTvYhlOMsIoydM3xkgRQ+oLzzMADOWd3OR28PC4Z4Y
	qIwD/i4vudY42v25U7IRTIc66DZiMCaZE0I1Y/kA/WU4pQVdnbAA3Gyv0Fv9Ic7F
	+kjidklRtR5kPoID2AxCa2NvLKA2zplic3MhAdbpi7PjmTFyzNlgC7iHr0A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6bgr126-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34176460924so2330344a91.3
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787686; x=1764392486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba/8yXeN/Cpa8rrPju5CylcOxI0VUEDX1A3sMcUJl3s=;
        b=ThYE3Vsgt00g3fOgYyYqbWEZDMM6W5+pLl7uUwzf6RnjbBm0UbA7v0AOBk5gYu0Esm
         lH+VKHM4asWk3BsnWDqFjzFoq4jCIjhsVgxEYNYz2pObR6ySkL7wlXw2FhtTH7+b+g5o
         4/Z5v/C25QK1YIAqn1LP99iMxfQfGqGXWWx8s337Ha2+MTz/1KSjqJJbOYh05ki2b1SP
         EpgP5oySQUzM3dd9AHi8nkW7np/Jtvwf0f0O5mKywCkmg7M/7g/y0UQowwDLZjtGCP7F
         kO70vnCvFy2QSTLlZo8+0+LVy+hFjhlXOngsJfO1fN9x/Fjt5x+PuqHmo3j/wafXVFMf
         XZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787686; x=1764392486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ba/8yXeN/Cpa8rrPju5CylcOxI0VUEDX1A3sMcUJl3s=;
        b=nCk9ZSXu9UTeaypiObnRwAXpzoMtDqWXfK2QmlDppsfhAKtM5ea/UUyT3v+iMUeZZ/
         J1g8nnbHGajk+4KUaxNsjT9WK49i1IGe3WH3Tc9NCrm3HY/5o82Ae6TiGxziQ3MeiOQ2
         FPinKM8SSqSJAZDzTbwJqBF05x575BgdOyzXhZ0nLuZR1hcon7MP+6zhIgUyuLW1ZGtM
         JA9WZ+DTPqTYKGrE5+zd8kavQBPE1FFMAJBy8AZ4bbVQHWP1dk8BG3mFt08CgfW8dTIE
         KOb3MmmC70++bkZi5fpFuTMJNxykq90gj5OkThJHeXJE5SjsxeRu92qLgPnZ9KWFtlVE
         tvyw==
X-Forwarded-Encrypted: i=1; AJvYcCXEptoCXXjMwZ4HRwmz3hAL9yFXSb0YrPmRCjTbqAHNT2kK9mEpgvxoK56jbKmRvGRFDgW73Z4YAl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YznXmaoe/+B57onRm7Juup8a8EBEAGGEEdc1vV01vFnPa8F72rf
	thMLegyyYWYsDSZQqZsoKKzylramQirXB0RQ8vpQ1/v1BxUmCa+C5VtHVy1iAe7+ShwMMlQR+rk
	10RizP6S429V2cgVm/XpmL+cSrFmoB450uL0v5b6hSuBH+NIIqEeefB9vT0oObeFLzPOTDM4=
X-Gm-Gg: ASbGnctIdzss7dMzmfWPstAZbF+2THWIO85cmUe2Zu4Sizly5GnuNgUt1iTQUvCMQaM
	tZatSb2J6Fof8meQ82fI4yDZcOq1UlWzk7WWQY3FR5G+393SLAv8Ct//ZFGC1RJ5/DKn6KupJ2k
	co/PrYSgkQmh6S2/ovBORPP7svS14ywpD4z0D2byt2sby4+gaiilVU0Q86jnxQ6M3rNdAjYBT4Q
	zqENj6XFmewfhaJkVjHbYB96uSY8/aFq5JdIubrfKz1GmmxAiQFgJgknMp1rQ02foCxqagq8BsY
	mUpbeBXuFQGdKNUBYVG6eHgG1IGo7jPmqJOG9/yce5Ege5R3JZDH6bhpmogrjUwpEgGVOsmdF+1
	OX1B40NS7Fo5I+LzbwodG4wdeQLxmaHgdP3zHDPYuwks=
X-Received: by 2002:a17:902:ce01:b0:295:557e:746a with SMTP id d9443c01a7336-29b6c3e375emr51588195ad.13.1763787686049;
        Fri, 21 Nov 2025 21:01:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZw33E42wJRtTKCTlFWOeZ0uPYN+DHueMghEVprymvWra29Qgc2v3IJ4BH37QAlsCh9kk2lA==
X-Received: by 2002:a17:902:ce01:b0:295:557e:746a with SMTP id d9443c01a7336-29b6c3e375emr51587825ad.13.1763787685517;
        Fri, 21 Nov 2025 21:01:25 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:25 -0800 (PST)
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
Subject: [PATCH v1 08/12] i2c: qcom-geni: Isolate serial engine setup
Date: Sat, 22 Nov 2025 10:30:14 +0530
Message-Id: <20251122050018.283669-9-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: vgZbf-9t5TCApqcMco7_4mD3UVQammZf
X-Authority-Analysis: v=2.4 cv=MtJfKmae c=1 sm=1 tr=0 ts=692143a6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eRlIPBYRqdTMzyAxtVEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: vgZbf-9t5TCApqcMco7_4mD3UVQammZf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX8QQojRxTnP89
 6dkgJbGIGixT5J1CWaYNfU70U0WkVOEErrhUhtkrMVTNeWKT0Up214KRhGKQqz0j7aZPIANhB4+
 szx37HPZKx5P8ghLDuAy0ncO34bqd+DocEDHkARWAhWeR9ZzDWSr6UuR3U5X6aVE3j6b03+ssvY
 53GLhIZD71OtD58iFN2sMyMP6gy/aS/7y1L+TlbM4sVYFgDeruBIJpywqHmj1bdEKfUQ1cbMfv2
 qfXtV7ZDE5hIDLKVTZwQNRlwAzWnPUeBl5os7FEtFZi6lJfHCvm+Vw5Tf0pYR3/UCwWxkaA+Mqx
 cWiSlhREG4cj4uch5pN+vNKujZdNhCmr3RBskhNgx0redAiBCSX2uFnF1a4Yztm6I4J/aRF/U9E
 xRJcPFwtRn0m0RNAHFJvkpCQdwmt6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

Move serial engine configuration from probe to geni_i2c_init().

Relocating the serial engine setup to a dedicated initialization function
enhances code clarity and simplifies future modifications.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 148 ++++++++++++++---------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3a04016db2c3..4111afe2713e 100644
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
@@ -1059,79 +1124,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
+		dev_err(gi2c->se.dev, "I2C init failed :%d\n", ret);
+		pm_runtime_disable(gi2c->se.dev);
+		goto err_dma;
+	}
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
@@ -1143,13 +1148,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	return ret;
 
-err_resources:
-	geni_se_resources_off(&gi2c->se);
-err_clk:
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return ret;
-
 err_dma:
 	release_gpi_dma(gi2c);
 
-- 
2.34.1


