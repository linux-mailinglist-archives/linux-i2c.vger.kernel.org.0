Return-Path: <linux-i2c+bounces-2229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E67873E01
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 19:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90ED62826B9
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ED2140E25;
	Wed,  6 Mar 2024 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B0dccRJg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045D13E7DB;
	Wed,  6 Mar 2024 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747977; cv=none; b=AO6gSD71Pw7MZusfrEZb2pqRCOwz9uJvDm9BhkmheIwQREpI6ibV0CSCEb0ltkjkb6DZIdILJdjtjnxhVoF780L/JrR6IwfqDt9g/ewmITQL5nL4yMZi+H8c+IM348pAxAPNMq/mKMog4rs/FSJKWjScuL4RXioL99pCUD+xgOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747977; c=relaxed/simple;
	bh=5+66QCDuAPFthjMdVWRlfXiypvO36c87l+WuAP4TGMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vvk7SIdVAxak4Gqk3l2S4cn/Ubyl8G0mR78fBI5qC00pg/peb1FetAOFtT49DpmaehxgLeQLsPCw9EkC53ux8N+czY0KpVw9bkzmKkuaq87eeGz/UJdqRhSMAto4doQNPOls5+ftxcaJLHukCczGD3hDY0a6DJd4YZmKb8E1yYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B0dccRJg; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D0794000F;
	Wed,  6 Mar 2024 17:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXodg3L52Fw8MHiCrqJ138mAFruQudu9GRMVBdxvx8M=;
	b=B0dccRJgHdRzXHRJkC2vXSschUUPdzCJUVzpQdYE9sIwSen84IbL7eRKpjPYBxm+pDGIdA
	UXb0sHaOq2MZNKHdelMGZLpwTzZnQP3F+iILCAQ5pk3amuqhosGLLc6j8KczCn5EVC5DFw
	+e69d5HAR4b+0WIkTCyIwN0e5HqdZv96ebqRyODxF9pOWIj4KEGpkLKW5nEuCNf77T2FZP
	1WngAh1eY2etbu3ElNda9YYdvE20FD4+uAEHP/M0koEwFTPNDajYtesSxuRY67cDhQG7QS
	RFqCVzaql/9Zwl4ghCF3bPCS+ZmC0v5TL6IMM2MgYRe+0Ms5flxxFdKl9Jyv+g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 18:59:30 +0100
Subject: [PATCH v3 10/11] MIPS: mobileye: eyeq5: add 5 I2C controller nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-i2c-v3-10-605f866aa4ec@bootlin.com>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
In-Reply-To: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
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
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Add the SoC I2C controller nodes to the platform devicetree. Use a
default bus frequency of 400kHz. They are AMBA devices that are matched
on PeriphID.

Set transfer timeout to 10ms instead of Linux's default of 200ms.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 75 ++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 8d4f65ec912d..540d55503f3b 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -70,6 +70,81 @@ soc: soc {
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
+			resets = <&reset 0 13>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 0>;
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
+			resets = <&reset 0 14>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 1>;
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
+			resets = <&reset 0 15>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 2>;
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
+			resets = <&reset 0 16>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 3>;
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
+			resets = <&reset 0 17>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 4>;
+		};
+
 		uart0: serial@800000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0 0x800000 0x0 0x1000>;

-- 
2.44.0


