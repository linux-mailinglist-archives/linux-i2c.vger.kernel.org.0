Return-Path: <linux-i2c+bounces-6640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F4D97706E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 691191C237DD
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0D11C1AD5;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMZri+oK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC9C1C173F;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165216; cv=none; b=NcOyVnoXaH8Y5M7149u1w/NEvU6Ngl/OcCOugTHXcu4vd4cvaoTM7Nhm218EgDBzvpq+qa6z2xOOpAozEml2Hn4KXxpM2X2u8FQ1q/buU8moXipiDhx8Q7oJN6iO8WU4KbSpvcGbPijek3aQuourKqG99Rt91GQwAo2xA8XdypI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165216; c=relaxed/simple;
	bh=zo8Goznet6ybriL8A1oNytPyx903mkSFkDLvialibwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9GZPcs2j4wi36m5n6PKiwdzK6LOOSIqVYvivFOoGr01EWMqqA3aTTP6M2+CiWtkgVLJSElC/7ERAkRffpI088FjXb4O9eI8egz4eVxDpgSzV+Jn4dzo3Hng9vcNjb4Wq0YQ4A68m1w/S5FcUz8SmTe1eorMiIRnB8oMeakdjJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMZri+oK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB3FDC4CEF7;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165215;
	bh=zo8Goznet6ybriL8A1oNytPyx903mkSFkDLvialibwA=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=uMZri+oKwmTs5eBoAMUzB+ve580v9zqiyg9chdR/CRax+PpAdAhFG8bLV+n4AefGk
	 a03JxdrOsPPHvg8M7McvFzOE8YUH0WHTScLQQV4rn6CsSA/EwZNDHkymPI0TnZ+0+n
	 I7OJ5/JZ7ERndhzU5oulxnSguoIc/TZz+cqOHtxwkYRAv3KpRuFuPdrtqc+x12hNAx
	 da7WmOZ/rS7H9LQJkPvqmU8qnuCNz5zrccwuP3osud1gdxFEIW5jrTVee1RNKMb2d8
	 KNhtRtyoyvAsg08gOpn7xTH4/O2VI7asQreGvZIhQpbDpxvjJdw1U3GRkXuQ79bIo8
	 3VbA+wSIYy7Hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30B9EEE240;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:55 +0100
Subject: [PATCH 10/21] dt-bindings: gpio: adi,adsp-port-gpio: add bindings
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-10-458fa57c8ccf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=2563;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=cfOfuzOPLZMfuiN15jp5jl3DQDp54rB8wtv1oWhiCQQ=;
 b=sCywtZ4XrQYa/PO5ZEQL4TN0cv+Zg4tyhTVMbmf3ThpCbmUIkz2SdELt230uY5LEcIXMW/KtL
 jeBKoWMuk8dAQE3Ql2FcLeK81laxlcnGLBAVzEhv+u8dGAgfPzQM8be
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add ADSP-SC5xx GPIO driver bindings.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 .../bindings/gpio/adi,adsp-port-gpio.yaml          | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/adi,adsp-port-gpio.yaml b/Documentation/devicetree/bindings/gpio/adi,adsp-port-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3d7899ce759193296ce787d09d742824277f37f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/adi,adsp-port-gpio.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/adi,adsp-port-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices GPIO Port Driver for SC5XX-family processors
+
+maintainers:
+  - Arturs Artamonovs <arturs.artamonovs@analog.com>
+  - Utsav Agarwal <Utsav.Agarwal@analog.com>
+
+description: |
+  Analog Devices GPIO Port Driver for SC5XX-family processors
+
+properties:
+  compatible:
+    enum:
+      - adi,adsp-port-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    description: Associated pinmux controller and the GPIO range values
+
+  adi,pint:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Associated pin interrupt controller driver
+    items:
+      - items:
+          - description: phandle to pin interrupt controller driver
+          - description: interrupt value
+
+  reg:
+    description: PORT GPIO control registers
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+  - gpio-ranges
+  - adi,pint
+
+additionalProperties: false
+
+examples:
+  - |
+    gpa: gport@31004000 {
+      compatible = "adi,adsp-port-gpio";
+      gpio-controller;
+      #gpio-cells = <2>;
+      reg = <0x31004000 0x7F>;
+      gpio-ranges = <&pinctrl0 0 0 16>;
+      adi,pint = <&pint0 1>;
+    };
+
+    gpb: gport@31004080 {
+      compatible = "adi,adsp-port-gpio";
+      gpio-controller;
+      #gpio-cells = <2>;
+      reg = <0x31004080 0x7F>;
+      gpio-ranges = <&pinctrl0 0 16 16>;
+      adi,pint = <&pint0 0>;
+    };
+...

-- 
2.25.1



