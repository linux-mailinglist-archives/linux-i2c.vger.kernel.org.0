Return-Path: <linux-i2c+bounces-5503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C4C95686F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6137EB22C62
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906B616B75B;
	Mon, 19 Aug 2024 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZTvU6+Io"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C616B39D
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063064; cv=none; b=hS9Y86G6L59Ycn1DWgHnakv9MaF8SDb6kRKecw25RQgEWcBUS9LmWdxfLGe+jpbCSEBteUgC6uAQepcsLoH9TgufQmLoTSvzoxW3JqXG7ngwshc+WNWb6hWbTvhvmrIA0dbfk0l6kQAfHVU1CAse46fPXmSiIc/C8QISu1USANc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063064; c=relaxed/simple;
	bh=J+Ll8gvdSzt5me9X3xeJZUm2/bi1hekPdlYQ/s71H70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ug2YYqCFoEWcwAdp2LpUuwMLLcc+NYVGryrk4zDhji+ZFaKyB03BT3jWsVDcpIV4TE8gMXW9hHfpyvBPrDRWywlxHiA6DtrNumS/fAa7riqbwmnDWXipuVEKI8k0eTVBrhQd+Fjq7jHKJVO+4rsVV8zuVVoPYDnN1kG3kFs8orY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZTvU6+Io; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-371aa511609so1141914f8f.1
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 03:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063060; x=1724667860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEQ2/0Ys/kUDcIHB624sVu2g3VlOobqFsN02Wkldx3s=;
        b=ZTvU6+Io3lw752UsLHvZgPBEkqOxw2XC60dujsFZycAIiIOiIboj5iVCHVMwkWRO0m
         u+w2l2ascB6Zh6ATmEtImgt5nGw6vMIw3uDB5Or19QgSMnvIByVO9iodQGP5W7oDyfXa
         /7RxwJNbTpuEzJqOv2OIl2SGRNv0kECw0zgFF5VBXSY6AkYG6JrOjpUOL5NOOZqwwOvg
         QXa7ZtPCfnNQ9qPiZFRZlLcpP3EvjDPeU7rhdC9qm7kJuEMeTLFBMxsNWNR1aQs74xcp
         eJGh+X5sTejMys96WXextedY93BOIwcxFMR0RVKGc3cMLZRSbTGhJbfpEqwP4c+lM1DX
         RQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063060; x=1724667860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEQ2/0Ys/kUDcIHB624sVu2g3VlOobqFsN02Wkldx3s=;
        b=Uq4AqWXvjY/hbR/CW+16pt8sJ8jnm/mN40DK/kFL0IbKeNjzWekhdiml07Mx8bp4IF
         bKxZ7f3Rng4Ks6ej80hKIzMgWZAGSCQS6V9ur3KnZ3ToDihwmWf5jwnhVm1Le0DrrW7u
         Mza8NSfPmGCcT2Zn7oxS6jbRgdyIOe7s7gaXM0Jlut3Cfp5f4RyVb+JiEP2c7tu1MbXl
         A4S0sbT5a3rkuu7MorzN4Yok7dZ8wcu5KD0RwBOrbyO46ZN84120hm9vWhVzcIuyVmbo
         yGiGU8rkJeAhK2+ICXhI8+8PRwuxNUrHkJ9EZlQad5s/Ya3VN4iRdxO19m3MhcIFzpcA
         p/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWo3shlEPn3Qd2v7uEIE89nbx5WNwoUJOrWHfIwQ4mFnFuFQ2N8ii+FtxuWqO1sDn4bR3nUMQ2+XkCY/E9cXvNf7Pw84A56TvFI
X-Gm-Message-State: AOJu0YxuzL1FD4AwRQAEXbzoQOwPGVGa6bVIO/7zCNx2whjTZY/yBJHO
	y/dP9CpPnoE+UBjsVYDH1xOiflEI9ulFlNRj2VrXxedwmnadN2M/z054126r83c=
X-Google-Smtp-Source: AGHT+IFoC6Kt1hpF4tw9HOFdMhYxyThmmbACWlKfNxIW1LdfEbWAXLUnyIXi2nGYcAX9dhHn3F3UDg==
X-Received: by 2002:adf:a35d:0:b0:368:319c:9a77 with SMTP id ffacd0b85a97d-371946535f5mr5583161f8f.29.1724063060119;
        Mon, 19 Aug 2024 03:24:20 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:19 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 09/11] arm64: dts: renesas: r9a08g045: Add I2C nodes
Date: Mon, 19 Aug 2024 13:23:46 +0300
Message-Id: <20240819102348.1592171-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S has 4 I2C channels. Add DT nodes for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- dropped renesas,riic-no-fast-mode-plus

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 37885cd24f16..e44e8949e22a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,94 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@10090000 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090000 0 0x400>;
+			interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C0_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C0_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@10090400 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090400 0 0x400>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 272 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C1_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C1_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@10090800 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090800 0 0x400>;
+			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 279 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C2_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C2_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@10090c00 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090c00 0 0x400>;
+			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 288 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C3_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C3_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.39.2


