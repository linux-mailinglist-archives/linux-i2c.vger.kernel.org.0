Return-Path: <linux-i2c+bounces-12963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F381B59414
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 12:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 352B04E12F4
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 10:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531472D0617;
	Tue, 16 Sep 2025 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILXFi8ai"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886C2C324E
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019637; cv=none; b=HxkGY+PINopyLGRdmCJo3FARFGMhJ0XqoLe32+kHrP6uHiektkbyj2Q1A8R60d6iEo80zBIPRJxpzXjgqg/CycAYj6mXQcr6D2XPyIo3uffMpAOeGgKLOvzltEisEzSfBIOWbbr2qYHv3wUkBqoAq9ztbgKam/kiWcz067/5zVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019637; c=relaxed/simple;
	bh=fa+ov2f/0xh12Rc546amD99lGVlgadBm8+mcInocPig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TrK1870gg0TVgfmOOnjg0kdei7yU2yGsUpOH13055FUl4/SnGjUEm6rEUfos1rwy81NWllpjHFxWpjRI8hoY8Lf4aBmrmbLOQnVZrVqbzkuNJfCWAE2ejDapP3OzNWwz0j0TqfMmOTocJk15s+hkro8mQz1iwRg0e2iG38Q9E4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILXFi8ai; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAKhQh010694
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajsFvmL99uD4xdhW1XhZvWHm7Pqfov1TAZi2gC2+njc=; b=ILXFi8aipRGdTx6E
	GAkQSO8okHQyzkoiUP8UACtxOHp5QmmkLIm6AI1jRwywh54UPWwxqCTze6Lh0CHV
	yXgwg3Rge8fWmNImdnc5YYyQUVxYmZIfgUIimIZ5UfJ9aPwFsRJBdydpNBUwPTka
	3KvTCuICqK0iDa2Klw8cVgTykEESa2hYVlgwUQY8GmjIJt/SzCzhBUjeWekXCj4N
	X9srRLJH5no/3bcRmxpiSengFO683jxbC3m/lQiB6EUGbKWarYOh20XYCWpvF4MS
	Nd22xmjgXaIlL6nMqSfGmfdFnHg9sqYmiRqRDuQrwQ2WZJs+KgXiEDyZ/8GaoxU0
	IZNrLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snrc6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244570600a1so59346505ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 03:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019634; x=1758624434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajsFvmL99uD4xdhW1XhZvWHm7Pqfov1TAZi2gC2+njc=;
        b=AQzsDq+UZWN9DhIZX73ky9UN+7bGoKJnEYMUTYeu/DQ8DyvhNWTY/VcAV690+cKQtq
         vv0ASgiyh2jtECP5qK6ibLn9TUqr8kX8ol7ECtaOtcbigTYI/HSUEXxzBs+xLG+vbTpZ
         gfaZi3coLMuxbuTOMbkIJc5dYpEmcUqy7wde1QTITYCZBrCDgzl0vYhtPob7Xximmpv1
         JoIAZ4+AzzCIjAtM7rL9aZ82Mk4Ao1xNRLtcKT7Gy0JK11Rh9EjZWzM7dWwKF+rqDAmy
         ae4Q5gZWfS9sYe/gETmNwbgQXxxLIz+xNHJwfJvm2JkOBw7sKhTzR1Jf2jpqFD2SK2pm
         Tx1A==
X-Forwarded-Encrypted: i=1; AJvYcCXuQKamI8Eo0pHl+R2O1YC2QfMlXAJyijUyU3RuZ85a+WeYrI/zpZySqUuFKmWZpcGLkjA+YmMq3AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYUvjwKg7fvnbb8XMWy23hKcXVkGgeeVNl9kcjM9NqcFS3UKl
	Uu5M1SXvbv0VTMcfnUfLs0xjYaT2xCD9pYHmzSp0u3GAGHDzVCe4uYqQWNhGiKE06w0St6uZzRl
	32iP0VqEp+2AGnWzLshrk6Xv/cZ0Rs26IIiYhOMLcsCrKc84xSTUIPb18I2WGCLs=
X-Gm-Gg: ASbGnctM9NiFDA4rAE//UVSmLCzZzvDWLp0pTTlLYNDBK+ih217nT1OUwwlVOkkq/yi
	Ecuv+vtUMv22E00oZnw56/sXGfwVT3EM99podPadeZLxG8XLs2pDRGWN688NlZ0iU4JLQva/EWa
	r2wlrwgKcuCuDygm9zuvTj3C3/zNKosLRckOA4cjEPHUXABBXMVM1k8dphvcSzS+Yq5IrlIQjGf
	wBVJxZ4Q3VlRU5XK+WYK/30gwpUh+eFnk6bTHnXErcuoiWh3p2S6CAHYiXu/dFVLXlfLAGyT49k
	jwLolUYDAkamTokgqe5Ax/rS4DAkiefLgZ5jqpsikulSRz0bRUO8yLjohPMmf1x+7ZOK
X-Received: by 2002:a17:902:e885:b0:264:f533:75d6 with SMTP id d9443c01a7336-267d15655e9mr28942375ad.11.1758019633702;
        Tue, 16 Sep 2025 03:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/4CUe719nQ683Yr0dKDLjFmhdTjEL3p/FkdG21uCVslhSoP3TomxcadrneCbSYPW5Fj6HVg==
X-Received: by 2002:a17:902:e885:b0:264:f533:75d6 with SMTP id d9443c01a7336-267d15655e9mr28941955ad.11.1758019633197;
        Tue, 16 Sep 2025 03:47:13 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267b2246d32sm33122355ad.143.2025.09.16.03.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:47:12 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 16:16:50 +0530
Subject: [PATCH v5 02/10] arm64: dts: qcom: lemans-evk: Enable GPI DMA and
 QUPv3 controllers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v5-2-53d7d206669d@oss.qualcomm.com>
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
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758019616; l=1269;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=T1vtGZ+9t7qs4O9VgCmpcKFucROH+/+ubYN4R4HcRDI=;
 b=dBFSA5n41tUMXPtLGrYRzeqkG8NtFDvYbBF8HxzlbuGwFV0TvPYcv5/JfVBRB0hhAOfXvsW0F
 KBKUx2dl/A1D63z8c741ZhAJCqd0uAni0v7SBBBjz6GK30FL+2MRqnk
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c94032 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hGGMonP7TOO80wKNN9QA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: b6ySqG3UMVHHwCd-EZurHJrqmdEjS8hn
X-Proofpoint-GUID: b6ySqG3UMVHHwCd-EZurHJrqmdEjS8hn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX/EcQ0ghrcyC6
 DbOidJAQQXCMFzmpV7dk4NGee12fhu9OkJT6Z+sh2u5KnpmQJ7hK658XAEHdslVu3cUu4FuqeAp
 v615ucCiOE1sk+hJ8az6Y7/sPkkgGs3rEgPqVp0YBb7xs5Nu/VNu3o9ZYTWFDMEj4C8kjMS8cxv
 924ghOG2SPvZNdH14Yny1UVdaDpglYGvl73mBi/pUvznlG6UkhIed/wK2mGQbX4c6ajIV+X3w/2
 vkQE811d5g9a8qdFsYzCBmJe5Euam0LHOdapq4tTVDe+HzJnC+AOCYwa2cRmguKLekm3QZNcSi7
 uhOEl3Y70IfFOpkND5nlnRzvTR3Y/aQ8uNXPns8lsOXxYU1mwJtjN+Q6YaWiSYjIlPQomxCr8fV
 k/nUJXO+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
DMA and peripheral communication on the Lemans EVK platform.

qupv3_id_0 provides access to I2C/SPI/UART instances 0-5.
qupv3_id_2 provides access to I2C/SPI/UART instances 14-20.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index f79e826bd5d4..4da2c5a12c1f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -329,6 +329,18 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };
@@ -375,10 +387,18 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };

-- 
2.51.0


