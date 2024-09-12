Return-Path: <linux-i2c+bounces-6646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB6F977091
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E17A3B254B1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B8C1C2DB4;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fK1Pb8cG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023031C2457;
	Thu, 12 Sep 2024 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165218; cv=none; b=JC58Sc6GlBB+8TKDQUHvFKb7nAkMwjLOfxiSdEUcnbYidpkJxb7ftf7JQ148nOcpnvuYLFRN7DAWAubn+rlGt0lOKBpqbDcirwTSBBhM8cekjx6nH6K4SRwtfvVZyTIYh5Jydk5GUBr1+o1ilIZH3hQvpOUaZ6sFn6H+NKkaWBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165218; c=relaxed/simple;
	bh=aZKeGq4p5ipcsfiHoGVqu/Fn0FE33lt6G4aL/LyS4+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFEDv+QuBxQI0VrhrCWM5k5YST1ijIj+W7Ek1/7vZZ8JFS4Ms86p3bRHEigXdkYU43PA6izPJZhqsme+nIt+YVipPZ5KSb/JKkYnJiE0ruo5RPY3TodnD/Hn9bBRsFkYWld+EirjdxKxSRHB8PJ7/uQm5AouvpNyNmD0iJVjyc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fK1Pb8cG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F8A2C4DE0D;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165216;
	bh=aZKeGq4p5ipcsfiHoGVqu/Fn0FE33lt6G4aL/LyS4+0=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=fK1Pb8cG3z+/8jCD4Mx4QxLB2vLsDp7cG37wm+XmXsYjUIffIMwGIL8/mAL7q6K9d
	 XKTWOIKPPQRk4EsWs/55sfQJgYY7vdD7f2yJF2VLk3YtC6DYQSz3E/xSNsHvutGuok
	 GObHbJ+mgfV3e6TBGFgrCh7RnDRwMqiI0ILPg8qTfuWlNfaRCTj2V04EgEDdozfAQ+
	 OZvLp4naGYz6DqDGAemV1taZpFZqMl1x5pp1WGbzV0FQHIs46lm0VJ/lTbiaY1v6gu
	 j9LJJvQZkj1EMHeIbsd0AfTSEcR4R15imLc9RlnlGbDNVmZguJf6AicsvkNZ0kCMuZ
	 GsJu3myD73mlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F27EEE240;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:59 +0100
Subject: [PATCH 14/21] dt-bindings: pinctrl: adi,adsp-pinctrl: add bindings
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-14-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=3857;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=8cIHFW2VHjXFP2WdC7ohf0MOYH4XA2BareGL3V29WFU=;
 b=fK46p873AmYdSJ17NDk9Nq0m1iWXpEzwV7H2MptZzhNyghpOJrlmoWDjpnQS17mhBhGwihE3U
 SVtUZ+iSYzCB+MHGX3zfxt3/UF5DP84N3NJOWd5Mmeie3LXzznZn1XN
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add PINCTRL driver bindings.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 .../bindings/pinctrl/adi,adsp-pinctrl.yaml         | 83 ++++++++++++++++++++++
 include/dt-bindings/pinctrl/adi-adsp.h             | 19 +++++
 2 files changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/adi,adsp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/adi,adsp-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..073442b4f680bf536f631b4c17a1d3195c2233d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/adi,adsp-pinctrl.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/adi,adsp-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices Pinmuxing Control for SC5XX Processor Family
+
+maintainers:
+  - Arturs Artamonovs <arturs.artamonovs@analog.com>
+  - Utsav Agarwal <Utsav.Agarwal@analog.com>
+
+description: |
+  Pinmuxing Control Driver for Configuring Processor Pins/Pads
+
+properties:
+  compatible:
+    enum:
+      - adi,adsp-pinctrl
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  "adi,port-sizes":
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 9
+    description: Space delimited integer list denoting number of pins per port
+      Ports A-I exist, so this is up to 9 items long
+
+  "adi,no-drive-strength":
+    type: boolean
+    description: Indicate missing drive strength registers
+
+  "adi,no-pull-up-down":
+    type: boolean
+    description: Indicate missing pull up/down enable registers
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      pins:
+        type: object
+        description: |
+          A pinctrl node should contain a pin property, specifying the actual
+          pins to use.
+
+        properties:
+          pinmux:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description: |
+              pinmux is used to specify which of the available functionalities
+              for a given pin are actually used.
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - reg
+  - "adi,port-sizes"
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl0: pinctrl@31004600 {
+      compatible = "adi,adsp-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      reg = <0x31004600 0x400>;
+      adi,port-sizes = <16 16 16 16 16 16 16 16 7>;
+    };
+
diff --git a/include/dt-bindings/pinctrl/adi-adsp.h b/include/dt-bindings/pinctrl/adi-adsp.h
new file mode 100644
index 0000000000000000000000000000000000000000..dc5b86a0d9190acdd242a6ba4972c3aac7a61821
--- /dev/null
+++ b/include/dt-bindings/pinctrl/adi-adsp.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0*/
+/*
+ * Macros for populating pinmux properties on the pincontroller
+ *
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#ifndef DT_BINDINGS_PINCTRL_ADI_ADSP_H
+#define DT_BINDINGS_PINCTRL_ADI_ADSP_H
+
+#define ADI_ADSP_PINFUNC_GPIO     0
+#define ADI_ADSP_PINFUNC_ALT0     1
+#define ADI_ADSP_PINFUNC_ALT1     2
+#define ADI_ADSP_PINFUNC_ALT2     3
+#define ADI_ADSP_PINFUNC_ALT3     4
+
+#define ADI_ADSP_PINMUX(port, pin, func) ((((port - 'A')*16 + pin) << 8) + func)
+
+#endif

-- 
2.25.1



