Return-Path: <linux-i2c+bounces-10401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65164A8B364
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0499D3A6293
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30246230BCA;
	Wed, 16 Apr 2025 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iw7hXb5j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F677230278;
	Wed, 16 Apr 2025 08:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791720; cv=none; b=IFti66U4nXd3BDH9PdqTfTE5XHl/HujHelYUNEXnqAYFUFxX2GpB77IgG/Vu8/UZUy1Q0S3Mm9czIHQ0apo4Y0ZFbwOU0q32QCOjcYh9PFHFP310N5NnsbNq7RCUTnimxaGsS5wAKtvm1jsG13BM1pxWhi1O9Wbbd+wPHl2M36s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791720; c=relaxed/simple;
	bh=rLGOiAxFmtYr1z3EibKMzDrgcDWDiyp5KqoWHiu8Zvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8sm2YDr0jo8HXvKMBrVEgfC1FOLdMKATcR+wxVNIQ/nfy+ayCv4/wOCQ9i5AVB0wEbWGmwZB26GmxFxPRNNT1n30gBwo6i9YIo4kNO2zznskNXAYZBjdSf+C3vJWqcvSrAN8ZdV9p26gfH7319Nx4bBlCf9ldC6v/jG5nXemT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iw7hXb5j; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso59443631fa.3;
        Wed, 16 Apr 2025 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791715; x=1745396515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zF2nLiIalRwSIJzUkKVjQarCty9tVHGhPYWypqzVXUk=;
        b=Iw7hXb5jT1lcTliZ4UI169GCw6zbK7s6CPdVrIIE4xFNIaYh+mNKKu5LVb1B72QPR7
         8TnZ88pLUZSvmXyBI8120R3hrRmLF0kuOmIEVLUOdSNGoAsYOdEpudFmKKmtlTPhk0hO
         ae32qXuRYOca2tWUy44PpLwhaZ7B09uBhGx2zL8hTBSvlQ0gfuuEistj4MzInZ4TWPZh
         g80DWasnag81TAwAnTSC9ELzeFkEidpXWGSBbQfqWNptx7fCsT2eqjyhOQbElsMIr3UI
         k9a/5ia/db7RNuIstSj0+IX4uU4UJxBanpkxwGKgkKq6ugxrQtKfbzmKTLmshVIsF2RO
         hFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791715; x=1745396515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF2nLiIalRwSIJzUkKVjQarCty9tVHGhPYWypqzVXUk=;
        b=Gg7fK0ebHjw5dYj00nA2ORIajd4YstPOrk18g280yW3y2NcSBNf3Slgdt6JEDXx2zr
         /j6CAbpMtOHJNP6jVTgQMDcMIseTrkZfGhkz8fKP6e6iPcMdlpXBYzMN0b0vzqSoXERU
         FkoITfdp9C5/TMeT2aozgNXqzs7ssuzLKWnmWivOmtHfvwvKu8Th6jDHGGUZYoB/Z+ww
         zYdZTLuuZv/0RjHsNPFRoqf2KVK77gPcfmtG1IbK9utSnoABFymEg4dqB1IjzCXXsQi0
         /HW5tBJY10rDfmj+xH/2lfcrhKj3AqktExgRHUhn48eloYgmoNBjOpEDs/1glI43Ky8e
         LxRA==
X-Forwarded-Encrypted: i=1; AJvYcCU3DyzUfRWcMaAAkIo8SYbZy9l1BWFuUfcqRfb9CYMRqKo2fn+me5uyRUSPrPI2D1xaPZlwIaoOgQFD@vger.kernel.org, AJvYcCUcel/O2q6aw78pVQsSFL1DDjJjF5xkTPDkyQq8Vis354xHtygSVPBFyB59V8NhgQ78wAtnPtb73d3m@vger.kernel.org, AJvYcCVT4lmrYn+7nBSywN8ymQjWRvjTNEmp+l4fzAM5/bMArZx6zjK4uANhysaa6JkE/LwdcvgpSekJnVTH@vger.kernel.org, AJvYcCWr/yz+lC13NclIMPU1XBI4WMpa+Dv4d3kmYkGlAuUPUjOsf+GeLzBDY5HFhVLCGVhN37kSqyxZ@vger.kernel.org, AJvYcCX0Vm6tGkgXF/HUaggPyx3LfXK3ZRDorQrBx0ozjo8cq/UegeiMmMYLHvFCoCTTPrHUMEJPwBggcD8kyHsz@vger.kernel.org, AJvYcCXKwfN8LQCWh4vFlpEIjeEjW57ZMOZszAYyuH9waWdubKSgjEZVk/dnmXanuo6Iy9g3aIsygge13+mb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3LuR6Los5oVi0B89vWW8T7bE7I1f9+VWLBZe7y+IhOANvYbPT
	NTKn71dn+b6zaM8Di0HfMti8LSDO9JjxO5t5krE5odUOqytfTFKj
X-Gm-Gg: ASbGncujnZhufrxQDYd9AXkAGhOIseAb73hkt0b+k+hIIUhX7hmOud0lp0BN07uRvRE
	MY8/oj/EuTv/EFa0mZyb0tcYKAv3zT4YhYSEWobitZu3gDuqEu6lCNh3mwQ62Twk6J9xxbabAuL
	SENcoDYgB+Lbd4ooLFl1y7CsvAk12Wizguo4i7krqXSCtK8c2ssYxksF7D36N2mfr0eP0TyUyye
	k6vIaquTY50uYio2LGEg8HfV2d9NDiqkafiWKrSea5b145/yKO4jdLs0yxh9oogV1e9x5xxi1D0
	LljBbC8uSOkka20ETE9QbcqKFCF6LAA4uTGcfiGXDSb2Ftd4U6yC
X-Google-Smtp-Source: AGHT+IGKgbxsPUZ8e6QYd3i4IL00BMajnpxY3Tdn5JifjzSLJUZac+Wl2mqvZhg7yql0uqt789LhJg==
X-Received: by 2002:a05:651c:514:b0:30b:bf4e:f6fa with SMTP id 38308e7fff4ca-3107f6ccf73mr2651111fa.17.1744791714786;
        Wed, 16 Apr 2025 01:21:54 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:21:54 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:26 +0400
Subject: [PATCH 01/13] dt-bindings: i2c: i2c-wmt: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3424;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=rLGOiAxFmtYr1z3EibKMzDrgcDWDiyp5KqoWHiu8Zvk=;
 b=AvOr1yeaqVjcM1b5V5n4K1CJRJqYHkLcBKvJWXi7s5DMJOf09NZaw6K648Ll8yfbyrTB3ZFZD
 6i4O11iiDG5Ajw3JEeQqkInw/fcubjZaW+5LjzieHsw4wBG6FC/ToiH
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the WonderMedia I2C controller
as YAML schema, and switch the filename to follow the compatible
string.

The controller only supports two bus speeds (100kHz and 400kHz)
so restrict clock-frequency values accordingly.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 -----------
 .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 48 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt b/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
deleted file mode 100644
index 94a425eaa6c78bc9e3136ae7055b51635baf16ca..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Wondermedia I2C Controller
-
-Required properties :
-
- - compatible : should be "wm,wm8505-i2c"
- - reg : Offset and length of the register set for the device
- - interrupts : <IRQ> where IRQ is the interrupt number
- - clocks : phandle to the I2C clock source
-
-Optional properties :
-
- - clock-frequency : desired I2C bus clock frequency in Hz.
-	Valid values are 100000 and 400000.
-	Default to 100000 if not specified, or invalid value.
-
-Example :
-
-	i2c_0: i2c@d8280000 {
-		compatible = "wm,wm8505-i2c";
-		reg = <0xd8280000 0x1000>;
-		interrupts = <19>;
-		clocks = <&clki2c0>;
-		clock-frequency = <400000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e498ce47b885203fcfe233b946f987abdac6784a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/wm,wm8505-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C Controller on WonderMedia WM8505 and related SoCs
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: wm,wm8505-i2c
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
+    enum: [100000, 400000]
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
+    i2c_0: i2c@d8280000 {
+        compatible = "wm,wm8505-i2c";
+        reg = <0xd8280000 0x1000>;
+        interrupts = <19>;
+        clocks = <&clki2c0>;
+        clock-frequency = <400000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..c5195a98b15a39583d337fb6310b80432b0f6922 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3427,7 +3427,7 @@ M:	Alexey Charkov <alchark@gmail.com>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
-F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


