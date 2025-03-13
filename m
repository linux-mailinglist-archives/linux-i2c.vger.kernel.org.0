Return-Path: <linux-i2c+bounces-9825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4D5A5F8FF
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 15:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4CF17459E
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 14:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EE62686B7;
	Thu, 13 Mar 2025 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="oNpNzR/N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D558267F54;
	Thu, 13 Mar 2025 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741877438; cv=none; b=T5fy07fQ4dYB+xUiF3maFllold4b9D+Zpl+WXzRFCjnRkaKlPIS6TDVGt8u+H6MJ74OrfFcZ4XLUEabKeahJhKrJU04rTuwizyNM5qZMMF5Wq1/SFPwH3uy3Wf4JObxebHt2c4n2ifj+i51jHaQMNwApieXT/DaEgv4d0ggnZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741877438; c=relaxed/simple;
	bh=T0coL3ZH523qYq6yfSUUv5gVtAh7nimv88zOywguTV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mmQts7rETd+r3fQ6xYU9S5vU8JgniULNVPKhCjaBA5UMhW2ISUb3ZDEDDTiB3r/Encq/4aUVpkDUtaYx3qzt9NF4QKo6tP9apC4nH5C51P00yuplp0XB2nSc5tAUai8RLSd2pLqkm6rR2QcssaZd+iYYdncpKnUqtRFEL291eCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=oNpNzR/N; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0B2661FDF4;
	Thu, 13 Mar 2025 15:43:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1741877016;
	bh=o2tHwAWQtKwr8g9xT8Y3eVDCA531Nfmh88jkGfw7L+Y=; h=From:To:Subject;
	b=oNpNzR/NP4Wnk8OaVf6aLoj+Js3rliqLCXsezM06RD9N44Gj4PMHNu2gY8zfZVhsX
	 31/nHy675Rf8E9e/KOzS5Qopvup8oAKd+2IO8CAX8KqCfaPvkeXkCS4iX6mgiOageC
	 ICOJmCkIqpSGv/NCB48bHVMePbhoediyMXN5+ux1gAAAGN2O5XB952HJiq5/7QhQaz
	 +5QiwzDVgMBRaMlWUCj/9AlBhjNyP1a2GGbvDVGlRZQkAA4MnSheHtZkWcfMf7bns5
	 rdEj6N+jwDab05TLQ0z0hfP831p6Vm8z4b+XJv3k4Gamxe1If5cHAKdxHh6B6LG5UX
	 FieUBm7/yPHIA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH v1 1/2] dt-bindings: firmware: add toradex,embedded-controller
Date: Thu, 13 Mar 2025 15:43:30 +0100
Message-Id: <20250313144331.70591-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313144331.70591-1-francesco@dolcini.it>
References: <20250313144331.70591-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

The Toradex Embedded Controller serves as a system controller, providing
system power-off and restart functionalities
The two variants, Smarc iMX95 and Smarc iMX8P, have a compatible I2C interface.
Besides this, different compatible values are defined to allow for
future implementation differences.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../firmware/toradex,embedded-controller.yaml | 44 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml

diff --git a/Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml b/Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml
new file mode 100644
index 000000000000..626e5e653c0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/toradex,embedded-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toradex Embedded Controller
+
+maintainers:
+  - Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
+  - Francesco Dolcini <francesco.dolcini@toradex.com>
+
+description:
+  The Toradex Embedded Controller acts as a system controller which provides
+  system power off and restart.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - toradex,smarc-imx95-ec
+          - toradex,smarc-imx8mp-ec
+      - const: toradex,embedded-controller
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@28 {
+            compatible = "toradex,smarc-imx95-ec", "toradex,embedded-controller";
+            reg = <0x28>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ed7aa6867674..19d7c17c0115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23972,6 +23972,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/topstar-laptop.c
 
+TORADEX EMBEDDED CONTROLLER DRIVER
+M:	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
+M:	Francesco Dolcini <francesco@dolcini.it>
+S:	Maintained
+F:	Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml
+
 TORTURE-TEST MODULES
 M:	Davidlohr Bueso <dave@stgolabs.net>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
-- 
2.39.5


