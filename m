Return-Path: <linux-i2c+bounces-4074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CEA90C636
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 12:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E5F5283C28
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 10:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411D516CD2C;
	Tue, 18 Jun 2024 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cC4g8M+R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6E14EC7D;
	Tue, 18 Jun 2024 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696572; cv=none; b=cvvEm+tXlTogpxpv+2v1c/Izl/zvDznOAvdGzzOyURlSjUzpAh0QK5gMFka3of42W2rBUmmAkRX5xcff3SgBfonoJd81iSzUFs5z9zXkk4d4A68i4TqzrPoktdoEn2KYeFDPczIWAg0qSTMcjU02uukL8ZGuzitGjDybkx9Wm8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696572; c=relaxed/simple;
	bh=NhE3mVQjrSBJO5ZyssId8oosT5jNp3cj6UPDsfSkf2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPqw4ILqrFZhGKXmZA5sxd2QAaIin499NMB8YUbHH+veeDeF06UdWEQpa3EaBAqXmCILg+DzO/CpNX0fjfybEfTNkdK3vK0TsPXm9C0JVzZt0J8yMaYGloD1IHO0/cMhkeWwArjZYAT/zlKfG7ugvpyy/FkznjT1kYLldywTzNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cC4g8M+R; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2364FC0006;
	Tue, 18 Jun 2024 07:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718696568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uDrhgwuXd70Ld1fOjbKx/CsMOE1aQz4gBxg+9d7X2Fs=;
	b=cC4g8M+R9T8xiB4utbsDsV9ioGrkhXazt/uGvvcMQmw4m7NojFcB9lR1Jwj7y6jQ4msh7E
	NyqAM+DHkmqHFp3GI/ZlbAiyiXymwhgjuX+Xv/QVCYj/MRI4gmV96PRgN3OL5sKFnfaGQX
	ExDB2qQEGjDmJYou1w3mSF9p0wkJzSy8AXu4bqdDF46eeYqLRqiIG2GYL5nD/dG0CGXGQs
	zibKo7DGPqAdBD5A+lv2iVIg6XTyr57TLc49sx3KUS7bzqXU6bI9Bt5joUHUF9LL9ygYSr
	QbA1v4J2xhVzdCZQyQUwKCrWuQ9ERUVKkZlgAL0z1suwtB/ueGEL/FCh1l4taA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Tue, 18 Jun 2024 09:42:40 +0200
Subject: [PATCH v3 3/3] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-i2c-th1520-v3-3-3042590a16b1@bootlin.com>
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
index 57a2578123eb..b5c4f1811955 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -122,6 +122,19 @@ led-pins {
 };
 
 &padctrl0_apsys {
+	i2c2_pins: i2c2-0 {
+		i2c-pins {
+			pins = "I2C2_SDA",
+			       "I2C2_SCL";
+			function = "i2c";
+			bias-pull-up = <48000>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pins = "UART0_TXD";
@@ -145,8 +158,79 @@ rx-pins {
 	};
 };
 
+&padctrl1_apsys {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pins = "I2C0_SDA",
+			       "I2C0_SCL";
+			function = "i2c";
+			bias-pull-up = <48000>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c4_pins: i2c4-0 {
+		i2c-pins {
+			pins = "GPIO0_19", /* I2C4_SDA */
+			       "GPIO0_18"; /* I2C4_SCL */
+			function = "i2c";
+			bias-pull-up = <48000>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c5_pins: i2c5-0 {
+		i2c-pins {
+			pins = "QSPI1_D0_MOSI", /* I2C5_SDA */
+			       "QSPI1_CSN0";    /* I2C5_SCL */
+			function = "i2c";
+			bias-pull-up = <48000>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+	status = "okay";
+};
+
+&i2c5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pins>;
+	status = "okay";
+};

-- 
2.45.2


