Return-Path: <linux-i2c+bounces-1385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FDC832894
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 12:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6685A1C23326
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 11:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22534EB43;
	Fri, 19 Jan 2024 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gtb5rWs6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FD94E1B5
	for <linux-i2c@vger.kernel.org>; Fri, 19 Jan 2024 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705662719; cv=none; b=oJXhORCVQmJWgFMUMNlhAt6AMQbDMspKE+a/7cmPFH0Yva5R+/hb+O4gkJnuFLNCvR/qbPe/Zn539fVANC7+EWSA33r6wgjau/aqqOceQGCXY1Y6boROOQ1FKbhm2Rwe+qXi2/TfKu6bchnvD0HX1qtaSfhwUgRFroy4ida7v/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705662719; c=relaxed/simple;
	bh=yWuIqf8vUZzSTKlBz8yW9cLKwGqjFtk+CU+CFxiivvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFcI5KcMKWF17fu/tJWJWCnH3wAbyq7q8BfwgAy/BE6uV6xJLN8iVgm6Te8F+Plr1uZqq81eJsQsN8CWZOElPWigwv8E6qG0koO7qbFq5TRqCMbAc0DilKQl83wMCcZYSA//UxhVSPFV1UA+Cuya1yrW5jrrAErFd/MdlCJiMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gtb5rWs6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso6860395e9.3
        for <linux-i2c@vger.kernel.org>; Fri, 19 Jan 2024 03:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662716; x=1706267516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgotcyv6wBhXLN6V7LbPKLDpi2/3Hoq5LfRbcHxmUHc=;
        b=Gtb5rWs6uJafhrua5kNsli0lkX7+ukNaJ3GTyhMzmcG4bBY7+a4GGX2UNESnK20D7P
         BRluODrBMyIaEED9RUkeCkxmBWxBx+eyod9nyx8NjLNeCwEYh4OXpVFHL2Rm2vSQ0UbY
         aUH+qBqafEFmV4Lp+fGUYRJ2OT+idCezfB8NxGqWPUciM8B7oR/6q4Sr/AV9ibN7s1jJ
         p3EcItSIxdfsC0V0rNK+Xum+gC1BSwOSDkKTUP3Lk2sX/zhuLJlowoxIb9rw8bQX3VPb
         jcRk1CqaF7WcCqT6tPYcwimeHVpFxj9O78gqwXv4C8zM11380z9YmaeF9Prqrz9eGx9G
         ShRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662716; x=1706267516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgotcyv6wBhXLN6V7LbPKLDpi2/3Hoq5LfRbcHxmUHc=;
        b=qMdKO/GhBe4tSvMm+wPB6sPNkSs0MIzK0UfO1iUpVpXxafUJ3ARQrx/JszT8ZwMTjp
         cOLYPCGIrL5VefbF3y8sI22x0i8TBcw1F31YJqmoVXZJYzF4/i0ATtMruNH955ITbwng
         RP7aw83gtwLincbB8xniMiaGkcNlAA1chkmlR9URqtr+sagAi9LKlqoxkTOOQFq5KXVZ
         24mY7zUfAiJjflNOGhplH6vW6bta6EZZjaSiauV8euDqc9EPVhKVwADPohD9QoZCjD3r
         DtCfgHi1CAf9w4bpt7L3h8e4H97VzCYwVouGpRuKCcmEk6hAH3PeIF2ZlWpA5aBbxJr3
         Mn8g==
X-Gm-Message-State: AOJu0Yzz7wwuattgbV9alJvtlv8MPI9wm7QeZseRU45jwwAv9WqDp8iE
	P6VmHaeX4kIwA4xp062uAJiySoUp1fj4xcyj1YWOWfbOzlg6Z9n8fJQ+ZJhT880=
X-Google-Smtp-Source: AGHT+IFOpbihLWfMf2GioHDTZHU+LDQAEWF13vJ2V013dnNsxpZseCv/sWgDjN14DXvTqQqv3RW4Kg==
X-Received: by 2002:a05:600c:2184:b0:40e:50e7:daf1 with SMTP id e4-20020a05600c218400b0040e50e7daf1mr897840wme.263.1705662715986;
        Fri, 19 Jan 2024 03:11:55 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d62ca000000b00337d4ce6ab4sm3341868wrv.20.2024.01.19.03.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:11:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 7/8] arm64: dts: exynos: gs101: define USI8 with I2C configuration
Date: Fri, 19 Jan 2024 11:11:31 +0000
Message-ID: <20240119111132.1290455-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USI8 I2C is used to communicate with an eeprom found on the battery
connector. Define USI8 in I2C configuration.

USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
selection of the protocol is intentionally left for the board dts file.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 6aa25cc4676e..f14a24628d04 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -352,6 +352,35 @@ pinctrl_peric0: pinctrl@10840000 {
 			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		usi8: usi@109700c0 {
+			compatible = "google,gs101-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109700c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x101c>;
+			status = "disabled";
+
+			hsi2c_8: i2c@10970000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10970000 0xc0>;
+				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c8_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				status = "disabled";
+			};
+		};
+
 		usi_uart: usi@10a000c0 {
 			compatible = "google,gs101-usi",
 				     "samsung,exynos850-usi";
-- 
2.43.0.429.g432eaa2c6b-goog


