Return-Path: <linux-i2c+bounces-6648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 761A597709D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EBEEB255BE
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FDC1C32EF;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuNxeGlg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774441C2DC6;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165218; cv=none; b=iMwpyki8CE99HEONDEDaWTJUQuxzuIEO+1NmsL5lKeBlHfyBS4kbD6hhfhspm+70ETTCuMHhMPeaOI1MgczFqSUplFlbgPo35fNR8DnB4v8WXpXNEOQRjyj4WacHJvacr18khBT3TgJ0UhLGVh2mlSM0H94IdnTjmreE0itCZcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165218; c=relaxed/simple;
	bh=hqLKfdHAqsp9ubtvrEhSZkll8xQwV4IE1tn0OaSzusw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUTbXUGzYUEts/H2utRvLN9qTLiUz7pm1jx685rfRewU/rgXwXv7hyD9wYyXoIR6XeemHdNup5SHRYE+mehGRsdtlc+yH6IPkJTqGdVMuaKoC7rUpD0P5AbISs3f2P2SBDh/8pnKfCfEu0NEHa0c698OSLFVjyXAjiM2oWP34bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuNxeGlg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44DE0C4E697;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165216;
	bh=hqLKfdHAqsp9ubtvrEhSZkll8xQwV4IE1tn0OaSzusw=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=TuNxeGlgwVKz/YJpZgUWMzbRDtDYEboaVjUlEKcS2+wgLqz6ztXfxtPMRGFZqVbCH
	 FB+LRvTghTeBCuVTpItqFOwLWAJQ2zLuVjA7AlekNdJLKITvPN9OAv8wjixp6TTApb
	 G6dPauL0xsbsCxgHuUGhub98eMkgCC1M/RhbPYQLjl03VxLc1i7Hn+Ile6nfJhAH+V
	 ZWaHu7cAz0Dn9T0nnxoKfc+xlD6CXjQ+Rlge+JRtL8afAVLk8Bin0hH+Q4UVTDAv5S
	 QifGt/AbVtR3gnHUORcEolBkDzwwXMX0gRzPM2w5xjAZVzvT2uPyZKDtplhhFj/9Pb
	 atvsp9pAD618g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380BBEEE25E;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:25:01 +0100
Subject: [PATCH 16/21] dt-bindings: i2c: add i2c/twi driver documentation
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-16-458fa57c8ccf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=2351;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=NgI2mAXMr6wvtJUHYjzwLK7MgsJEKL9nzTeZkQleGms=;
 b=vhXEAs59UNXXy2CwczdwdKItNi03+ogGqzUK0a77UzJPEDl1pzu4/spYs4pnuCUKynl1Z68j+
 HK1C/dGXcNECHVI1d4QCirnLQUyMOWAsGojtV0CO7eu/mjENPi367XQ
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add I2C driver bindings.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 Documentation/devicetree/bindings/i2c/adi,twi.yaml | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/adi,twi.yaml b/Documentation/devicetree/bindings/i2c/adi,twi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e935b09066cf806c89a796fdd5fe73ee0b644432
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/adi,twi.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/adi,twi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices I2C Peripheral for SC5XX Processor Family
+
+maintainers:
+  - Arturs Artamonovs <arturs.artamonovs@analog.com>
+  - Utsav Agarwal <Utsav.Agarwal@analog.com>
+
+description: |
+  Analog Devices I2C Peripheral driver for SC5XX Processor Family
+
+properties:
+  compatible:
+    enum:
+      - adi,twi
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-khz:
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - reg
+  - interrupts
+  - clock-khz
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/adi-sc5xx-clock.h>
+
+    i2c0: twi@31001400 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "adi,twi";
+      reg = <0x31001400 0xFF>;
+      interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+      clock-khz = <100>;
+      clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+      clock-names = "sclk0";
+      status = "disabled";
+    };
+

-- 
2.25.1



