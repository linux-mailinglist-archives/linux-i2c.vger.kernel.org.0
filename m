Return-Path: <linux-i2c+bounces-5420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91877952DB8
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 13:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF8E1B213B4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 11:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B1A7DA9B;
	Thu, 15 Aug 2024 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDDWq1Lk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4761AC8A2;
	Thu, 15 Aug 2024 11:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723722362; cv=none; b=ZBAz+iwiQ6URV+7ErcSj1+lSNfml5vAU8Yc+2IDNreHlB7j8k87FyOJAdVTIpCIFe1Kx8qalFV7sZMTRTcN+O9A5Ble+35gUKhxj86HWD7/t0phLjCB0Lp4fwjdjaTXVJ/m9fsfv0GENRAwRWs2/d5sgT7QOqISqiTeV6PcG59Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723722362; c=relaxed/simple;
	bh=VpjspMk453JIHOunH/RLTO9IPdQzWfX7Z/pxhe2EgHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMY4OtGm7KKYh/dGVXpvf14GHey6WWV6l9D/Gfp8IbBdoM0lmu8mt0/Snswk1Ij9nWBaq305TradiQBUYCfWtt1IvMw1uPHs34l/GYAZTgenPjm9145+WV2/wEYISpSUes6WccTgVYxfn8P2LXW+qs+4ACTtzD5WR+JzuZGx8OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDDWq1Lk; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5b3fff87e6bso1155959a12.0;
        Thu, 15 Aug 2024 04:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723722359; x=1724327159; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wceJuM/bJLtr3SVzfHfUR8ftk7EPEsj8fAnbxqXeEBU=;
        b=jDDWq1LkCzF5s7C/7krTbe+3mydQXFgB4pfJffiCuC2xmzweKo255Nos9uwYm6u0/W
         TeU5FVxpfO+r8HKeWHQyvzZG7Z+eplECiaAkynHGu0GZfev7CN4LyV3XCEYlkOWBQwUP
         MYpuAnbEd5mmVwCFpboqCruqn2UOWSf8JQOV2G+uJdjh3ahahxpU+qNKElxPNseiCMb9
         BlxqBO6rn8ppVoUp5kYpEftNHOZ/f41sB4jXUk4IHsXZy42HmWhuBWwk3KO4FpQqyEHe
         3l5GNChpHaiAq7vzOKOHINBx+/Miy1fC853TTHAZOatgosjopv78CzMGdfQfjAYgqFhD
         CHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723722359; x=1724327159;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wceJuM/bJLtr3SVzfHfUR8ftk7EPEsj8fAnbxqXeEBU=;
        b=hc0koqF9zNcBT9e2vdSuarO5bhT+EXg6f7Alm7Gh0qD5uoIJaAmMzRWPLy6BO7BAIO
         Vj25RxK80liYhLOv6PjP6A/2PQT3Plm2Fw3RSlYLqGVQihp9QpEJFQJ9ro95tPQYk6pn
         6H3MAdD+2jOGMZCNoerclqbw8lyskYUgBBYKpyYVtl6cxznSh4vu8Fe+kVWfPV+uYNTA
         wx2JXvI+fYQ+W5qVE22ELj27l+YOScaEYzL65C87H44ZoTgCgrDyVLbkRHHrlUaEXSXQ
         uP2be6A437M3tZQULtj+Fn/KArLVCpAtHVhHMCI9LupNcdQASifY9q6V7dbSjKoWfCkW
         nsvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaQ/oDMUAGvQLwpsHEGPj9Py/cS6lll+1CZ5ntG0sAIhY2+EcalfVPB9+wM5Nii+capPp+LW9i2ILNwTt5p6wymXQtO+BRsxlRuR72Sifgf/Ql/eR7o4LpGA0gnPvQhdrccEbtHiJpeQ==
X-Gm-Message-State: AOJu0Yw3MJ3cjQrBYQmJ/a4KjHdgE2jb5PWVJI6k9Hp6ekqVBsNZREei
	GxzLMK1am2blCaG/YoMylXpRMNSrDBWufDWiZuI00yU+QS4q5mnSeljfaw==
X-Google-Smtp-Source: AGHT+IFfI013YzD7AXBUTaTeAMiug4U5ze+Uy2VcSdFs3BdEo+kN57GRnlGR9Zpdl/r6EoIuW1AFJg==
X-Received: by 2002:a17:907:f1ea:b0:a77:dde0:d669 with SMTP id a640c23a62f3a-a83670335e9mr365570166b.45.1723722358319;
        Thu, 15 Aug 2024 04:45:58 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cfaffsm89703766b.76.2024.08.15.04.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:45:58 -0700 (PDT)
Date: Thu, 15 Aug 2024 13:45:56 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: i2c-sprd: convert to YAML
Message-ID: <Zr3qdNep9BCb7Knc@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert the Spreadtrum SC9860 I2C controller bindings to DT schema.
Adjust filename to match compatible.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 .../devicetree/bindings/i2c/i2c-sprd.txt      | 31 ---------
 .../bindings/i2c/sprd,sc9860-i2c.yaml         | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sprd.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/sprd,sc9860-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sprd.txt b/Documentation/devicetree/bindings/i2c/i2c-sprd.txt
deleted file mode 100644
index 7b6b3b8d0d11..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-sprd.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-I2C for Spreadtrum platforms
-
-Required properties:
-- compatible: Should be "sprd,sc9860-i2c".
-- reg: Specify the physical base address of the controller and length
-  of memory mapped region.
-- interrupts: Should contain I2C interrupt.
-- clock-names: Should contain following entries:
-  "i2c" for I2C clock,
-  "source" for I2C source (parent) clock,
-  "enable" for I2C module enable clock.
-- clocks: Should contain a clock specifier for each entry in clock-names.
-- clock-frequency: Contains desired I2C bus clock frequency in Hz.
-- #address-cells: Should be 1 to describe address cells for I2C device address.
-- #size-cells: Should be 0 means no size cell for I2C device address.
-
-Optional properties:
-- Child nodes conforming to I2C bus binding
-
-Examples:
-i2c0: i2c@70500000 {
-	compatible = "sprd,sc9860-i2c";
-	reg = <0 0x70500000 0 0x1000>;
-	interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-	clock-names = "i2c", "source", "enable";
-	clocks = <&clk_i2c3>, <&ext_26m>, <&clk_ap_apb_gates 11>;
-	clock-frequency = <400000>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-};
-
diff --git a/Documentation/devicetree/bindings/i2c/sprd,sc9860-i2c.yaml b/Documentation/devicetree/bindings/i2c/sprd,sc9860-i2c.yaml
new file mode 100644
index 000000000000..ec0d39e73d26
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/sprd,sc9860-i2c.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/sprd,sc9860-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spreadtrum SC9860 I2C controller
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: sprd,sc9860-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: I2C clock
+      - description: I2C source (parent) clock
+      - description: I2C module enable clock
+
+  clock-names:
+    items:
+      - const: i2c
+      - const: source
+      - const: enable
+
+  clock-frequency: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - clock-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c@70500000 {
+      compatible = "sprd,sc9860-i2c";
+      reg = <0x70500000 0x1000>;
+      interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk_i2c3>, <&ext_26m>, <&clk_ap_apb_gates 11>;
+      clock-names = "i2c", "source", "enable";
+      clock-frequency = <400000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1


