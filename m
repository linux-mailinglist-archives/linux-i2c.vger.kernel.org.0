Return-Path: <linux-i2c+bounces-4073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB8290C631
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 12:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA7B21F22D15
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 10:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742CF16CD04;
	Tue, 18 Jun 2024 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cAFaoOly"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC0F16B3A8;
	Tue, 18 Jun 2024 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696571; cv=none; b=eyztgPLZBKREbK3Yi8OdFIM9XvWc+Mr2+1J3pZcrWjZ9Prtbp+yWAKJcFmnLSK7fQTyFXiNDYydhGPf0CVNOpwPzl3MU/kkMXz05yksw7hOFkWFOnX30kolR8G2BKnpodJFQwib31sJ8CqtliuvSNY+rAa3rmRRVDNuX/sKUkwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696571; c=relaxed/simple;
	bh=22LiLTaN6ka46AuQxP3JlgWrez7tFpwwaHNrfeZdy5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7O660sUpy2WRMBwMqfkLu1W/WrvvcB6Hd86omuFwputkCKZcmb7qqlMG0UZAkliwUr+OMg9e/Dqxkd7MPyb8erpQ0NJTLgveE9hhbe9UyJU2O4eznDc1i4CPNjPE03aWaH5mPhA+xHQSNxiqZyYr2NpS0PrRTy6ATJz+tn7WF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cAFaoOly; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DD3DC0009;
	Tue, 18 Jun 2024 07:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718696567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIh3G9QrANhkJpdTb5SbPP1mqAoTXQh4UYfOgsrNlms=;
	b=cAFaoOlyFgRFwuNf+An7h77nqUItpuH8TrH9YDslPI57rUwQGcEi/RmR61/KxZVqt+BYz0
	dnXzE7Bl4eyp89VUObOfd6g3O3nVxYKQc4q/OdNOAK2m5l6lNDFYt44oklKCu8XKj2fyy3
	PMmBmixglFkiUkwOpgE0XAwkreNR9SViS2UkjHCJbsgxzUvSahm8Hng3AZJfx9HLsos5hY
	qUySbuHV3TX8MUuQiBN7hS2cOWFrNmn1fP+dTAuvNUQqUlsUx0EyH1qKde6T6K0t0PN+yh
	pbsoDIYfZUhgqCSexC/3mnryH6LGyCdgvgHY7eos2BP92b6peOgGVZCxxc/rsQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Tue, 18 Jun 2024 09:42:39 +0200
Subject: [PATCH v3 2/3] riscv: dts: thead: Add TH1520 I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-i2c-th1520-v3-2-3042590a16b1@bootlin.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
In-Reply-To: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com

Add nodes for the six I2C on the T-Head TH1520 RISCV SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 60 +++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d88d4cade02c..f0b2b05e9bd4 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -232,6 +232,36 @@ uart3: serial@ffe7f04000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@ffe7f20000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f20000 0x0 0x4000>;
+			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ffe7f24000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f24000 0x0 0x4000>;
+			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@ffe7f28000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f28000 0x0 0x4000>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gpio@ffe7f34000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f34000 0x0 0x1000>;
@@ -320,6 +350,16 @@ padctrl0_apsys: pinctrl@ffec007000 {
 			clocks = <&clk CLK_PADCTRL0>;
 		};
 
+		i2c2: i2c@ffec00c000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xec00c000 0x0 0x4000>;
+			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -331,6 +371,16 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@ffec014000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xec014000 0x0 0x4000>;
+			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
@@ -405,6 +455,16 @@ uart5: serial@fff7f0c000 {
 			status = "disabled";
 		};
 
+		i2c5: i2c@fff7f2c000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xf7f2c000 0x0 0x4000>;
+			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		timer4: timer@ffffc33000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33000 0x0 0x14>;

-- 
2.45.2


