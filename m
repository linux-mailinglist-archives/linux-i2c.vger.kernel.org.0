Return-Path: <linux-i2c+bounces-12964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F4EB59419
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 12:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F4881BC3738
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 10:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F60C2D23A6;
	Tue, 16 Sep 2025 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTZkmkRc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F02D12F3
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019641; cv=none; b=gE5LRoB95rg2RA880vztfe21QPDPV5Lpyue4zzlPm2iSjDJhxOtQOuo+VbxAH9pMt8yRrNLkKcavz8jRSPatHlq2varC/rLgNBnkGBKiR5DYPZkabG3YPNr56s926r3UZ3jq6Lj4sn3njDTYf6eTAfBOZmtzToLZN87CubdOrK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019641; c=relaxed/simple;
	bh=2Nt/WViwfyk1OM7Esn+J4JmZrNIA4MYrfc77+xCl288=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgRaX067yiI0HpqBLHo7CxH0stLjOVXz2PqFeY+OGnENbWK13hWG5V8pQi1YD2KLWw52oWVzbwsvKJzFOyE60QGvKiqKgUr+8OX36wCV5V6nu5vKgmJePVvHsIEQChogbyzrTxgvbkoy/zCMDaLl86Q7VdSHzn1kjf0/i905F28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTZkmkRc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9xr2h001513
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxJ1YelP0P/MEMkGmrnvBSD031m8K/rwDAJvdjwN3a8=; b=pTZkmkRcg/Ewu9db
	qcZSwPKVHE7TTmxv3HvxyE4Ce6wKO22aLpHpsiC0JHJuX+NaCzSX/RPxPq8lVXRs
	NEMrwprypecYxM8E9EaXtYaoIPox3Iy/RsXUEiF2V+DPtV3kWiclQttEsX4iU3Tv
	YEB5WE7LLNa6qaKZJCFVSwa4zA9PvjvGSHAinAK4y+KHTBA1znfmRHCp2lx6jxVJ
	pcfS6wQuaH4+fhI/Jx86SAK7A89F5xne1N3lmtnxM50dN7Ggde3xCFIthhSiyLI6
	E1JkoydUPvy6oXrp/cnUbMfqmfeb5Q2dvSMKc3mKifcMbCwx+/4krYbSuGqlb7Pb
	gPgAaQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpyj2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-248d9301475so78660125ad.0
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 03:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019639; x=1758624439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxJ1YelP0P/MEMkGmrnvBSD031m8K/rwDAJvdjwN3a8=;
        b=bZ61fo2BOMmOHQWNNWbiIp9vT6Yyd3FxfXd0oMcfRFg77fQTryDaKIOFgOQ5FsFvxk
         Zm1PzAStW73PPJpfltSdgbTJ22pFie6diIR2dA5diMXL8jhmALmSCbPR/Ne8b0Dro0ls
         RXwkwmFaIPdJ9u5ioxWH61YSUFxUP2UbvJmAK/p45DNRovXPwzEFBf0N6uRr4/kb/8ca
         YBZcG9YoBDEGBZNzQRRtTGeldO1lWBpmgkM7q1Wu7I2vjl5CmjRjJ2aisW/w08JNilKU
         HgXGy8qkKKgCY2DOpvHaAOX/1aWvsASyU6tkOZDymtZyF8BsiXnBjtXfuIwHEbuuaLER
         UYFg==
X-Forwarded-Encrypted: i=1; AJvYcCX8g/ppBkxJ1koVv3jUnzA6IYT09rZcQ6M5MTc9l2NsGxypqsA9rsLNA12KuPzS71ObZRgwSGkCl50=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVAkrsvtKaYYLAd7LQjg/bzjZAvNk1UeTXpg3tmCh4NMoDssn9
	koAYWvu6d1H1bw24f6GRGIZ1BwCBk68372JKpdE/eFBIT7I5nyDW6y3gm2zW+4SHX5DoyaML2xO
	KhD/myqyoBGh9xKi89Lz+HY6/ATwBJDAriDCpzCRxFNPJuB//Z11XifExEb5Nac0=
X-Gm-Gg: ASbGnct4BLCQZYpeq/r9wKHDQ0wlhrz1NAqzT5qYQP+hBZD/Q2vutHsiAI8zZpVdTJ3
	/PWp0fjrUq1Ickk408POTb0YaIS3tx1oBw246ZbDQ08RAKvMrZIVHdh/3QGR6JeVceZPdHZoYZV
	wLoXwFlHHFvud1OdNCDWPwryuUnMgcvh2YiVInsNNlvfvXEnDeuWFeXJu5Aem2ak5OTb0ojVldb
	QNwTcyntJNxB3sUv15pDfXrTa1DVrpmP8i38lPxUevOsy5uPm6gK8bLJGOi195ogBVBofdlrVYQ
	3vwXTllhHhzjAgtzjbFog/dYwySPvVbgie7606ZJMh429Qu6KI0atdK13TKAdnUm9TVt
X-Received: by 2002:a17:902:f606:b0:264:8a8d:92e8 with SMTP id d9443c01a7336-2648a8da599mr109172625ad.59.1758019638923;
        Tue, 16 Sep 2025 03:47:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7saP1Ar/P6pWa1Kzd2p7ET5TE7rq15TK8LA3rxi5m/8GOCy5RHHsiOzWCFA3FOf++9lRCHQ==
X-Received: by 2002:a17:902:f606:b0:264:8a8d:92e8 with SMTP id d9443c01a7336-2648a8da599mr109172405ad.59.1758019638470;
        Tue, 16 Sep 2025 03:47:18 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267b2246d32sm33122355ad.143.2025.09.16.03.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:47:18 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 16:16:51 +0530
Subject: [PATCH v5 03/10] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v5-3-53d7d206669d@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758019616; l=1374;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=MIs5mqG0clseQiptNt7kkk2bdolwAQ9t0S/sVJLewOk=;
 b=BXSUlSzRA708u8vtiLqtfTP2QhJyxORTxGXMfG7C7FGQD8zySWMtksU4/qtW1zMd03nT7TklE
 Qln2qf6HIawBZ0f2OaakXBam4CHmJp8lcFiELAUxnRrAMG2MvTh5lkY
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: uIc4_L9kFJ57-rcAfPmqt7kCFnxjTdKo
X-Proofpoint-ORIG-GUID: uIc4_L9kFJ57-rcAfPmqt7kCFnxjTdKo
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c94037 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=5DqHOVUeJ4EYgL39aBIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX+V1Sz9B0tgCk
 7ggpsyvvWdsMcG+FKOw4pdiotYWIuGHFNBVoBs7YPkjrOmae/2AP5YxdQxJxgML6L5pC3suPOwv
 23huJwcGEvJSqaa2XRu4ONk8dxIaLai2NtqMjm8N9FUkvZ0ixEVDPi8zjibSEDNvmFubKsiUwcd
 8Nj9h4Vk2eka8lP3QPjCjjWUlXqWOGlExgeL1BBCVH8lmCzzn4mZQSyVPFgZUc5f9Lg7NuFqefP
 fdkAGtWsfiWoj2n69pwV2XD8N7i8iNX1B4vUNyoWef41IVyKvCCRUc5sErx573icJQhP5rLjVYj
 gVRcUhHodRH1alttBtIwgaEd6fShDvVToD626xuPzqwgcp3TFg8xu+HV9eGDcDVVfy1PRu/AsDg
 zdC8FRzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

Integrate the TCA9534 I/O expander via I2C to provide 8 additional
GPIO lines for extended I/O functionality.

Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 4da2c5a12c1f..d1118818e2fd 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -341,6 +341,38 @@ &gpi_dma2 {
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


