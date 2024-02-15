Return-Path: <linux-i2c+bounces-1760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A28DF856A2F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5307A1F2418C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A148313A86B;
	Thu, 15 Feb 2024 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y7ujlrIE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DC31386D9;
	Thu, 15 Feb 2024 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015965; cv=none; b=sRw1z5j4G7GbqnrxJFoRc0yxpitzjO6qOkOA8ItIvmARWjgFFzPlAbnzCe6qjB10ZY4BpnJsLvsP5dtZ9+71bR+4SfI9N8RFR/rXUwO8CoZcPmbyfo8ntmlEELw/S4qh75Yjjcx/APEX7WmD8zwVbThyXIEgvRgE5ojURx7qU9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015965; c=relaxed/simple;
	bh=EvNNAJ4FLw2TdZTmEtbF/CsYEiSbYHIGVMlQDAvUs1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LN+TMhsCPSnBjp4SBqFtds2exMqN78n1YT1c1V5/HIOEQmXuYci9kVDKb9ACAsnjrbVXT81AEGY7U4rTieOJUmuhr0xE7cIsFrot5Z4kOECbm7+mWEFNOJR0ld3Vk7TusfZ/lEAZECHLN2ZqzXa5ljcA+P+JGWIRI2XGMUqAUlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y7ujlrIE; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E83BE001E;
	Thu, 15 Feb 2024 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Px9qo1HvUr5olFrQ1nOOstVEeHWjhO/DBvDCPvvxF8s=;
	b=Y7ujlrIEuHebjiO9uJQtaBiRcnl8u1lucN/m/URQoFKYdR4MPReDgrHYwzijzVQ1uV7Gs+
	/EbyxFhgt6Iovz6TgCxvf6H6zLxvjOY+TxDUOKesdl43ZtQMu31ePeSvVrCZ6VhLtwrlgt
	Xk3nEV5rSYIBV1on4PW0DydGl2e3seIrAyRJcBygwzec/j+RZ8Uke9FfGK8aeDoFus4yaq
	i5hWhu3YWWd4KgH3jTFlzYM1rM2Ut3I0rYnN8gg/0/BA5MsjwMbj8wAJfUXtklwhuNHpo6
	8aaqaWm2LBRvxnv+jeetk44Fv+xMJQF1uD6FoELI5ZGouxg85wJvXnuYPnQdIA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:18 +0100
Subject: [PATCH 11/13] MIPS: mobileye: eyeq5: add 5 I2C controller nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-11-19a336e91dca@bootlin.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Add the SoC I2C controller nodes to the platform devicetree. Use a
default bus frequency of 400kHz. They are AMBA devices that are matched
on PeriphID.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 70 ++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 8d4f65ec912d..d27e164f0fc1 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -70,6 +70,76 @@ soc: soc {
 		ranges;
 		compatible = "simple-bus";
 
+		i2c0: i2c@300000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x300000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 1 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&i2c_ser_clk>, <&i2c_clk>;
+			clock-names = "i2cclk", "apb_pclk";
+			mobileye,olb = <&olb>;
+			mobileye,id = <0>;
+		};
+
+		i2c1: i2c@400000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x400000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 2 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&i2c_ser_clk>, <&i2c_clk>;
+			clock-names = "i2cclk", "apb_pclk";
+			mobileye,olb = <&olb>;
+			mobileye,id = <1>;
+		};
+
+		i2c2: i2c@500000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x500000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&i2c_ser_clk>, <&i2c_clk>;
+			clock-names = "i2cclk", "apb_pclk";
+			mobileye,olb = <&olb>;
+			mobileye,id = <2>;
+		};
+
+		i2c3: i2c@600000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x600000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&i2c_ser_clk>, <&i2c_clk>;
+			clock-names = "i2cclk", "apb_pclk";
+			mobileye,olb = <&olb>;
+			mobileye,id = <3>;
+		};
+
+		i2c4: i2c@700000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x700000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 5 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&i2c_ser_clk>, <&i2c_clk>;
+			clock-names = "i2cclk", "apb_pclk";
+			mobileye,olb = <&olb>;
+			mobileye,id = <4>;
+		};
+
 		uart0: serial@800000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0 0x800000 0x0 0x1000>;

-- 
2.43.1


