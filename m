Return-Path: <linux-i2c+bounces-12654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483FB4432A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72E9F1CC362E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8A430FC19;
	Thu,  4 Sep 2025 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Omn7tnLf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340BC30E0DB
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003983; cv=none; b=VdMqIp/lu3V6TYyiZqq92Ds4LKKf0vkYV66ZGzv5vckiFtaAhyHM9L+d1FzUkwfaxz/jJ+OoP7Ts+NA0UkIpVTxLrwTUnVXdKAiiKtTnHN/UQgINkKCPBposZ6dCbxvf/S1EN5XRRogXOQFym3Tkq2aHcmG3YMKD3ikFJ1FNvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003983; c=relaxed/simple;
	bh=E1O6rOzv0lZ191I1uujSCw4U/Q2xdbO4Vs5JwqnUhcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YEtDC9iVgsGF2X6K5C4Dezd1AAQMrUrhPgc45mSzEmdpDPGlnNdniIeaqlVeYKP6uQh6KgM60HRDbtwZCpC8aFXkJzYllhXIC0mmeZkV4IIgxBg/lkmxvz91RiU+nct72I+SqjpPmrfm3Ov5MYvKnqotIcLL6NpCRO5ZIKiMiKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Omn7tnLf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7Co022976
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CDpMGCSL5nkDXYqAdlOX/gM6pgktfLiD45yNmYWQxcg=; b=Omn7tnLf2fBYQ4qE
	OKmXW1LUnidhR3J+UQ25TvaidI8FZfGn4L4VeoUpxFcJJx0Gj+jLKm6SOleCHj7+
	TuL/7owoEtaVqFMuHssLoF+mrlNQmsQ/gszgSkqaFzjf4N0t7lPSeiIA6AtbZz1U
	fsbLPRd7tqymq1KyKD5pIPGwXU9Es773o+tjgacJqpRxodSMJhM/fYCSnYIgyobk
	EQWQofV8a5fqqiHRaUpNs7/9M4VAH2jssGfQNVRr3wG+mRXpNX573gICmxBqNRlV
	0vXqH0QC1LBkpq8yspe4M83Mm8b+IaTpHjLGchiHe6Jn0k7SlTwBiS53jwqQh9P7
	vTukVQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eratd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:39:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77241858ec1so1197511b3a.0
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003980; x=1757608780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDpMGCSL5nkDXYqAdlOX/gM6pgktfLiD45yNmYWQxcg=;
        b=OEMZEVFPdcJpOwrJPhy8gNO6db+Ic+V5dl6Z8pCfdZzgDMW7FmHmOAPe1HbiGpL5bE
         uumsgLu5EpT4p8YCngVh/kvAtYlOddKzXSqePNGLgcB4DhSiXPqksDw90EcQUqW5ifDw
         +9ocq4d2itLtWvRi3XkmtTAFzeRvgHKaoxXuhbqFmL9/CvzZ4uq1sM+11lYtBEOXN7LV
         S/AJwC49EHJAJBHIeQ4cg4ILpOyynvdEiiQ7J8dNgU4zRit6g8G8EX3A5oLJVua7rrvB
         Opz7UNf1zNAYA/aQEGYqChUAJBFeBURNZUs3ojNRrrb6iekmaUJtwETxiL5f/6vsK0os
         hB1w==
X-Forwarded-Encrypted: i=1; AJvYcCWBTllc9Vd4hb6YAlNJs7Dp2iXX3FHRxxCJsn8lgOk3M6J4bxQs4AnoRNwPhrNUQ2rf+2XZlkyIZt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZRTqOpVMeRG/oELKuYqWAxfQuSDXxiHkIJBZ+KusmHVt0DkEv
	VPWAhLTksA1BaIebCR/d6YqcJhCgMXESlpGc852n1ABvMzkoxMv0snPXWbOG2Nlr/tDlIJG02xG
	vopE8WhxXWYalNxivJXTdflwNqBidPmIwXbDXnJRNCYPxp2g1RE6y6r0x334nOp2SUosilbE=
X-Gm-Gg: ASbGncuV7rwnCAHRihRtz775CIS2wVjEhrTjiwbJKFdJwnhF5yHrS2S0jaqSmJf0m5g
	wgHhlOUZ20mwD8tLkwKySN4fJM/57j+XuM94XVi3nEpFsdVSsnUEWxv4NzK8FPhyu6nYsKXlmAk
	v2Rn8mrN1Ew13n6wGAmTz9Mk18hOocYSE90WanGkrggQPHBMPxZK3YrNgg3XD9CWuEo0qDQbqPR
	zb0yeZ8l23vU2GyH1CVE4TYI0MhMJ0VsOuOBgRtawEVxCKDNzL3mW6wds6OmmIttZ9e8gT/nfru
	qBoYPHfl9INOxwb+f5BeXPBuLJVpydo6kTPvOAtKe5jJT/LXE/Uk5RCqadGgxSqE3b/B
X-Received: by 2002:a05:6a21:9990:b0:24c:a32b:3235 with SMTP id adf61e73a8af0-24ca32b3545mr2764108637.47.1757003980503;
        Thu, 04 Sep 2025 09:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPha85n2iNFgSPsnAlm8leQ1tQQ/9MzM1wGVWoNdLxC6N6B3n1oZzAjUru6wb3vf1yNeqJTQ==
X-Received: by 2002:a05:6a21:9990:b0:24c:a32b:3235 with SMTP id adf61e73a8af0-24ca32b3545mr2764060637.47.1757003979995;
        Thu, 04 Sep 2025 09:39:39 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:39 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:00 +0530
Subject: [PATCH v3 04/14] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-4-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=1246;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=KCMCr6yvyYTCxPTT039B/teImKPmXb9UNZkMYvy7EJk=;
 b=JpY4zDHyUFQo5X8IN54NMq0eLmnWrs5hwlmxAS3hLkb6nKOEniF9NgXSufodHaO0Qsu2vQrG6
 OqsYrSskXMHCf/9/DYP8Ug30KwWOixpZfJwIzxOa2WJHEDtTgg2vwUx
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: f7ED2OzJEDk2Hi2PR0Teg-9Xg0V8VJzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXyPZk75olJtOU
 h7IQCX6fAc2g+MTZhgMeloyZqx5wH/RCP8+XKR5nJVS5cPKL4yjVkBNKzv7mj4Xk/e8PjIWH7cz
 tG/19sovkBXxqTethjYS7CVExG1ljZc6EaxHivb/hXD9H1JZ30RdUjGEp4wKZXs0UDuoviG+2+M
 fxQKWOgOTkuWvjVAGgit6XbqV0K34uK/aEDJ3EZ12XqvExSmwh5tda6yaJst16P5cpZGeuAWIhD
 kGWkzruV2T+IsxfzPkeC71FNFPDf5NY8cVMi8nJ/Ix/JmosCq4sCyL1gNCzmc1e+ZdoRJTnq2iB
 L3REbLVg7k6+ZbSFbulIr6+IyxqH7/a5sEhDP9JsILBzib6QARyUSTzRnXgH0QZOTWjpfktev3V
 MVpXlnMo
X-Proofpoint-ORIG-GUID: f7ED2OzJEDk2Hi2PR0Teg-9Xg0V8VJzy
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b9c0cd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=itmwO_cg3X_j9a1xKB8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

Integrate the TCA9534 I/O expander via I2C to provide 8 additional
GPIO lines for extended I/O functionality.

Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 56aaad39bb59..c48cb4267b72 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -289,6 +289,38 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&i2c18 {
+	status = "okay";
+
+	expander0: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@39 {
+		compatible = "ti,tca9538";
+		reg = <0x39>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@3a {
+		compatible = "ti,tca9538";
+		reg = <0x3a>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3b {
+		compatible = "ti,tca9538";
+		reg = <0x3b>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0


