Return-Path: <linux-i2c+bounces-14820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26886CE5EF4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 05:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07216302E161
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 04:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E79520F079;
	Mon, 29 Dec 2025 04:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu0N9tHd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQw1eg68"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D1E17AE11
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984130; cv=none; b=iOePKqayJ5+vmLqs2Ot9z6CFrOGUzvNBxSyNEsd6XZLUCBuTE9gJxu61rvLSX8P59PzhSn7fPSA9Gb7nnZqH+eoSbVBcm3S6Q5z0eke0+NJvlKcMsujF8r3Vcj1qD6nvUMPEDE+5Q03ZeGj90qCNxVlJVN6gVBAaOwT0pbyI2DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984130; c=relaxed/simple;
	bh=OQWQWcWc7+ugBKip5ict3pRjJ5gzBzgAXNCqirSWtMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JdIi/HRBjLpXIINWTSm+W/u2hXg2hWv0A0154fN+2r8gQuhZGMP9KhPO7ShiT2imhMYwWVTqIGS2zxDoNyYialwaRgveYGalzQNM8ozIqmT0iT/Mf7xcbxuzKgYnlUvoHuRzEFO1GhgiO6RlfTMOZZda78SdzpWaxy6qdszTEcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu0N9tHd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQw1eg68; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSLn9lR3156595
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fPoLwp83rIO
	Ubb8PD9th6XfMRFsQj0dEVzVP2zhRPbI=; b=Vu0N9tHdiAxgyKJY6LxVF8dxnjE
	/TXwdIG/FzC4lt09+K1YOLGPsEY/EfDauFiTzl09pxwaaynXFMSu5yr5pdtWO5kx
	pksOk9EIPzV5uoHMSl9bc9P3MpnHruEbtLwdigOalYg1srhFJT5nvRcfWPWPedTF
	XNF47epofjL3i4IeKX8TCQnZdGvYZHb8vC9rJm0QsGAYp9SQgtjptV6rHw6LrxKq
	9qPqgx3eUFPQtX7ZgsUJrJTd3yYcTz2hI6kJ0XVJcvAA0lyk2fogKxWuKL74iAGz
	Zn+CrRp6luUv+WC4m6T9aBydlD6MRow/ovYjxEEi0PbDrvUH1MvVxaTSOZw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnujnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a9fb6fcc78so7347254b3a.3
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 20:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984127; x=1767588927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPoLwp83rIOUbb8PD9th6XfMRFsQj0dEVzVP2zhRPbI=;
        b=LQw1eg68knp3CCKmn16t2jjWvVLjFCy4dYlPZkhOEx4U00BUMFE+YT5Y4QxD+/RIuf
         mHA2jBLPjBd9xwlw3D5Gw5e61ch8UNH+tdhmBvkvevaCs/BbjpebG7CWJy9aRUNLq8iF
         AygCwGVcsyNERxUk6oJT4OU6FcSQGYKIYr+tygUrC2OP92IWQEo4jlmobzGUHL6e4pP/
         yQ/N0q09JKfPYUwM/+nz6h766bHrk5rGkD3ay7H6B41M/Bkkpnhx8yGi5gUEXIzWd0li
         VzhycvS7nONlAkl2Z/oW7X6Nhm1FrA/KILn8g5ae0fI+v0CKTU5b/fXrz5hv1lnNJV4n
         GcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984127; x=1767588927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fPoLwp83rIOUbb8PD9th6XfMRFsQj0dEVzVP2zhRPbI=;
        b=PFwFLZFaJXk10O5hBHW95Xkm3FK4dfbP+orJR0rtsnX54YmVxN/FKX71SlRpo4Eaz+
         tWofjGbbpsfXByCxyOTPuHl2UaCl4qav5XXwYc6S+UxfZynJdlVQMUtIj20luAelaYao
         4uuR8I/r00NB/4EK2/2JG10k/jXtqGCUEFITwQYrnelZoFjZ1bDm1KalHbxwGAhP2CA9
         bW1aNBoD5pSeinLqy1GEjYdJzZ5l7IDwNc/QgPzJitsD5Cfhyy19QTRcH6ZhFY7RpKZi
         +KLRVxoES1GWETxRjlAHiz9zjxjK9dq9BCAyzrywwRSVaPySw/DKKN2ypv/SQfEhDEPJ
         I+yw==
X-Forwarded-Encrypted: i=1; AJvYcCWzhOGB4LG4tzsOnP28iK7U4oQuzBsj+1td8V1BCsK6y9x1EeSf2hYf8Pz9Sg4OvE26rNghP4BiiO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD7GRYoVgWJjzb3SWpwsaKpz0KXqt44MWfmkOpIim4ONlfXbzj
	4F0S/LIQ2EsNGco2QqgQajDN7PryoQhOeO74aYRcs+tvQBXtUYJztG+lgDops1pqfFjbSnINUDx
	T3A3UvByoB6JTBB25ZcxwfNaLPzfL2kUmkUnBOyEG6dippXvhv/HDm0BmALEK3PI=
X-Gm-Gg: AY/fxX5lyOykHBeWl6MGTr0LFSb09fUsDnB+9A5ByG2UT/gwKAH5tIf9au5gKwafHKX
	y7twJ5MHgt4SLEdVTaojqaTHQVDCdr5KTk/B64RUuiK/s87Rwu+NC43RQuV0q8ZTE+DAEYMsKL6
	4Lu1NAiMgtMeH2UykmvAyvZ7sTGXpTK33u/wialL3xDJFylDcD+rZdSbHy7CvErWSgNcXmoqb6J
	95Te07a5E3IArgixPplk+dKNvgWmMZO0A6A9819ODT1hSMSYEzEE75INQsEjUx9C3m2WEl4J6xj
	Nyb2+1V8H+NebqUQWp09zDHZ0Q6kzyzG3cJTvkUYsP6yAn+8daTUAO064M6gMKksts+f2IQH2av
	7TKvIuZ4wMcAML89ovR0rPBKL6AuMZT1UB0hUi/xvGgc=
X-Received: by 2002:a05:6a00:2995:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7ff664798e5mr20923695b3a.50.1766984126598;
        Sun, 28 Dec 2025 20:55:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET5KLQmeiePvPhp+9fn08iXUwoY7qGCnQlUsCxN4yQLmjNhQdHtOuJzfBOUrgTiSJoFVhsQA==
X-Received: by 2002:a05:6a00:2995:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7ff664798e5mr20923682b3a.50.1766984126021;
        Sun, 28 Dec 2025 20:55:26 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:55:25 -0800 (PST)
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
Subject: [PATCH v2 04/12] soc: qcom: geni-se: Add resources activation/deactivation helpers
Date: Mon, 29 Dec 2025 10:24:38 +0530
Message-Id: <20251229045446.3227667-5-praveen.talari@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=695209bf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KBRiQYpxJDLEvAb9SdYA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: vDfgQqFqZ8GwtZAw1r0aYjbV8R50yLSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfXwfr+g0vNddFJ
 j08670+XDjMTOlR641QEvCMT+fnKK+PY2Ed6yrLiJ0TqyERb618fYzcSlPi54tYvU/YQRkcYJtY
 mvCh+9aSiUCIndJSsZMpUP7Ww+GzxUAH2FBVoVI2cntx9GMIB5Wn9+U+5jx5UNh+ZwcQ8mk7Np9
 SFWoTNTe79rdSkqxMiHIZirejvAc3KJ1JTTZpoaBk/DA14eMgLNJRQx0aL/1VvlbyphzOUZhzMb
 FGjGTI5uBjfhje51RX8Jj99oAdO8ZSewP7Cu8eIkJcof++wOXAVgqwL7WIN4Ws19aMSJS8f35xH
 8HLkiQrTWuhPHJZdmGJ08IkaVUKXyR8xlqMKyDxRJrLTVMEj2FavkVOKaRUbskZ8ISrhXnPo1wi
 10y7Uukov8L6QFlsCm6QGSe1zjEclcTX8BV4ReTDDMJKNqFQsWWk9okhrICld+qeHZwWqqQwvrT
 6hrqqfeXq1z6C9/+3Nw==
X-Proofpoint-ORIG-GUID: vDfgQqFqZ8GwtZAw1r0aYjbV8R50yLSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290042

The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
activation/deactivation sequences independently, leading to code
duplication.

Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
power on/off resources.The activate function enables ICC, clocks, and TLMM
whereas the deactivate function disables resources in reverse order
including OPP rate reset, clocks, ICC and TLMM.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1 -> v2
Bjorn
- Updated commit message based code changes.
- Removed geni_se_resource_state() API.
- Utilized code snippet from geni_se_resources_off()
---
 drivers/soc/qcom/qcom-geni-se.c  | 77 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 ++
 2 files changed, 81 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 75e722cd1a94..fbffbc9ea7a6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1013,6 +1013,83 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_se_resources_deactivate() - Deactivate GENI SE device resources
+ * @se: Pointer to the geni_se structure
+ *
+ * Deactivates device resources for power saving: OPP rate to 0, pin control
+ * to sleep state, turns off clocks, and disables interconnect. Skips ACPI devices.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_deactivate(struct geni_se *se)
+{
+	int ret;
+
+	if (has_acpi_companion(se->dev))
+		return 0;
+
+	if (se->has_opp)
+		dev_pm_opp_set_rate(se->dev, 0);
+
+	ret = pinctrl_pm_select_sleep_state(se->dev);
+	if (ret)
+		return ret;
+
+	geni_se_clks_off(se);
+
+	if (se->core_clk)
+		clk_disable_unprepare(se->core_clk);
+
+	return geni_icc_disable(se);
+}
+
+/**
+ * geni_se_resources_activate() - Activate GENI SE device resources
+ * @se: Pointer to the geni_se structure
+ *
+ * Activates device resources for operation: enables interconnect, prepares clocks,
+ * and sets pin control to default state. Includes error cleanup. Skips ACPI devices.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_activate(struct geni_se *se)
+{
+	int ret;
+
+	if (has_acpi_companion(se->dev))
+		return 0;
+
+	ret = geni_icc_enable(se);
+	if (ret)
+		return ret;
+
+	if (se->core_clk) {
+		ret = clk_prepare_enable(se->core_clk);
+		if (ret)
+			goto out_icc_disable;
+	}
+
+	ret = geni_se_clks_on(se);
+	if (ret)
+		goto out_clk_disable;
+
+	ret = pinctrl_pm_select_default_state(se->dev);
+	if (ret) {
+		geni_se_clks_off(se);
+		goto out_clk_disable;
+	}
+
+	return ret;
+
+out_clk_disable:
+	if (se->core_clk)
+		clk_disable_unprepare(se->core_clk);
+out_icc_disable:
+	geni_icc_disable(se);
+	return ret;
+}
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index c182dd0f0bde..36a68149345c 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -541,6 +541,10 @@ int geni_icc_disable(struct geni_se *se);
 
 int geni_se_resources_init(struct geni_se *se);
 
+int geni_se_resources_activate(struct geni_se *se);
+
+int geni_se_resources_deactivate(struct geni_se *se);
+
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


