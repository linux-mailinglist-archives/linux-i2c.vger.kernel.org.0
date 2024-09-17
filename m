Return-Path: <linux-i2c+bounces-6840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD097B624
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 01:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 225CEB26A20
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 23:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5E7192D68;
	Tue, 17 Sep 2024 23:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="mzCm8bZd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F9717920E
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 23:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726615788; cv=none; b=MI0NFnUeHvMHpcOc+PH17WvrXkL7DjCZl/IPIAgmAfe497oJwA2DcSVmV1QCl/giq+WpCDJw7qEbphskW73ZkASFpW3El9RgvX16V+51WHCW3emvvHYK5B7/CbR5PKjqi1YStKHiZdjPyPzIUtxvieqYp5T0Jq1ueD2yZFkDDtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726615788; c=relaxed/simple;
	bh=PS96jAihdDtRMarEQelGNHWbItvYn10nrN4v+Fj67fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaXZpR0R7SB8KCv17ZEpvGUEvGHG/ivyNW4MmHgdP8GGX59Q67JbpUZLZGHGXxu5JoeLty8sBn82J5I57jzhaL0/78whkXZwsZfHDSz7upO+fw0Zmncs0XHUtCJK5XvGOBMhY6PFZqDFF1HQcUmbDK/K61ZEQegFqCS/D3qhSdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=mzCm8bZd; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DE7A12C046D;
	Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726615776;
	bh=f9JeA8d+mZ1OVpc38H0KjkqDCAD8U+9ZGkj1oHxs4Ts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzCm8bZd9ZDiB6LlUtGulzxj+j1RqDujVyj9ferde4kdK2VOkdOwadXYnQnCW6yeO
	 aVSXDBX481HfaH1M/Cku61/F1xJeuqUvx9eIeSH0igYS6u8YvSx/ldZko2fVBBJyAt
	 A25A8EGkOoe+FJNYnVSIbEQ30Oy3TOLM/gBgxyfHyoDcrfg+9gGaZUnYM0Z+wP6kl8
	 uHL8TtKeRfEAxrYYHhExBi5f6gXJxOvyzxNOa+V2mC6n7AlxVsqrR2vIpRDsf1eWXe
	 4CdIS5BRv2j35rAkkRFNYxPoiRRsjZgqvMpn205EvxFhcj+yOFayQu/wsOu1nymbeW
	 yT3Mj+3N6Y10Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ea10e00001>; Wed, 18 Sep 2024 11:29:36 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 7B0AD13EE6D;
	Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 76D27280347; Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
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
Subject: [PATCH 1/5] dt-bindings: i2c: Add RTL9300 I2C controller
Date: Wed, 18 Sep 2024 11:29:28 +1200
Message-ID: <20240917232932.3641992-2-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ea10e0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=UgJECxHJAAAA:8 a=lp7SEntL7-OLZ8pvscEA:9 a=3ZKOabzyN94A:10 a=sptkURWiP4Gy88Gu7hUp:22 a=-El7cUbtino8hM1DCn8D:22
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
    This does hit generate the following dt_binding_check warning
   =20
    realtek,rtl9300-i2c.example.dts:22.19-30.13: Warning (unit_address_vs=
_reg): /example-0/switch@1b000000/i2c@36c: node has a unit name, but no r=
eg or ranges property
   =20
    Which is totally correct. I haven't given this thing a reg property
    because I'm using an offset from the parent syscon node. I'm also not
    calling the first offset "offset" but I don't think that'd help.
   =20
    I looked at a couple of other examples of devices that are children o=
f
    syscon nodes (e.g. armada-ap806-thermal, ap806-cpu-clock) these do ha=
ve
    a reg property in the dts but as far as I can see from the code it's =
not
    actually used, instead the register offsets are in the code looked up
    from the driver data (in at least one-case the reg offset is for a
    legacy usage).
   =20
    So I'm a little unsure what to do here. I can add a reg property and
    update the driver to use that to get the offset for the first set of
    registers (or just not use it). Or I could drop the @36c from the nod=
e
    names but then I coudn't distinguish the two controllers without fail=
ing
    the $nodename: requirement from i2c-controller.yaml.

 .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 73 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300=
-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
new file mode 100644
index 000000000000..5b74a1986720
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
@@ -0,0 +1,73 @@
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
+description: |
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
+  realtek,control-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Offset of the registers for this I2C controller
+
+  realtek,global-control-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Offset of the I2C global control register (common betwe=
en
+      controllers).
+
+  clock-frequency:
+    enum: [ 100000, 400000 ]
+
+  realtek,sda-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    description:
+      SDA pin associated with this I2C controller.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - realtek,control-offset
+  - realtek,global-control-offset
+
+examples:
+  - |
+    switch@1b000000 {
+      compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
+      reg =3D <0x1b000000 0x10000>;
+
+      i2c@36c {
+        compatible =3D "realtek,rtl9300-i2c";
+        realtek,control-offset =3D <0x36c>;
+        realtek,global-control-offset =3D <0x384>;
+        clock-frequency =3D <100000>;
+        realtek,sda-pin =3D <2>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+      };
+
+      i2c@388 {
+        compatible =3D "realtek,rtl9300-i2c";
+        realtek,control-offset =3D <0x388>;
+        realtek,global-control-offset =3D <0x384>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
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


