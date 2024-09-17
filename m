Return-Path: <linux-i2c+bounces-6839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1DB97B61F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 01:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87C55B26B71
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 23:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B07A1925B9;
	Tue, 17 Sep 2024 23:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="cvef+SEg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D3B1925A3
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 23:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726615787; cv=none; b=MaY824K8WxWHQwcq5CJmiR5lFAqBwfx3LBepLqMXR7CRkpknJgzzhPPWCZ7apFnejjgnEjb6Dlk+kJWYJ3VvOjonVJxHpZXWIKvOYq8DdeKUyveoZwqmfpbSBDnswhAi4PlFhpnDld1J6LVT8rvrG2A2/DT7J+AZmEFdFVaysUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726615787; c=relaxed/simple;
	bh=4XKWbHDH3k5IZJIEee2ZDxN3yH0PLm7mX4JK9TUlNuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulzPYA3Ga09kgYBbshT9sPyLavRTbfdAMy17v/HlIlY3n0SvimmINnLWA36s0+zLUWldt54gZ9055bm8xngVyunCKE6k0WJjdVSA+w7xO7+4M5dHFpVHlnPKzkkg7Owc9UkFXfrnATq2yXdTa6SL584QLZbfL6SX8XNaLzR0XZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=cvef+SEg; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3F1C62C062F;
	Wed, 18 Sep 2024 11:29:37 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726615777;
	bh=Es0GKGajP1taBUIavduYfU2QHg3cC2kreSbopHTF+4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvef+SEgMoyot37PMHr5cFPQaUjNYKb8v1gut1BR8Lwzcdim7IFAMCiw8Kg69edFX
	 V2rh09K4HJMOr2X4EEYdeB5mjWlCV4aTvowRDfD7DLGZOcHOv1hMJwwuafE+zL1kkn
	 wMHyQnSZhBise6oPG+LK9dLgkAFgaFy0vHX0SuCEWAy+WMh8Wh8H965YpNa/7kX4pK
	 pUIqnbBC5DMYU7E6wMxMlxUJtjpEpAltnhjxXBeA8Q8ES32QFihpYmqrgCFROTAEGF
	 QOFD2sSR8BRM0sl7U/gh6GdbXgS3hD/umkhMm4WpMIfFuyf67wM7kU8LBxrFlyBJ9X
	 QdZJIooD0GNmA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ea10e00004>; Wed, 18 Sep 2024 11:29:36 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 86F4513ED56;
	Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 840AF280347; Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
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
Subject: [PATCH 4/5] dt-bindings: i2c: Add RTL9300 I2C multiplexer
Date: Wed, 18 Sep 2024 11:29:31 +1200
Message-ID: <20240917232932.3641992-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ea10e0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=8lrFv0nGYZjcjRuYp20A:9 a=3ZKOabzyN94A:10 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

An extension of the RTL9300 SoC is to support multiplexing by selecting
the SDA pins that are being used dynamically. Add a binding that allows
us to describe hardware that makes use of this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../bindings/i2c/realtek,rtl9300-i2c-mux.yaml | 82 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300=
-i2c-mux.yaml

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mu=
x.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.ya=
ml
new file mode 100644
index 000000000000..a64879d0fda7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/realtek,rtl9300-i2c-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL I2C Multiplexer
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+description: |
+  The I2C controllers on the RTL9300 support a level of multiplexing. In=
 the
+  simple case the rtl9300-i2c binding can provide a single SDA pin per
+  controller. This binding allows a more than one SDA line to be used pe=
r
+  controller providing a level of multiplexing.
+
+properties:
+  compatible:
+    const: realtek,rtl9300-i2c-mux
+
+  i2c-parent:
+    description: phandle of the I2C bus controller that this multiplexer
+      operates on.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+allOf:
+  - $ref: i2c-mux.yaml
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - i2c-parent
+
+examples:
+  - |
+    switch@1b000000 {
+      compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
+      reg =3D <0x1b000000 0x10000>;
+
+      i2c0: i2c@36c {
+        compatible =3D "realtek,rtl9300-i2c";
+        realtek,control-offset =3D <0x36c>;
+        realtek,global-control-offset =3D <0x384>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+      };
+    };
+
+    base {
+      i2c-mux {
+        compatible =3D "realtek,rtl9300-i2c-mux";
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        i2c-parent =3D <&i2c0>;
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
index 9e123e9839a5..178ac8a7e843 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19891,6 +19891,7 @@ RTL9300 I2C DRIVER (rtl9300-i2c)
 M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.yaml
 F:	Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
 F:	drivers/i2c/busses/i2c-rtl9300.c
=20
--=20
2.46.1


