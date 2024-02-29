Return-Path: <linux-i2c+bounces-2070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F986D1BB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E18D31F21D13
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C2C13F44C;
	Thu, 29 Feb 2024 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z/NzFEnx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81E13443D;
	Thu, 29 Feb 2024 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230264; cv=none; b=QgXoC10l0WT54QAaBpNVsOWmIvqkyJOHeAnsu3Jv1213Vr8sTf44wG+cx1p9/+k8el/8PM+JkO3MDspvBUgDxD7B8JUbvvbmh+wQKPScGyQsVNJawazkKomzURNsrGMHoD1LQ9ZMxzp5pkNYUEt3RrXYHIlvFtBEldNXX8vNBlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230264; c=relaxed/simple;
	bh=5k9S2AxdTl1EisNnqus4qmbYGrldmWYTS+AlkTGt08I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQCwdAftJjxg45IFDJRhPN30Xdcv7D8D7wMumpeK/D0U35u3lRrilPMq/HpCQU0dFG5mCMQsInUgHwcV3kf0OG6Z9sLAvQ3PW6auHO9BHH4TZ2m2Ol5/cAikdoOJjv4HORzvFhBKiVQ4FjLPNI7WYZ+H9qo/yjxT7qqQ/eLivC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z/NzFEnx; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 425516000F;
	Thu, 29 Feb 2024 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YS6qsvR3j45hLhkCs08BhV8Ans1TAAZyVLFQY8d62I0=;
	b=Z/NzFEnxVooAjKuWJWlpXlQiMa7F0Otl8LtpcoIkWJkdLk0xYGMXcCk5zwuYsbQxUak9JP
	kf+eSe6MMULzIJNd6oUx4/2XGdOUN4jw4Fcv97e3ve6FfiNkp3l3sSV4ifufr2zKPQ38/q
	zPrDded0SsmP+KfZGM+LMZpPs/Tk8c0vGvVUZPO6ByPieXLp3gZ5lfdgV0ibJd68x4m47Y
	FAoJTcDUy5+3ztLBPbJZPkJTvvFQeHhVl/saRenxQigFtMhqlY0bpbVdlyUwmCN47ylLzq
	L/weZ+e1oNTx2NID8Xzz/+OnXRrBHEmv2dNrpx+Ak0QR2a9gkStQ7ur3b3guxw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:58 +0100
Subject: [PATCH v2 10/11] MIPS: mobileye: eyeq5: add 5 I2C controller nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-10-b32ed18c098c@bootlin.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
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


