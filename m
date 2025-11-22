Return-Path: <linux-i2c+bounces-14225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0328C7C792
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B05004E3799
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4CC2C0286;
	Sat, 22 Nov 2025 05:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLmuG5GY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtdhvE6z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E6B2C029C
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787696; cv=none; b=LO725GqDbatRuKIRar8zDQu5Pzb7GDvcG7VjK5DpRJH4Lf9wJZcXDMjHuMa+ZMVcmjDMVb5cXtTgf32x4sfaKXX3j30D1kqPHGIJ3wfLsHajw8Bs9VVp57dgMDBZNp/s9uAxVo3ol9uJd5I15iEkI2TQspm4e3SiUYXxuawL68M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787696; c=relaxed/simple;
	bh=wzRwgattoRRbUaaFlAmDzQFR9u0vN+F12glbNqhUSn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pxv8Rsy4315rzxudom3KtKNF2al0XZXzAthlyxAz4oYF+KO6oCxUGfs4+oMrGsifdpB/Ma1zkReeGfYNBNOx2hFVM2D9LcWNVSCAJNTwplBKZfH/6hvOS/0hYlqPXk5JOoSphizmpZ0MSzGhrWpHZskdeHdeHoHntS3WBAF8fnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLmuG5GY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtdhvE6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4auZX1803797
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hDO9rBge+G+
	xj9sw1BX4cdCb6G9jvmWkUpOlVuGtNLk=; b=BLmuG5GYQ2EJmYZ0VA0I0pYdqnR
	tYRpLpOxZgrAX6cHYEuw6RySpalQvmLRvkkwPuLLByizbmEfqr9RnkSCslCMY/Yc
	UyiBLKiixYJ4wUxkCGb1n4EfwKI1Gu7wTBvRFeuamoaMac69FjqK87y8bwkyEOl1
	Sptl6JxJ8yxpK+5yJ8RD3WmBlKCctA95fqPwwfihULIDApWc+K2rkLHeYJR8X6NV
	Xsl9FtUy5G6RH/bAS4/KsRyKWKx7j8NFcAyPumyFe273d+L37+m2ljMv5Lp6TDx+
	9o7M8fyasx1QUjeEBcKBZLmvhIffvlPae5/aNtDZJGbcOm5xHPQKfCq6NfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6a5015v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:01:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-299d221b749so70756905ad.3
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787693; x=1764392493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDO9rBge+G+xj9sw1BX4cdCb6G9jvmWkUpOlVuGtNLk=;
        b=HtdhvE6zCQJJ9Q1hDugtnInfoigNE72lyfk3w8rD4COFgcGTQgiqfm0ZRhn7H84ImM
         YL/EWIo8iqnn4NmRKZd4bv3cfARn5RFWvxvW/hKym584qF2UrDbZLHkIwGrpPPkg8W++
         k/udqwjRlQQ9amhAVUOHscjsWLWclhLcNjGIYWinlWLsdMeMC7rBVLnSESF+4CgcawaE
         iUOhMX394ZZp3waS2M6pB0Dj2odForW7Q/X0Rz0W/hkS5fco8uVJE1GNodhdbBrRi5mj
         3oDE166DJITlgIEB4nWqXr+qHNF8SmG6eZGdIk73b6n10ngpRwn3PzBCJFl6WpDAy9/o
         Qyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787693; x=1764392493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hDO9rBge+G+xj9sw1BX4cdCb6G9jvmWkUpOlVuGtNLk=;
        b=UcQTfLaeEqXbc0PEZXbTa1DYP1jq93imsbhSZK7lykLlfrrCE4HQE2pqu3KZt/h3ji
         DLV+LfZ8q8v47IRUaNBI2jVqpeGEaufH0y6KKUwhq7z7PrfXZrAUcXO4TP4KotyqHwTa
         zPmnQzmy7dV0zeKllhm2IoRhRI4QFU8OCWYW+1++N6S9jkyfvuxV1uBbcDDLcvrjmStT
         xOG2uhcvb562IHKvzbPKLOsus5gm1MSgWC2qgEH8huuz3mykoWaOLrACyn9XJVZjh3Bg
         RwT5k2yWqhCfA6pR3phHN9crN2mSQzKQu2ox2+8GpLrdRuvrljS5ZWCcmtIs+lFlvVTB
         YcDA==
X-Forwarded-Encrypted: i=1; AJvYcCWs67RWnxj2HGlAa3vMX1+X97UxagvmEa06rJWweGZP/gIlkpeagEIlKYsJCuHqxb0+1MKihvYlRbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm3sp+FoPNIsb3ATBsdMoQ/zt8pfyZkUCguqcbdqQjquZiUhDL
	5Rzhm8XWpfAMi2lUZZ1Esw4TNValNGA6jfIBNzm80x9gLmVhraCqiygTtojIMRSkBHT7mLr4QIW
	WtEFPRX36DEsLsrs25mNm4oUpCC5rnD1vwmdWqMHSbVaRSomU4IahQ3f10QBvbjA=
X-Gm-Gg: ASbGnctbHMwwdV/ewjpGCS/+Q1gypwHRF+HQqmTCZzAEdQx/C53EZ8cEcb6GaAHH2Yq
	5EV0FQzJdXD7tQt1MBSmrAT1nx1q6t3nD3eLlZur9PmcIqqxauFzOcn6oOFk3eZI95XYXpK1QuY
	RpEXt/Csg0+bjIIqnB/Y70J1FRsHN3I56m0ZQM94lmEi/PtbgOLRL4TqGlQxp4D0wkba3ejQ2Se
	G14ZrIvBdNz+xB71LE6sonDT4eiYE/JHzdSwNX6MHEZgt23zHXNIQSbJwM8ZKXcNzfRoC0nxDek
	7+irq1Tldqa19CD/pxt0oLv2nAVlw1wM/DHY4aQhTMPcjKPUlHYv3I5Wm/rzA6/LcTGx8f2dmn/
	7jXw512A5teFplGpXNBoLoemSoDg71m9rzamjlEyqtOY=
X-Received: by 2002:a17:903:2b07:b0:295:fac:7b72 with SMTP id d9443c01a7336-29b6c6b6cc5mr55109895ad.52.1763787692735;
        Fri, 21 Nov 2025 21:01:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCdg0UMnv19QwLQkwM1y+x6rPHFE1zTMmMMS4AU7ITz8pgTidap3romZtfWTgBv8lkQKl3Pg==
X-Received: by 2002:a17:903:2b07:b0:295:fac:7b72 with SMTP id d9443c01a7336-29b6c6b6cc5mr55109495ad.52.1763787692075;
        Fri, 21 Nov 2025 21:01:32 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:31 -0800 (PST)
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
Subject: [PATCH v1 09/12] i2c: qcom-geni: Move resource initialization to separate function
Date: Sat, 22 Nov 2025 10:30:15 +0530
Message-Id: <20251122050018.283669-10-praveen.talari@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Hup72kTS c=1 sm=1 tr=0 ts=692143ad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V89BwkbFsXdiYDgkWuoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: XGWmFxRjXwRXN-ub1_GecoQSP0dj702T
X-Proofpoint-ORIG-GUID: XGWmFxRjXwRXN-ub1_GecoQSP0dj702T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX7r/bBDBEnw3F
 g1JQ2ogtoEwP4y18+l27f+Cjd4ixCYutS1auh6eQpwbHw0WktB/MsM/zVsTBYnILYj6rh+kbNUC
 rljO7xDm6A2222jwxXI+JH2PPtioCTPSXFdVt/dSI2BYcneKrCpkQTCnfPh3sSYMFkddq6pcGw+
 C1k7NCzGrIOylDlECIUaokwc+7/do4TXsm5OVCVT/w+logluwA0UDD+Hk705KFIiSNmYgpwxnMD
 gHGRld34dmWqkEL4Q5OEOkZvYmoLDn/kF8oT8goyhtUkj+TPHAsNvqXxDJ2osFEIuHJSRmccoKY
 A2RVvJb5zH7/XdPeIYfYeta6GPKkmfoIu4F1zBEUumcjjd1bLhKUGc2Pe1ERjqq82Hhar27dVDs
 bsKPWRLw45SInji63vV+7aZz9K+g+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

Enhances code readability and future modifications within the new API.

Refactor the resource initialization in geni_i2c_probe() by introducing
a new geni_i2c_resources_init() function and utilizing the common
geni_se_resources_init() framework and clock frequency mapping, making the
probe function cleaner.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 53 ++++++++++++------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 4111afe2713e..790cbca2c22e 100644
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


