Return-Path: <linux-i2c+bounces-11342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0784DAD39E0
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9726216EEE3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 13:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C982D29B1;
	Tue, 10 Jun 2025 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWd0kapR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F9F2D1932;
	Tue, 10 Jun 2025 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563182; cv=none; b=f4ERQooDQTE5K7ZHLEQugiPW44NgpGbiOCGxLP1o5cbtI6KxEEjQ3tw599DZyig8K2mVgQGq8d29OkrhcXmct6yXy7JSQ0xjJBVICKJl0869k51HqNUMNbKCh39m8JgNR3ei9lT+dNhAF4JdmmFuGfwDoZ8KSYyOEI9hjrdIlgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563182; c=relaxed/simple;
	bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXIdrztMr4rYa6WRTd43YoJVCzTrPMTdonmkjcmptp5rspDScFY23vG9f9WIJCtWFTcY8C4M/nwT6zV8VkAvE37Z88iWK6cafEQNd9N7tC5Mb+kuoZ8E/C6BfzA1eIRkTjMzi+2ib/Orzzav+zLW+x72t9NTs6y0KlZXB1/Q1MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWd0kapR; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2e8f7ca7ca3so1876198fac.2;
        Tue, 10 Jun 2025 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563178; x=1750167978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=TWd0kapRN2TvP6eVMPTUjou/DyVwsZYJ2VbPtOQeq+Dcb4fDC+n8+cAPWFdpV4mY6V
         V0zrq8wYSj0y3Q6czT7Ds6cx0YgwAja8erxUQvSamhkJwYeLoFIO0Ylfb3tL59qlUYY/
         OEEbhwyt+aE87rO4PU1v6b9A7AygfDxH/Is9ycqkTk43A0x2Cdx6MoaPseR/Ofz0xxj6
         DG0mwiZU//idMZMh+DiZJCaAt7SvtNr/P6pk83tLdKYyf36pLWiM6Ka+aGMCaNpJcc4F
         X3AamrpOMRjZZ36b4O5S5fDfTSeA4+wrQBRcMm1jI83Mj7IHJ+zDIc1ShynaHGPZGEdO
         jFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563178; x=1750167978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=rKFZvfqnYvvLJW2HE7voKS1pFk3+AMwRCBY6zpiLQqnDx7CMQSPg45of0tIa6Vk8ap
         RRlqE72GxEdg0x23mxTuyELR5VUdEhttm+NazT/Sa1OBvJwb0czQMVNteTFF2PUFmzyF
         Wr3gPWKElARnwxzuQxzIIuS/53+8E6vD0pkz6sPh1MBEwQ47ktSGZoAji7oWCYs9hdJP
         biZ7MQfNC5ecWo5w2tA+AEsbOnNU1BvHOHklYNd5DBfA4+fvy4nGVfkPUBdWz39590ek
         q/txas6CWr+bpeCNKkX3vrkd7+XLo88alCvra55UfJW9Nc+ISTS/V8ZSzORgzBvGl1b8
         FqYw==
X-Forwarded-Encrypted: i=1; AJvYcCVvXBQHp08wkBEkVaayeOq46yXlCtrPxyuHx7BnkvOwMJC3Nzodyw8RoDExCBVaofVnWSjLCI4SMudQAUjQ@vger.kernel.org, AJvYcCW5uVEJh4Pfh9i8y3kYxroTGcAD5A39qZHwDbdWflKdqYMPLakx3msTZITWvEyY9iKw8YHkd3uEq8dS@vger.kernel.org, AJvYcCXFb92/CT1J6ArdBbTe3nwgrgabuzb8BjmwVoxysnY1yWFMf3Nyla2/ULMv9w4PWNRzocWxKoLKdy06@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/a/4glSDaW0dFralZSoYfTweW3AViA2DxQ9f39EZcVpjozTn
	OORGAQDM0wba5mA3v6dPvR/TIx1UKpEHyty/z9glTTw0e5KqxKOc9mftBj06aQ==
X-Gm-Gg: ASbGncvsxXd1opRPL3nelCHmWoisZ5ZXATDtygnCXs6rJIq/ErPb4oXEEoahIqOPSQf
	ZDkvODHaZk1wBDCDpCnD0vJnlAsHSRekNSyDvlCYdTSID/xx30Fu0KXpZKqAoKvu6skKqMmWYGf
	Q5skXKD6/PSaYfTHcMF4RRcBK8r+0S25c7FjwdD3jufCMd4qmqid3uvAskG2u3010YLEj+vZOtl
	hQa5rO59B+Ne7Aoi8eJZo9xKRuTNzbg0xMqn9pGAl54cKH94UMynBnGjr1HSH/58ShEU6F/ryKC
	u24x4tz95iKwSmSP7p2NRyA7zU1mPTkM8sK7LTBOMdc0iDyNdGxt3ZViQgGI1yQZ
X-Google-Smtp-Source: AGHT+IEfTFb8zgj5xUPi51FTzMoYyKfdVF7T9yXKQ/Lb4kplJ4b51oTC893O7qoQI8dAZAqlSerVrg==
X-Received: by 2002:a17:902:e890:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23601cf6b9amr266199995ad.4.1749563167284;
        Tue, 10 Jun 2025 06:46:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:23 +0800
Subject: [PATCH v2 4/9] arm64: dts: apple: t7001: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-4-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLt4kle8AckLpFOCx/plMyGBuRFTCnZMMKh
 Yc8QVDJIRGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JNSOD/9j5hbFls9qcicL2VPhhzVe3osxN/UrGFIGMw7IHCf4HaJD0w1gRhXh4HQjyKvvX6ZOwC+
 qkUuhmvEtEZpC4xVYcGOtF849vuzTOW08lbX5Y4bDsqGUqP9fsUDDfMowyP28ife2pSrZZ9AEn9
 JNT63c4k+mIUqZb6C68vu0qhleMZwjYwXZNr3KNIg8HtBEs8TRr2subs7zMShRs5/K9YaM7e/Dy
 76WV9y31DN1Kq3M1W+E/F8BldoP/cCfKuKbIgo3o6j0Jirn2gIS6zUBecbm2pN9SbWM7wDRPo4K
 MbBN8aujAiXcmUdYT9oiCv77pJ5C0N9LU2cV/x+v67Bnyw5JMsrIiLvVTlrUrtGi32wMiEpKbkL
 64GjbuSpaBB+GFvtcrEZ4z4P62IsFLURKMJkwBNi/hEh2o6xxlT89pWPjyi4gXmYZPGj1sSiuAI
 6P9q3tKijX4z2JVx6mZUiSL+Ps3VzxxrPTHKoJfE9SfoEJ9KN0RhDeMiLD55RW2nPjsRssfHMob
 dNe7qR4qZd/RwcFpm/ra059PmWxbJeBzSY/Auhs8Dw0MuJr6Hf6lRUf5w6tvK8qTI/JdcwZjnFN
 ZmfSeSZaZa4clQ1vxK4wZm6uhJFg9y+Oyv6UnZAXzMQQhRDtuR3SD2iEqMnuhwt7/36vK5v++LX
 uycLH/+4NU5eh3A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a2efa81305df47bdfea6bc2a4d6749719a6ee619..e1afb05423698223ebc15f2ae347e73fb46c7c24 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -144,6 +144,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 174 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 175 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 176 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 177 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t7000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -188,6 +244,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 66 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 68 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(38, 1)>,
+					 <APPLE_PINMUX(37, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(66, 1)>,
+					 <APPLE_PINMUX(65, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(133, 1)>,
+					 <APPLE_PINMUX(132, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(135, 1)>,
+					 <APPLE_PINMUX(134, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0


