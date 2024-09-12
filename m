Return-Path: <linux-i2c+bounces-6635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE8897705C
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293F728472F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DF91C1725;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUGaqXxK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5621C1BD01E;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165215; cv=none; b=jNW7QkquOsCQFlyTxv854l0YpKEpsZQ1K02u4Ux+hm8DRjGiBpdRAZUlgun/KupxwE1JgkZdPuZyTob2THJzbSw2G/Kmyupo34LJSREFFezRhda0unr2okffV5OxBqhSRb5pCjLL3rreszQaGn1aAwnY2FSnUsJOp2cqh05ILAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165215; c=relaxed/simple;
	bh=ak6ugCgePWMuuhlzPto+EIgq5Wrvc9n4HiCJ3WjxHWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsrs+u9cGeB+dUteZCRtFeJLwIx3qRyem95x3pB+LjrBlIWmOMrWH8fmbHU6LmQ8ocoIdeM6L+nRfjNFZWV50/9Q7dydTmMmT7aiqLmlqJLq+GYTT9uBXVctauXc5Ykk5xqBCsngiJ3RrPtrkUVj/GUjZ4m/Xn3BZJ/sg+DGOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUGaqXxK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09CB5C4CED6;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165215;
	bh=ak6ugCgePWMuuhlzPto+EIgq5Wrvc9n4HiCJ3WjxHWQ=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=DUGaqXxKWQ2MyRKhDWTrsqb+VrBv8RZ11ecnbCzhgP7f8KSEmrTbAEpxnIVj+myoh
	 i6vJvOJ3h0DJ8k/Yqhzvd93jJ15bvbF40c3v9SwoIZLKrxkoT3GwEjr0fY6OOTNl1j
	 QahLrP7nr+COk9hi5X1cSksbR0qPCU9+hpoHbTjbBEUj7Jm1ZlmTR5dCzEGLVMBEnq
	 6q3Qf/6LsmPC4HjFOnHw0Pd1kj+QeAWvUuBu+fp19HOUoSWP+nI16dMDhTM8fZkQgX
	 M32Hjuz9y0MEgl+yUFIL4hY4TTmg6/b/Vm/1+ccHHKPCWuTwsz9dyNiffmKtapk8JN
	 wR1KeZA7BuItQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AB1EED63D;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:49 +0100
Subject: [PATCH 04/21] dt-bindings: arm64: adi,sc598: Add ADSP-SC598 SoC
 bindings
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-4-458fa57c8ccf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=1623;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=J/EuJUpRixtiC/Xhn+9Y770N03I2X4hm7a/3wJC2XVg=;
 b=R9KdkvfGVHCd5bCvdZq8qKxmeajLuKI+hlHTFb+pbWAQDWDoXhfEOnOZ5i5NTWG/+O7XX5yRE
 y6kVkSWYiyfBVn1snKVwFxUZTDwNmRMmpVlpC0KLbcw86AkHCFcMMrz
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

add  SoC ADSP-SC5xx

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 .../devicetree/bindings/arm/analog/adi,sc5xx.yaml  | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/analog/adi,sc5xx.yaml b/Documentation/devicetree/bindings/arm/analog/adi,sc5xx.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fc37242b32b9ca9b82fd5b3e0288642e8c4fd9f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/analog/adi,sc5xx.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/analog/adi,sc5xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices SC59X 64-Bit ARM-based Processor Families
+
+maintainers:
+  - Arturs Artamonovs <arturs.artamonovs@analog.com>
+  - Utsav Agarwal <Utsav.Agarwal@analog.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    description: SC59X 64-Bit Boards
+    items:
+      - enum:
+          - adi,sc598-som-ezkit                # Analog Devices SC598 EZKit
+          - adi,sc598-som-ezlite               # Analog Devices SC598 EZLite
+      - const: adi,sc59x-64
+
+additionalProperties: true

-- 
2.25.1



