Return-Path: <linux-i2c+bounces-8885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E077A00854
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E54B188470D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 11:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAAC1F9F79;
	Fri,  3 Jan 2025 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3b24vBUc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816A1F9F45
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902728; cv=none; b=E9mXnbfp8IUxBWUO1yC5ahjQwCsO9LhtU+kWoB4MyNP1oZyMVW0IvyFGtiHJ/FcYwP1b27I39HCZQWnufdh7VB3dLbyOH1ADVQTsxtvcPYteA421OvExnt9uFB+kf5xwdEyEjAiM6J/1WDi4y/wXpyHnGKeQWTBpKNGOsWVJ1+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902728; c=relaxed/simple;
	bh=9syiHfl5bY/+ZuerVXu4AD5kXE4TCvFe03fyh8+vtaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W878zzf6jicBjtDsZ3m9AwXZ8j958QeKi/pWYzY2c2Ep4h0LWZLBK2C7RRwEyXr/+pV2wQ2BHL83K0A7Rkpmkb60w3yTRktmd1VSlSAPHq4nFiKG3RXNxMHitU3PP/Rh4Nr7ffjsLD89srY4x67xiqMp+KYxHTMS8BjYvx8757Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3b24vBUc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so16296763a12.1
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 03:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902724; x=1736507524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kyyf31REfBMa8hAbzxypYy0avukSxSn2klPnuBIRiGs=;
        b=3b24vBUcshzLE/LS9XP6AgERDFyybnplw3BHqeg9YT8j/s+X2ylkf6lh/QpH2m1iOl
         ijBbX7EZeslfKwbFGKI7C9bzL7GHDviYTgWnRju7YQdxfaNGwJUzCZzvFSWcopZFx7xL
         aSlUrYwwdbZ84CvvjUj3xQHkZGxYZu0JMae8SdpJRi6fqJEnAkySqfwO0OT/7hjlR6mc
         ygx2wkq1ihUCfTV2Obbvspey5NNvIHgYz0D78IDLF4rKPkvP8gOxhrTpNSyvm4tiM3TE
         mT60zcQmCb0Of/kWBO5f2rlgPN40UdbZdAqBDPtGr/5i/wNcMPoLv1n9vXBX94tT6uPc
         d7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902724; x=1736507524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kyyf31REfBMa8hAbzxypYy0avukSxSn2klPnuBIRiGs=;
        b=kSV/G5UEHag6qMi7PMy4ccITOGaoWQkZd8Vbo/QLvdG5ZhEKabYre29oqWXIVYDDQY
         q5baGWM5JY4d65JK74/FFd+4yvSB9DAj5o3WXDW4VxRj+SgCQJNr3ux4v6fNsukqNKqA
         kU9B9fQIH4nHPgj7v34iQjJu+3P5fq0HN09i7yXfkBEjKQcUd3+RdmpdMiwyqPXmoUXj
         2aAwIl8UyyrhZR/YvkRrLF8wVg+k0uUR/j8GBLdZXYILcQ5HTn85XlLLY8dvLplat9Jh
         DDx7GawwD4zD1/PlqvnthQRkSo02Tou+gHXknsGwpzgIJs4NIlvJaYeshXrIrAJEmIOb
         T9wg==
X-Forwarded-Encrypted: i=1; AJvYcCXXA/uj6iuroQ9J/VM4nw6CE0at5C305GfuN1XstT1Wothv9Ws/bTmxTpfnp3WfzW1H9wk+SLio89M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzICxme3LKuoyqEjJ4ViZrIy2Y7w+9Ku7u50UTaQJkAUIq+lhi8
	Sq+YFADSA1yL2cmJbmkbJAChpy+iEozUIaILoVYPbGZwGdwD1Njx3u3k8xSgH5s=
X-Gm-Gg: ASbGnctgebnWzr9hHRyd0rfInsigqRAZkhIcDAyjFQr1xF9NZ4KuTKjmjd7YPEeXZj7
	CVxV5xYNYpS3ElPcSpo81hwGOsgROOxDUOz6T58bsglI0iLHxtCHFvtyUVLRiwLRLlTg/eCsLzX
	QKU+JmUteMfxYYCvfAA73c7gwar+kSDNZJFwzRM0qxpowswohLqjOHaSI2q2kD+y5/tDXNH0hx3
	x1WbfFrFXaZ+9tlVej3WRJjnF9g5Du5HzYohFKtYyKQx6HGm6rxcS1aVcDS2HP8c3fcKxrK78UT
	g/vDUJshWjphFRc1+k7mvZ7u4A==
X-Google-Smtp-Source: AGHT+IExS1Ap2K4zFzqvx1Mowb2othcDl78P9thYUgfIVS5DcvEsA3VQ8fR/5weNv3Ey9SlGemY5ZA==
X-Received: by 2002:a17:907:7e8c:b0:aac:2128:c89e with SMTP id a640c23a62f3a-aac334f31fbmr5007224866b.43.1735902723800;
        Fri, 03 Jan 2025 03:12:03 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:03 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:12:00 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Prefix
 regulator-fixed label
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-4-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the common vreg_ prefix to the labels of the regulator-fixed. Also
make sure the nodes are sorted alphabetically.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 60 +++++++++++-----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index fdc62f1b1c5a398abaa71818fdf2858fdc445d28..cc1f89a4015218b0ea06811d2acd4ec56078961e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -108,6 +108,36 @@ pmic_glink_ss_in: endpoint {
 		};
 	};
 
+	vreg_afvdd_2p8: regulator-afvdd-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "AFVDD_2P8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_ois_avdd0_1p8: regulator-ois-avdd0-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "OIS_AVDD0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&tlmm 157 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_ois_dvdd_1p1: regulator-ois-dvdd-1p1 {
+		compatible = "regulator-fixed";
+		regulator-name = "OIS_DVDD_1P1";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		gpio = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_s8b>;
+	};
+
 	reserved-memory {
 		cont_splash_mem: cont-splash@e1000000 {
 			reg = <0x0 0xe1000000 0x0 0x2300000>;
@@ -134,36 +164,6 @@ rmtfs_mem: memory@f8500000 {
 		};
 	};
 
-	ois_avdd0_1p8: regulator-ois-avdd0-1p8 {
-		compatible = "regulator-fixed";
-		regulator-name = "OIS_AVDD0_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		gpio = <&tlmm 157 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vreg_bob>;
-	};
-
-	ois_dvdd_1p1: regulator-ois-dvdd-1p1 {
-		compatible = "regulator-fixed";
-		regulator-name = "OIS_DVDD_1P1";
-		regulator-min-microvolt = <1100000>;
-		regulator-max-microvolt = <1100000>;
-		gpio = <&tlmm 97 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vreg_s8b>;
-	};
-
-	afvdd_2p8: regulator-afvdd-2p8 {
-		compatible = "regulator-fixed";
-		regulator-name = "AFVDD_2P8";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		gpio = <&tlmm 68 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vreg_bob>;
-	};
-
 	thermal-zones {
 		camera-thermal {
 			polling-delay-passive = <0>;

-- 
2.47.1


