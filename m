Return-Path: <linux-i2c+bounces-6947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C669B9839F1
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 01:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0EF11F23107
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 23:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB0312D760;
	Mon, 23 Sep 2024 23:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="YExdRcV7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9031126BE0
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727132560; cv=none; b=kIrL40D4j74p6jeWlFXqegTdd7czvxals1ulruInparyIx8KSH+9AqkaIp3cMupx4mSVmsF0xwc08FzFX9TLOtMR8Dyoz+D6qZGEf+dtm8+E+xxceAKK9lsHR7O0UNqf3tg/AWiIhZmzjYqJk9AUDhTtHmKha5pwn8E2vg4aF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727132560; c=relaxed/simple;
	bh=tSv633oQxnFOKV9CCK0CxIzSKZNz+reCUxWdwAG5t+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjQE8oF1aOrfKLQiLdN9mzvqxGFI0txZallGoTQ5DwmAw8pw/OndrlrAHA1idUtbp9QI85QGoLIjRUTZQOOG23gVIR0DEOy8oXHlrY3zNhjbZsANTPNX8MfpMbsJ2ZABAc2R2nimuVnLBXPN3333UlGkJQwG1z7Xxnk/zNGXecI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=YExdRcV7; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C1EE72C03CB;
	Tue, 24 Sep 2024 11:02:34 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727132554;
	bh=r4bQPTqUfHsrFnUSiSqaZm3CfayxGKWlJbim4TK7p6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YExdRcV7nvuvRhvnsIy7PvAmaeH0FbysolELaYeBOwxG4EqIjffAESXcsaOIkrgAT
	 A10/zhS9O+gHWmr7P9Ox6QpOY23MNEQx/uRBgh46BQzqo0dbmMulcpa2KGeFO3VNM0
	 ZWDjEGv+z9c++lXKVO1Gbm5sb6bT0Ge7sNrRGHgEq/TaSu/ANGHyBAN8qTPpCA5AJf
	 KDwezPkx9PlO9fUyhFI8jmHpyrg/EbXir1/KQsSFYKSGewNY3BLuLoepxlPa/tSMqE
	 BMWFxGJnGBZXSvzOIZjGtIU1p7vkjp3WRzBFf7ACXhQywawPzMF5cztLXHs7E5DFk6
	 k03yFGgUZqwXw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f1f38a0001>; Tue, 24 Sep 2024 11:02:34 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 9565613EE56;
	Tue, 24 Sep 2024 11:02:34 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 9098828044A; Tue, 24 Sep 2024 11:02:34 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
Date: Tue, 24 Sep 2024 11:02:28 +1200
Message-ID: <20240923230230.3001657-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
References: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f1f38a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=UgJECxHJAAAA:8 a=y9THkZnQhy_QIg94hhMA:9 a=3ZKOabzyN94A:10 a=sptkURWiP4Gy88Gu7hUp:22 a=-El7cUbtino8hM1DCn8D:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add dtschema for the I2C controller on the RTL9300 SoC. The I2C
controllers on this SoC are part of the "switch" block which is
represented here as a syscon node. The SCL pins are dependent on the I2C
controller (GPIO8 for the first controller, GPIO 17 for the second). The
SDA pins can be assigned to either one of the I2C controllers (but not
both).

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - Remove parent node in example
    - put unevaluatedProperties after required
    - Add #address-cells and #size-cells
   =20
    Changes in v2:
    - Use reg property for controller registers
    - Remove global-control-offset (will be hard coded in driver)
    - Integrated the multiplexing function. Child nodes now represent the
      available SDA lines

 .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 80 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300=
-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
new file mode 100644
index 000000000000..979ec22e81f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/realtek,rtl9300-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL I2C Controller
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+description:
+  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line=
 (which
+  if not-used for SCL can be a GPIO). There are 8 common SDA lines that =
can be
+  assigned to either I2C controller.
+
+properties:
+  compatible:
+    const: realtek,rtl9300-i2c
+
+  reg:
+    description: Register offset and size this I2C controller.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  '^i2c@[0-7]$':
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: The SDA pin associated with the I2C bus.
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@36c {
+      compatible =3D "realtek,rtl9300-i2c";
+      reg =3D <0x36c 0x14>;
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      i2c@0 {
+        reg =3D <0>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        gpio@20 {
+          compatible =3D "nxp,pca9555";
+          gpio-controller;
+          #gpio-cells =3D <2>;
+          reg =3D <0x20>;
+        };
+      };
+
+      i2c@2 {
+        reg =3D <2>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        gpio@20 {
+          compatible =3D "nxp,pca9555";
+          gpio-controller;
+          #gpio-cells =3D <2>;
+          reg =3D <0x20>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..ccb1125444f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19887,6 +19887,12 @@ S:	Maintained
 T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtl8xxxu/
=20
+RTL9300 I2C DRIVER (rtl9300-i2c)
+M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
+
 RTRS TRANSPORT DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
--=20
2.46.1


