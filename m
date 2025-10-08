Return-Path: <linux-i2c+bounces-13416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C4BC68AD
	for <lists+linux-i2c@lfdr.de>; Wed, 08 Oct 2025 22:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 198603B2891
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Oct 2025 20:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243E328504F;
	Wed,  8 Oct 2025 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kael-k.io header.i=@kael-k.io header.b="ZTq39Syw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CE828468B;
	Wed,  8 Oct 2025 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953973; cv=none; b=O5MtbUiLUr5qH4iaWk3i+tYCYhqPBDyj1tnsTcpWT2mlFY/CoDGo0AIeOIKRQqb7feJrisvFVd/suglm7Bv8LNe604PBdWkP+7po3h4U7NQiqg7N7GZO6KdxabqO/sfB80ASc1d/8Yo4bv9qQpmEc5fOK0UExgp62QJbt+yKLrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953973; c=relaxed/simple;
	bh=5/BlZHxImdfT5nQx8NqwxqIt1Iw0n0mNCipRLrdIQb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dju2mluCEegPKbg2R99PTKzyUgycidTdt8bN7XXNCzBnON2s2VdYqUxgy8g8CYxyjMtG+mJH3Ekc4pBXVHqxN3fVtWd5ol0cg9iVyF4Aw7hj4ZuOdntjhb/qsfpa6gLLN2RtiulpTFNYYfUJ7bvH2kZLETI2RvJY65hLD1qUIdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kael-k.io; spf=pass smtp.mailfrom=kael-k.io; dkim=pass (2048-bit key) header.d=kael-k.io header.i=@kael-k.io header.b=ZTq39Syw; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kael-k.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kael-k.io
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4chkXV1Ddtz9tGx;
	Wed,  8 Oct 2025 22:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kael-k.io; s=MBO0001;
	t=1759953962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkahFsDi6WgEBokAFq9960SlJ6AhkwmGq9ESS2G4GHA=;
	b=ZTq39SywICPVWsc3J6SZbHMDsZqgJImqF1xooe7SaqIshULuijjA7ZB3b+iR8VqiNIFCIj
	oFBSAeEv1Z9JrFEjr2MslebNh8G0OVaHfdUcRQPgPTKKqvm0rjZt1vvImUPKpv/IIwWSWy
	p4ffyj2SVvqhUO65LIUm0FsuSoxyCsxKDEbiBHTS+kc4rli/pW461E5YeqK5NSvxC3OnjY
	amGkL6ZdwFj0pKj0BttxFHDD8kjl7/sK96dBiYn7KsTyUD6pVTx08LsEPYStq8E0p57hbh
	/qoMbCxtUYYaekTWJLHidyguj9Y5l6dlfafndrTBTcMYU/6DJ4ExTMAPHNKSHA==
From: Kael D'Alcamo <dev@kael-k.io>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Yan <sledge.yanwei@huawei.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: i2c: hisilicon,hix5hd2-i2c convert to DT schema
Date: Wed,  8 Oct 2025 22:04:27 +0200
Message-ID: <20251008200535.17464-2-dev@kael-k.io>
In-Reply-To: <20251008200535.17464-1-dev@kael-k.io>
References: <c2e81faf-4d2c-40e7-bdf0-e0d41fc76d9c@kernel.org>
 <20251008200535.17464-1-dev@kael-k.io>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Devicetree binding documentation for:
* hisilicon,hix5hd2-i2c
from plain text to DT binding schema.

Signed-off-by: Kael D'Alcamo <dev@kael-k.io>
---
 .../bindings/i2c/hisilicon,hix5hd2-i2c.yaml   | 51 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-hix5hd2.txt   | 24 ---------
 2 files changed, 51 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-hix5hd2.txt

diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml
new file mode 100644
index 000000000000..3faa7954e411
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/hisilicon,hix5hd2-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+title: I2C for HiSilicon hix5hd2 chipset platform
+
+maintainers:
+  - Wei Yan <sledge.yanwei@huawei.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - hisilicon,hix5hd2-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: Desired I2C bus frequency in Hz
+    default: 100000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/hix5hd2-clock.h>
+
+    i2c@f8b10000 {
+        compatible = "hisilicon,hix5hd2-i2c";
+        reg = <0xf8b10000 0x1000>;
+        interrupts = <0 38 4>;
+        clocks = <&clock HIX5HD2_I2C0_RST>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-hix5hd2.txt b/Documentation/devicetree/bindings/i2c/i2c-hix5hd2.txt
deleted file mode 100644
index f98b37401e6e..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-hix5hd2.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-I2C for Hisilicon hix5hd2 chipset platform
-
-Required properties:
-- compatible: Must be "hisilicon,hix5hd2-i2c"
-- reg: physical base address of the controller and length of memory mapped
-     region.
-- interrupts: interrupt number to the cpu.
-- #address-cells = <1>;
-- #size-cells = <0>;
-- clocks: phandles to input clocks.
-
-Optional properties:
-- clock-frequency: Desired I2C bus frequency in Hz, otherwise defaults to 100000
-- Child nodes conforming to i2c bus binding
-
-Examples:
-I2C0@f8b10000 {
-	compatible = "hisilicon,hix5hd2-i2c";
-	reg = <0xf8b10000 0x1000>;
-	interrupts = <0 38 4>;
-	clocks = <&clock HIX5HD2_I2C0_RST>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-}
-- 
2.51.0


