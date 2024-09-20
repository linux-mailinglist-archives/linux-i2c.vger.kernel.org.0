Return-Path: <linux-i2c+bounces-6887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D29497CF86
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 02:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6A01C232E8
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 00:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F9FEEB1;
	Fri, 20 Sep 2024 00:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="DJjaeQdW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC7010E5
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 00:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726790980; cv=none; b=myfZ7E2zyqz+i+YXLzH7qfR/LzMke7FXZe8+Uy+xuac/T14ePQcEirq0yEmSbHIAVntf4A3ZdguJKLYjPUktUrDxolFVJ/b6iUMHnU7yQLdEXUBVFph5zvnoF7MbPXjZw4mySkMR4aefbmwLXSEbUz8ezHUp+f5PV2rm4rV1uPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726790980; c=relaxed/simple;
	bh=sn/FlAe2hCqNUqc1Pro3QgAj5R9aEYkp9m2CvWvYGc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJGweNY+/6nUOlnpgL7jBsK47/RoheJNYybXvh/iZA641M/JvS45SSyVDBCCya8ZXpU+tWdbVnvk+1+AgcHw/U8bYATO5j+nfjlMukrUwWe+/BCkgtk+Zsfr49UqYOs0vrjYTecaOW/8h/7CExLh2YaCehkkkpNFlZqOsMVh0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=DJjaeQdW; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3516B2C0580;
	Fri, 20 Sep 2024 12:09:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726790973;
	bh=2I2K6N0RsgC/T5TnR71VnjrUfzEdBRS8BBLiTkX7NOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DJjaeQdWb7yE8mjdpZLZ4sJkTqU1Ltb0YDM5Zs4030YEPAuaX+5l69kOkpnXjhlcA
	 emhFnyJer+s0sa0JjpnQp9sumnaAUmURw0wsZGwHEiXDt+B+FwL+9Uw3RjjPh10OZa
	 sGYkh1S/1PAeOoH/RbdXHEWH2/LOYvBGPTehtTbeBq5sgezowbQ6VLSFVGKxARGWVm
	 FjeFDO9AIu9WHGYoNcpdiW/TWnMLTLIluCytfJHU2HDbpyMSMj2aDYhgtkHdI/j7oR
	 CzPUyd+iPUVVWtzaFG/MUMX/PfKKAMqIDAyEWQib4tIH85v8RUgWhn8yUYG8W1dL0L
	 TCNjTns+ZxKEw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ecbd3c0001>; Fri, 20 Sep 2024 12:09:32 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id CC54A13EE6D;
	Fri, 20 Sep 2024 12:09:32 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id C766328044C; Fri, 20 Sep 2024 12:09:32 +1200 (NZST)
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
Subject: [PATCH v2 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
Date: Fri, 20 Sep 2024 12:09:28 +1200
Message-ID: <20240920000930.1828086-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240920000930.1828086-1-chris.packham@alliedtelesis.co.nz>
References: <20240920000930.1828086-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ecbd3c a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=UgJECxHJAAAA:8 a=oDVXf_xxoK2ozSEg8_sA:9 a=3ZKOabzyN94A:10 a=sptkURWiP4Gy88Gu7hUp:22 a=-El7cUbtino8hM1DCn8D:22
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
    Changes in v2:
    - Use reg property for controller registers
    - Remove global-control-offset (will be hard coded in driver)
    - Integrated the multiplexing function. Child nodes now represent the
      available SDA lines

 .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 82 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300=
-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
new file mode 100644
index 000000000000..e8c37239b299
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
@@ -0,0 +1,82 @@
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
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    switch@1b000000 {
+      compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
+      reg =3D <0x1b000000 0x10000>;
+      #address-cells =3D <1>;
+      #size-cells =3D <1>;
+
+      i2c@36c {
+        compatible =3D "realtek,rtl9300-i2c";
+        reg =3D <0x36c 0x14>;
+        clock-frequency =3D <100000>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        i2c@0 {
+          reg =3D <0>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          gpio@20 {
+              compatible =3D "nxp,pca9555";
+              gpio-controller;
+              #gpio-cells =3D <2>;
+              reg =3D <0x20>;
+          };
+        };
+
+        i2c@2 {
+          reg =3D <2>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          gpio@20 {
+              compatible =3D "nxp,pca9555";
+              gpio-controller;
+              #gpio-cells =3D <2>;
+              reg =3D <0x20>;
+          };
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


