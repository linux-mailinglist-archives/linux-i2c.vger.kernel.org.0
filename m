Return-Path: <linux-i2c+bounces-6642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE797707A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D3331F262ED
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D671C2312;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOWLQ65k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B51C1AA0;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165216; cv=none; b=qbnybliivITN3ugZjuHf4HOZBYpnxuHRM+cnxaF9XzDPs/cUGTUe0ww3PUkp6Nyd7F9SrmfjjZk7uxp75fh18tUPhZUAIoMJ+Zs321rw18sPN44W70JPOUQzbGsnmC266t3P3ko66VsWfahZBx0x/LRy3WodmpR6H9rjaeopgi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165216; c=relaxed/simple;
	bh=xc1lcmQyKnVJeXtN66l/4Vl3EAntmlIX7k9RsQ6PtVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zlcm02vXU12OOmExNihSnMjsiBsmdmgnnIf5Xoc3DDgMXnzNnNVp4dI5RP35GwjF/RodL1WFibHSI37FVpWtJyhUgoIc7+7AzLAQhSnOEEjpzq5Lk2tsO08VLTXchN+vsOFPRxXfM1pgfBWCeNS1NcgcXK7Vc7hNUElSkeIAWWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOWLQ65k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2BBAC4DDEC;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165215;
	bh=xc1lcmQyKnVJeXtN66l/4Vl3EAntmlIX7k9RsQ6PtVM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=KOWLQ65kuaEmRmfLrM9+bOzLuSuu37845a8u7Y3Li24eY808rv/KMElP5ssgaK6RD
	 htaDdGikLm/hrJK23yuSkvCvDv8KFwipc8vokpcoF3TZtRlSWaTlIhscm5IZtQwhy2
	 wuV+Z74ruCYqPrpm/Y6N2X6vv3D2pkCv2qlp7kkU/8GM0vI2Ib4v5nqP91SXKTz+jL
	 xSWOqZzai+qNPcBh5qDsxBwvgecjgaKo9XggQcv9bNix03Y2mZ6LoYd/C1MXstoNoL
	 OaKXDowdFENzGmN5jW8YE9RzHHRZ5BcMYqXDCRLLE21a95Zthl0kBKd+iGN2a7bkmk
	 wY6SJXyCybOkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BDEEEE25C;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:57 +0100
Subject: [PATCH 12/21] dt-bindings: irqchip: adi,adsp-pint: add binding
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-12-458fa57c8ccf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=2105;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=yHl99Y8TQ8P5xVbR7jYO25v3GpFZA0Gk4gbAg09z/m8=;
 b=S/iXG0SAWPve55YA1NYgR6TtW3/vsk79y+hhbkQT4ASvfW8R3SxBPGVZaHLMhi2HbC5h6WHdI
 pSMyLq0La/wADQ21ECoDMhIf5J0qLhEtLm5UIu+6LZ+u+JQ6QKEswok
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 .../interrupt-controller/adi,adsp-pint.yaml        | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/adi,adsp-pint.yaml b/Documentation/devicetree/bindings/interrupt-controller/adi,adsp-pint.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b5ecf0cf1d2ceb580f45467ffe1550ae3280d1a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/adi,adsp-pint.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/adi,adsp-pint.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices Port Pin Interrupt for SC5XX-family processors
+
+maintainers:
+  - Arturs Artamonovs <arturs.artamonovs@analog.com>
+  - Utsav Agarwal <Utsav.Agarwal@analog.com>
+
+description: |
+  Analog Devices Port Pin Interrupt driver for SC5XX-family processors
+
+properties:
+  compatible:
+    enum:
+      - adi,adsp-pint
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/adi-sc5xx-clock.h>
+
+    pint0: pint@31005000 {
+      compatible = "adi,adsp-pint";
+      reg = <0x31005000 0xFF>;
+      interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+    pint1: pint@31005100 {
+      compatible = "adi,adsp-pint";
+      reg = <0x31005100 0xFF>;
+      interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...

-- 
2.25.1



