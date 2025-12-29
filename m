Return-Path: <linux-i2c+bounces-14817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27662CE5EAF
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 05:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA07F30076B6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 04:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCDB252904;
	Mon, 29 Dec 2025 04:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB8fK9/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKLChU5w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345718EAB
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984109; cv=none; b=Kc9peAq/JlLTpljyXAQhWczprmFAw9bddaFY3xDH3eJ2EOMz0enD7c7W2VYlJPw6UXYMYYcVOoWx+bksRtMaOL7sMI9YJZLKAEPZTdBAsReO9gJHhbkf6ZGiEgd/LVLyfSZYh1K7lrH9rxXLzMctPhpnzXSAAXjHh9hwJsQqx8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984109; c=relaxed/simple;
	bh=Eck/D6KmwOrBysTJIIaZmSoFBAq/RlW1moTUSu+Xl3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eFTQagwgiIG+TP3FprP265JuoO6ie/0zlxx8/NaQGy4lXSrFPWPs3ev1ZOq7iHi/XYBk/NF5FtSY1UHN6GwxU+s0pwZlet7V4yb9rDUp+MpD6+AZktMganxV0h79bcn/8OEa70B7VgrV/ipb02pV7mqkVDNKnsv8YHGqTFyFf2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB8fK9/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKLChU5w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSJn1LF3721871
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnpiwG0d//X
	/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=; b=ZB8fK9/WjSMwS99I+WaJEF6AfQ1
	0DM+dTPlcQ/AqnCfDy0VF6O60j72hrQV4Zf4N0XfHLSbCM15V8nOyOayL9IIaeH0
	2b5hCxNvVX6GX+YSdgY5kpH+1/jaPUULqQg/DRy01tbAnESqHrl3g84rp3zCNm0P
	cAn9VRjdXnuGOdMLPdW0xHayXk9plgEaUwqgEbIdjSfb61PJTdPAuJj4/tCKaCrT
	W69s6t6WAeGMPQ2NI0UgUVPns856N6lSxTC3pQ6DBq81dGVS6jeRFY62TvvAqKaJ
	a0sWsrdiMT6/Z9X1XSGo7xlLSGRDsQUO/Mpoqd81szWjjqGVqgWCbI2yD4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsbcrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8b79cbd76so4711651b3a.1
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 20:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984105; x=1767588905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=eKLChU5wrcWDZSyZqhfVfFt4pZ4ChJPSrkmUswfQy9TmQQTvAS9Zf8weKwZ32+eqWo
         diwOiRZdZcvFYvBemQ8zKg/mu/X+CqmKYoDVI/TRZnWudsCh61UTxnc1IKDXAoPmZisA
         vBn+GjT2sPdbseBV4/QiD39PNueTNUf12jx6y/IjC5hwAstPtLPSYzgyc23EjmfmlL+x
         6piB8DNKns1rflVpJEC6u2FFkgfnV5sYMeC2ISZl1XMeFZkt8S7GQbJFvdlGHo69nU51
         CvXKWBdsnKbZr6uKRrtHLnmf0ih+8uYH/diV6EHIT0VhbkskCyWyjJX7+wjam7RSARRt
         Gp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984105; x=1767588905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=WBT84gVjzbvQ9Dpo7985bSJIq6YBXYBoPduIN1xqhnrBz/+Gq1uKR5QH8qHG2Dpd0m
         o9leZCzvHShcpD0N74t61bMqTYS8oehl8LcPs45xPJjGtqOB5Ngwj6S8wcUhkT7I1LI/
         0l5dodumGLNvOGWyfHTzxmpaO7uO5F5L+LycahWaDqG5/0yVl5ecidHi66wtRsTlJMfQ
         ciS/XsANiWY/UCU+QEZSYm88CIF6IpUxYhjy13zu0QEj7g183A1I5fP1sBrX+iyj8Rhb
         NyjVlpmZx0CG8HQE6YnCxyNFGAuV8sNEPAzAXtoueONz2E7Z1y6yelhCuIaesEVAlwf9
         VHgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYXI/buQMB/QPZrr37dY36WoYNCccZk35Hhboptiwg+QrXgnedgP9P4kHJvZbv9jScJ6qsAQ0sL9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx12SB0FHwdElCVupU66uVzlDlZKI7oKGewCK2xa26wgB0x9qM+
	Sn4o+7FtuXLCMj/b6mM4eO5MgX1qY9pShMHr5Ka3kGkX7kMsWzRAs3OPPs3Z/wlrJRVnshRxRVA
	wme8YGSm8TmfSDhUwWnkgg8nc5J6BwpZgDYmMi6lIY7CZUQ37I9Lt0rpIyw3PjxU=
X-Gm-Gg: AY/fxX42pV2GwSFmAjNYCablLDA8DIlFNU1GQOwykekAKNUMvQIhoZGitbpsSEGjtff
	g6YR0D/EutYG2WFz0nqrKKwhntn5Gmolw8/42mS/SDjjhBt0CqrLGNkXOKhokXnfFEnB+F0UMU1
	h4p4kdqPQnt2HQwY1RBja1OTKTKnkxxNw4GkxDxbXnCTMafHSuoEob1YlkVWij/pSHFMhp05gj/
	Wsgdclts1UsK8OwICTDmFqZcMoWAhhIuiylLXNalvk3HnKJsxEjOoZQSyH/d5zz5CAB2sXBedQ8
	tnLjEJy2M/pfEvMXDgAiXat8nzW7Y8rhl19SbmARi9lWqwRsUNBMxhiePCOliOknTpplV91nc4n
	2VkTEaH9ZjL8EePhJvwI2IQ7bus7lpuZHcqHrngWHI4Q=
X-Received: by 2002:a05:6a00:3014:b0:7b9:9ed7:538e with SMTP id d2e1a72fcca58-7ff5284dbfcmr23117390b3a.4.1766984105373;
        Sun, 28 Dec 2025 20:55:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGA+ojqnMT0CK88BaGx451YRPBiqYCNxKV9loJofxmWkWSa9imhXwL8/X0UFmMvdGgSGCMHg==
X-Received: by 2002:a05:6a00:3014:b0:7b9:9ed7:538e with SMTP id d2e1a72fcca58-7ff5284dbfcmr23117363b3a.4.1766984104791;
        Sun, 28 Dec 2025 20:55:04 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:55:04 -0800 (PST)
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
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 01/12] soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC path optional
Date: Mon, 29 Dec 2025 10:24:35 +0530
Message-Id: <20251229045446.3227667-2-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: TVRg3FDgd1Tqy3gKGZrAplGk3O3JoaIS
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=695209aa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Wptve8LSCQjy2B8HgooA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: TVRg3FDgd1Tqy3gKGZrAplGk3O3JoaIS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfX9ZA46a6tjGCz
 Vqn9WcIe2XpqJuKLLZQG1/4NCdTzcOtT3X1A4uspmWoc9YiyIDKwBsGO2n3gwYKsOQ0XKeC0dMv
 GglENgIzEbmjURuAmxeGHWD5oJzdaarKMJ1wqvWo81OyfoTuTKoLKd22Uy9kcQMK+KRtrmbQUE0
 d4FxXrCkLdFblIm6qpYBqJNkgegxIBXBwmnp5y1qz+dl5pMEBU121C6lIaHQTFlVqJltpg0yXvQ
 +24ZMdOkmd845/cC0+Y+/zuo3zJlQ3X3R83a8OTLQ7cPnyqstJxi09OXXyzB1NZvi4ZB/TVyAuU
 RcqysllFfzIapIn7VsQ2x7OqowHzH9Z3xX4iAjjpVRWo0SlR3b7Wgu9f+22Ok/9NOW0bITfHjg2
 bzuSxoUfF/uY9Gh/UBqEsczxqTc0Lrf6iE7qIv12WvnTB93zESGmBmPlYPG24D3PX/aJbOheTKm
 m3QGAGR3Zu0DX0afVAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290042

The "qup-memory" interconnect path is optional and may not be defined
in all device trees. Unroll the loop-based ICC path initialization to
allow specific error handling for each path type.

The "qup-core" and "qup-config" paths remain mandatory and will fail
probe if missing, while "qup-memory" is now handled as optional and
skipped when not present in the device tree.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Updated commit text.
- Used local variable for more readable.
---
 drivers/soc/qcom/qcom-geni-se.c | 36 +++++++++++++++++----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index cd1779b6a91a..b6167b968ef6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -899,30 +899,32 @@ EXPORT_SYMBOL_GPL(geni_se_rx_dma_unprep);
 
 int geni_icc_get(struct geni_se *se, const char *icc_ddr)
 {
-	int i, err;
-	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
+	struct geni_icc_path *icc_paths = se->icc_paths;
 
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
-		if (!icc_names[i])
-			continue;
-
-		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
-		if (IS_ERR(se->icc_paths[i].path))
-			goto err;
+	icc_paths[GENI_TO_CORE].path = devm_of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(icc_paths[GENI_TO_CORE].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_CORE].path),
+				     "Failed to get 'qup-core' ICC path\n");
+
+	icc_paths[CPU_TO_GENI].path = devm_of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(icc_paths[CPU_TO_GENI].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[CPU_TO_GENI].path),
+				     "Failed to get 'qup-config' ICC path\n");
+
+	/* The DDR path is optional, depending on protocol and hw capabilities */
+	icc_paths[GENI_TO_DDR].path = devm_of_icc_get(se->dev, "qup-memory");
+	if (IS_ERR(icc_paths[GENI_TO_DDR].path)) {
+		if (PTR_ERR(icc_paths[GENI_TO_DDR].path) == -ENODATA)
+			icc_paths[GENI_TO_DDR].path = NULL;
+		else
+			return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_DDR].path),
+					     "Failed to get 'qup-memory' ICC path\n");
 	}
 
 	return 0;
-
-err:
-	err = PTR_ERR(se->icc_paths[i].path);
-	if (err != -EPROBE_DEFER)
-		dev_err_ratelimited(se->dev, "Failed to get ICC path '%s': %d\n",
-					icc_names[i], err);
-	return err;
-
 }
 EXPORT_SYMBOL_GPL(geni_icc_get);
 
-- 
2.34.1


