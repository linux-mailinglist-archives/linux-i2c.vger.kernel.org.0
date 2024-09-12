Return-Path: <linux-i2c+bounces-6645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7859997708A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04C08B239AA
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BE41C2438;
	Thu, 12 Sep 2024 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxyh3iQB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C491C233E;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165217; cv=none; b=dhtqV6QxFMSZYoNpT3QfOrFK5Yqrz/XRMHKwKB8GAKH7bYVbIHle+mX3Xa3UJ7iBK0SW5rOu/Va0G+UPOv5E3Ig/gBqCzzwnkotkJhdwoqt9tNW5oIy+kPZsdiqCJtJIL6ZtaCJcPVBHLKnKfP+WU4N2NnGhox26cpL9S2MrVFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165217; c=relaxed/simple;
	bh=XLB5gYmYmYt1/pzwpQI2EzPtJ4lJYhpSRMjF4adIEI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+/LzAglWuw7/kdQ9Fcm3l56N647DT45zgQ+pqIEvUOaO/DxcYp+biEMQNc6fkROVaERycndTZwXZcSKxFoc6RP4MTFg8faqTUAlDxIPbFdBRbmIRJ+RVFmKax+sypavkD3UfXaOhG3m7COspOx49g5f7Jn3uxTVBPV3qXrGUp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxyh3iQB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 728C1C4CEEB;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165215;
	bh=XLB5gYmYmYt1/pzwpQI2EzPtJ4lJYhpSRMjF4adIEI0=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=nxyh3iQBMDqitWf0A2v06aU5QKuSIbEwzxnTTimC7D3X1BkWubdsQ4q8jVbEryGbi
	 rUBWqb+TkokzJfPJNkXheYGOrYsEtyo0lg60+lAeo3Qa8TPHq5WCp2YhLe4NLN4YFb
	 bxKtX67dDWamAtMecKA6XNCnyEY69ectATX+f1V6xPH/GwffFNFWEAn988OPKYYL5z
	 0QYNDJNYF42W5C6f839u//EGx84uoVXGzR9mXPZ5NTMeqql4sptMZR/dej82135fqT
	 kWR1BO97MTgLx2nzSo66CRRKvWH22E+0cvGMdmTnWrUrZacvBRTIvRp9P1mUgl2ZFD
	 8eBg8TV/VJ/iA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B9BEEE249;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:53 +0100
Subject: [PATCH 08/21] dt-bindings: clock: adi,sc5xx-clocks: add bindings
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-8-458fa57c8ccf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=2454;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=FK1wS84c2c1JDb4uWuVca0i/beOgHv9nSZqxSxH0SWg=;
 b=w9Z7BRtwc4qeUvwgaNEz4dzqKZcH31enCAS4yvArHHPswdjADO8AxrRW0gyDV2QCF3wcyNrPw
 j4K3L4sgrtNCmK2g91XXJ+PsJqO7i2uu1EE2pvYlXMzGPgxvJ1TDhsJ
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add ADSP-SC5xx clock bindings.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 .../bindings/clock/adi,sc5xx-clocks.yaml           | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/adi,sc5xx-clocks.yaml b/Documentation/devicetree/bindings/clock/adi,sc5xx-clocks.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a092ebdefdcf89a635cdcf1073921efd28a38386
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/adi,sc5xx-clocks.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/adi,sc5xx-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock Tree Drivers for Analog Devices ADSP-SC5XX Processors
+
+maintainers:
+  - Arturs Artamonovs <arturs.artamonovs@analog.com>
+  - Utsav Agarwal <Utsav.Agarwal@analog.com>
+
+description: |
+  These drivers read in the processors CDU (clock distribution unit)
+  and CGU (clock generation unit) values to determine various clock
+  rates
+
+properties:
+  compatible:
+    enum:
+      - adi,sc598-clocks # 64-Bit SC598 processor
+
+  '#clock-cells':
+    const: 1
+
+  reg:
+    minItems: 3
+    maxItems: 4
+
+  clocks:
+    description:
+      Specifies the CLKIN0 and CLKIN1 reference clock(s) from which the
+      output frequencies are derived via CDU+CGU
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    description:
+      String reference names for CLKIN0 and CLKIN1
+    minItems: 2
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clk3: clocks@3108d000 {
+        compatible = "adi,sc598-clocks";
+        reg = <0x3108d000 0x1000>,
+              <0x3108e000 0x1000>,
+              <0x3108f000 0x1000>,
+              <0x310a9000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&sys_clkin0>, <&sys_clkin1>;
+        clock-names = "sys_clkin0", "sys_clkin1";
+        status = "okay";
+    };
+

-- 
2.25.1



