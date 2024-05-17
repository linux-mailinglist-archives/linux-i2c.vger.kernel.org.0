Return-Path: <linux-i2c+bounces-3552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF36F8C8310
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 11:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708301F232BF
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 09:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C642CCA0;
	Fri, 17 May 2024 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="klGl0Tyc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0E23754;
	Fri, 17 May 2024 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715937027; cv=none; b=Nyt9+Q7fwO0tfWKkZUzMqHOVFmVW7lPdV5/lAlf/Kjz1N3kuqSIhYuVBGVdXzkdf9s3D6i8jTEQy7dYFdFsMRbIuKYN+eUgGRNc7DCyXF9ab0e4HEb5vm2RlOqMmst+QQ/spVGtSxNst8kqXv7E54bcTT/n333LyYu67z6a1lYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715937027; c=relaxed/simple;
	bh=S35cwDcF37dQ5mmiKFpcw7jseCSlFn4J7c+6yymc8Sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUsOtzpoKgrFMCXbyLDOJatSirMjGBhv+Mg1WWHepvVrdaLjIxCl3Q6dLumCdzVc0G3y6IxhhvsGSsZz+aHD6lD6cfGi36iZ4l4wcS7QW5wbcbp2gMe1RAXOjmoEph9oqp+ntz9ME0gHBSNE0W249qUnnTx6Y1NcgrhjmG/lKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=klGl0Tyc; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCD142000E;
	Fri, 17 May 2024 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715937016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFbldK+YrNkPHEp7U+iGoJtDTLbUW/U0B2C/LsdOF6E=;
	b=klGl0Tyc1SJDCTEgSMqT8gslZT1WoMIsRul91Fj6KHTBRJAkMGueFNTsdogwc9TTIuKN1+
	q7MjMuwS4DRHn+A+7S93UAu0hDz7p60u9KHYUu4C+CjzctkD7KJTabkjw+07ZaR7IsMYee
	IQ8irHYV5w9J6dpkCjfXIDwwmKfPp7xT4Xd/oeA+5FXtbzeV6q2VGsqdvUqIFA3PhMk4ZU
	mFE1jtlJWKqLHOU7tYAliU5uHyctDNJZZzcUkIeEar5nTNNM7U4vNUV8jVs1E9x2VqOgjj
	qke6aaFRTiGT27xsBgU8+f48uqusnMcjyFeBQ0uLuXNsYFleQ6awAvYkBr7vfw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 17 May 2024 11:09:55 +0200
Subject: [PATCH v2 3/3] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240517-i2c-th1520-v2-3-d364d135ccc6@bootlin.com>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
In-Reply-To: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com

This commit enables the I2C0 controller of the TH1520, together with
the FT24C32A EEPROM that is connected to it.
In addition, this commit also enables the I2C controllers I2C2, I2C4
and I2C5 as they are all three exposed on headers (P9 19 and 20 for I2C2,
P9 17 and 18 for I2C5 and MikroBus 7 and 5 for I2C4).
It also defined the required pinctrl nodes.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 57a2578123eb..aeb04f5159d5 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -121,6 +121,47 @@ led-pins {
 	};
 };
 
+&padctrl1_apsys {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pins = "I2C0_SDA",
+			       "I2C0_SCL";
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c4_pins: i2c4-0 {
+		i2c-pins {
+			pins = "GPIO0_19", /*I2C4_SDA*/
+			       "GPIO0_18"; /*I2C4_SCL*/
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c5_pins: i2c5-0 {
+		i2c-pins {
+			pins = "QSPI1_D0_MOSI", /*I2C5_SDA*/
+			       "QSPI1_CSN0";    /*I2C5_SCL*/
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &padctrl0_apsys {
 	uart0_pins: uart0-0 {
 		tx-pins {
@@ -143,6 +184,19 @@ rx-pins {
 			slew-rate = <0>;
 		};
 	};
+
+	i2c2_pins: i2c2-0 {
+		i2c-pins {
+			pins = "I2C2_SDA",
+			       "I2C2_SCL";
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
 };
 
 &uart0 {
@@ -150,3 +204,33 @@ &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+};
+
+&i2c4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+};
+
+&i2c5 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pins>;
+};

-- 
2.45.1


