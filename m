Return-Path: <linux-i2c+bounces-11343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F8AD39DD
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA03E7A98BB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 13:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26312D29D3;
	Tue, 10 Jun 2025 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGfKVL8w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4FB2D1F5F;
	Tue, 10 Jun 2025 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563183; cv=none; b=EUAGvzesmyctI45QUWK/bkwEEV1jDsEUzBV7Kq0oGeYzklgI+w/8H/cDQS0HYAwdflXx89gv/TPM5dI3v5OQAYKsVhpxPOa4ecns+33I5DwRcZgltu319PjXQct1WSdBuQ2Y4mSwRtuS9fiU9akCZV2yFnTD/KVYAfaFOjt8Ouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563183; c=relaxed/simple;
	bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2eB/g8ADZLH4El1INOWMKvl9M42NSp0P21h07PcYmF/ItCD31W7jclD1ZcM/Fs8ZeT020qYGvtdy9J15jeHpqPJFw0Yu5teuMAj5zJmTFBWrRjzW0WM/gVjfxTLbxOOkTe2ryBXcrLo99UREeQIXDOkVWdjFt3VroiSIR2xvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGfKVL8w; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c3c689d20so3432761a12.3;
        Tue, 10 Jun 2025 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563179; x=1750167979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=CGfKVL8wTuU/PsjssuVLH4C4OCY32Ifk/N78Qa+7ijfMA8cmR93x0TGZE78/IS9Aaw
         O4XT0D+u2J2R51wqQ34HI1EAlmMTyxpw/g2a/tlCWvi1IVQF94yafGA4ZNiFEHkmEs1M
         063mJELU3ovIRzrUxcVHYDpHwcdhky4oM9nQ8/EWqxQPGr4sXS+L3C5fDibpBZ4oXf64
         5qd/WFZXdxk654BdGwbcEhYErD0Os4k56+T3AgNUNl97Kq6Buze85gYPk3eW9uOiHPK/
         UTWmBW0OK3K6wcMtn40gg1yeo/2Hs64E/gwOaGQ5iFyXEhpGOVA6rFpcAUKM1U7fLSFk
         BnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563179; x=1750167979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=qv52Ng1hKSC1FKIB5fjrVNdH4sD3Ml4kMkav1oVPk0qkE7c9hOAuXRLPKaGQpwCmAC
         JoS9xj1HsdZVtVF/ySdIeDWgE1FcAa7Fwm9Qyw8ZxcMCL8Nh9dcy9TRxR+I7hFxJzn0R
         RRoz4hTyLqfD15DHOzNGLC6oNnagwb8DI76HNZFHGVXRZ4u6aTcpSdUqEn3ixE5fuf1h
         iYeuGrou1ZvN/ZYAKyW1Lsx4nutTUhIWHlbWE+34ROSwaQGKjcO+iy4u5Ftg3giFgzzO
         y+nlH53e7WKKTZK2tQy8xvVYOn7SYVzXy9bwxiRw+0+wV88iKEuxZgVCnOb4G3LRM7K3
         drlw==
X-Forwarded-Encrypted: i=1; AJvYcCVQv7g1r4zV2/YD8yoWbEpHc+50FTFxx2t2XulArewlrfj5uBccnhEBKy0sFpgSWYgUFoQBiyC37JJo@vger.kernel.org, AJvYcCVzgsTDvKLos/de6jrz1HASfYcQ7MxQuFWzk4sbGLYm4b19sMCR575GX/pKB0AsIDpGUz/RCSr2ufiuzHnq@vger.kernel.org, AJvYcCWU7PsuJGHRjnweGmRnlkK8pCGvNgPgzAdGnTiItDQOTHGUuMB0iZ/ceAvEL9HeA8jsq5deEra5m3JQ@vger.kernel.org
X-Gm-Message-State: AOJu0YySROHtg7VX8NXzqVBe3ugYIaJ994M4bEcAwXlktw3CJ4Y7ooY3
	VpkDvv3fXdp+yLl7Vyl60N/5uDjator49tCirEFgycLFDnFkA7VncLQC
X-Gm-Gg: ASbGncv1F4mocIgJjUZo43L3KAhlOOrJl0n2VY9B/qS7XQrwCdviO8mmpeEWs2xYq40
	POkiMAkGVfbvcIsvUAdzpl1d6R0XqrZzkt8FZEyJra9q2plPn0V9YZwOVhXvQGmjZDGcjMZ6L77
	tKDSbiLfNUBuz7EUQkFrNlkXEDRGTDq9eGKiUOWZlW5IOr22aK02yW/72+sAcH8RjIsFDhOLrsV
	S04mbdG6gKfmpgNJlfm/GvkbiGF71fa7nOlC34I8izZuVVqcOtswvVZKVjIXzCYy+EmyGhUefD4
	IvufY1W36FDn2HEZnvt2BngHZFqIkeFFo6g3e9A1i1q00LbVmkqJGls2BZOiBem81rH9W/bcEHc
	=
X-Google-Smtp-Source: AGHT+IFctLqPBuLJF6Nxsz5V/0JaXeCXOK3nPmNtUEuY/xg3IxZOthUn0avC8QEHugYTj8Kz3nPtCg==
X-Received: by 2002:a17:90b:2541:b0:311:f05b:869b with SMTP id 98e67ed59e1d1-31347798ac5mr23723759a91.30.1749563179250;
        Tue, 10 Jun 2025 06:46:19 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:27 +0800
Subject: [PATCH v2 8/9] arm64: dts: apple: t8011: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-8-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMsQdFKiLqPwEA1tJnzjRoKFEp0AQi1eP3z
 wi6m1nq0HSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JEoWEACte2synddwWI8BNIKdj+WoQ/wrydjezbkYaP+CKwGuQvmTW7iQArURwkFLc9eqT+XOlwk
 d7qSM39EiXpQIxp4DGk+TWCQUpYlnyW6eD+uyUShC6zPbvRR/HkNIXnvNqP3m+mAPWUPZ3dA0tH
 E/Ir4lOV4idUgIr5kotrt/kli8Ot1bDi8PKWw6COcNvWIlcwB81ZDgmSBRNoulVcCh6FnSDmz4k
 KrVKZum3yekd1dLiHBbbeS5Ph77/sR0mFk3Q5c0gOV/bPxI+syGUMgp1VQo8OQdhs7HJvTHpwbG
 QGe88RlEyRjxFIx8gQoy42tKE2sNcHMgczf1F45MkRaVJON6mIJ+hqw8R6iNOCjeAFGvniaVZkj
 6Kzo39oQJd05no+mYMtasdjxbS5U0nSEOODdRCgKiC8bmV/RoMRsAG8O5CbXAAx7qWQmP+J+FUa
 TkW5qG1upQKoUunNXM2cwZKKRONCwCmCxTTMqrroVEPgi1a0vv2uJZyuqbUxlSd7qAGV4HejRaC
 8YntqXNp3i/pbHSe42+5VqOqJ7/2aq0vjQoF69Yi/wRZtn2DNrAeVw5ZkEriw10ea1vbE8hs2xN
 ACc6JPZ8QhGLyZmzqMhzlU3sBUYaNp5SgZUhS6M7rxmezhZE/+dnYmtA1Tx8mQrLmchz+QjKZTt
 KtUhYdoSP/vhqaQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 974f78cc77cfe28d3c26a52a292b643172d8f5bd..039aa4d1e887625e7b6ad789bfd9aa032dc58d01 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -168,6 +168,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 230 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 231 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -204,6 +260,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(211, 1)>,
+					 <APPLE_PINMUX(210, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(156, 1)>,
+					 <APPLE_PINMUX(155, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(58, 1)>,
+					 <APPLE_PINMUX(57, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(158, 1)>,
+					 <APPLE_PINMUX(157, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


