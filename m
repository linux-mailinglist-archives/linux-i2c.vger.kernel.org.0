Return-Path: <linux-i2c+bounces-13388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609EBB8F77
	for <lists+linux-i2c@lfdr.de>; Sat, 04 Oct 2025 17:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C035C4E1CAB
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Oct 2025 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDA9277CA1;
	Sat,  4 Oct 2025 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kael-k.io header.i=@kael-k.io header.b="Ql6qjnZE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD698218ACC;
	Sat,  4 Oct 2025 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759593011; cv=none; b=rIVNJJmC2ZcGSg0ZyxGrOSaa4od5W4EXlCV1iCAFjZFtXbNdDfW8BNhLSXenJQ8rwZbIvEDFcYx3GWBUR6diqpIZfmAFXKPCazq7MsfTT7PoejU9upVQdkehNgm3P+3iFMytM2Zmev22LQKUJl6HCXGnFDxKuMQc4IRIYS4YC48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759593011; c=relaxed/simple;
	bh=hmg1wwoXCqvbRNqOmKu6vh/QvUQS8h5vSZGg8X0qr8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0GfsgAiztYyYwDrj/J3Ob+w7xqCZqfLhK9RUSwCgoyHS5HqDZ1Q++gMiCdPIaQonhyF7dUPrzna2YWPMMF2uLdJEg6kJ27+c9mkbemTM0trEod4aylyXP1YuvkB6WkQRvvooHKvPiJ1N97pAmEMXpfUy6AMAE+9ZF/17ljW+GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kael-k.io; spf=pass smtp.mailfrom=kael-k.io; dkim=pass (2048-bit key) header.d=kael-k.io header.i=@kael-k.io header.b=Ql6qjnZE; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kael-k.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kael-k.io
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cf92t2LWtz9tgG;
	Sat,  4 Oct 2025 17:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kael-k.io; s=MBO0001;
	t=1759592998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B10a2y7Bt0NnnAez5NHXUwyxva7qt8/E5u6DqkLWAIo=;
	b=Ql6qjnZExIyH6Gby45Retj39Caz+6n4YyrU4oe/ep4SpByMv3eQqL2qhhn/cQ1vVlueYck
	E/bfrvrXZFsrJdDyCkBJJciao83+6o/LZZzL9DBSiXJv9bmUFKwzlIG/+AopIZcbXD8fuu
	Y3IhgMZebEp2k+JAqUoTMSJAWZECzI5RLXc7kDfmmloN2eREvqewd9q/TB3O+0zI4pg3Tj
	CSMx5NT9+k1zlBiI2noi4waTbBjvUgsyIrHmFQJzLqBA4CSPE1kBLqLUQq5/zBbbxS94Kg
	9+jS20qF5W1VhKmRZnreevxRVLkdL/kMvQ284QTNZ+NGeaKDzM8OyRoi1BSXkA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of dev@kael-k.io designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=dev@kael-k.io
From: Kael D'Alcamo <dev@kael-k.io>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Yan <sledge.yanwei@huawei.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: hisilicon,hix5hd2-i2c convert to DT schema
Date: Sat,  4 Oct 2025 17:48:02 +0200
Message-ID: <20251004154808.116143-2-dev@kael-k.io>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4cf92t2LWtz9tgG

Signed-off-by: Kael D'Alcamo <dev@kael-k.io>
---
 .../bindings/i2c/hisilicon,hix5hd2-i2c.yaml   | 59 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-hix5hd2.txt   | 24 --------
 2 files changed, 59 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-hix5hd2.txt

diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml
new file mode 100644
index 000000000000..e9931bbdb88b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml
@@ -0,0 +1,59 @@
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
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


