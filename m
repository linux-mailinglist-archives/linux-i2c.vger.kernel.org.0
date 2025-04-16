Return-Path: <linux-i2c+bounces-10402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83460A8B365
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41C1D7A5052
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FBB23237A;
	Wed, 16 Apr 2025 08:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4TSF8dZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CA4230BFC;
	Wed, 16 Apr 2025 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791723; cv=none; b=sKXHgyLMWehQFcT0btd5WuGNziLrwPZolhiFsrUvO43ZNvRMdHu1ZRQmmQ24f3cEDI2mIftPvWgSvSZSd/FQ0j3skmeSJ5WjQPr2OM4TlIKo7XJUmIDAS9yXzp1ZGG+JzGO9394gnZXfSt3zyybfH7d0zp/IPiUaLV4oSH5bCuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791723; c=relaxed/simple;
	bh=2W1SHMnD1wJv8s4rxT5+Bc8wad9lO7RuGVZAfK5NWfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUL88ioCkcWqlkCdPwfFsAL31i631YxQRna4yJvsjMJp6WxVrr6aLBlaJiln3M1VSg2+FclQi7TaDhTcNbqUpPdDurtkRWO1M8WiPUplYxgGupeD11R61dlqF6FPCvE7HBtWNoIsJJnUEW6V67TyQWy1Cyi4zndsM60GC4u5L5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4TSF8dZ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30ddad694c1so65146361fa.2;
        Wed, 16 Apr 2025 01:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791719; x=1745396519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnFDDxT3RCgs4hQuTzPxo5KdXonZCEcEppJRXPSAGGk=;
        b=Z4TSF8dZfBFjP1LnPZuhEY3gv9FiAYWP/zbNJd1cIFmtbVB34jZJiRdIYSlAbR8A/p
         hUla+ekZHbvXAnx4Wb+gu5qhJ3iyqFDzZJzRzxYmQyZ+cCxaouadtZ1aeBmdApUS3dvE
         SVGjCc3vnEn6rR/pmzmVRZFaU3cfSaeb46SJGDqtrzV0Jal2IWezM0DDAufGM60vmQ8q
         V8i3FlGOgsACzXJDvKJK4i6pdkyjjxOOfbF3MtD29eK7WW/tMRPfujjMoBr2DfF6IHcP
         q4jL45F2R+crnB7b+CGfAiku6Wo9EGavzUaqTvehnX5BfsZVbmzDykRuHsBD0SkxeM2f
         ayhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791719; x=1745396519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnFDDxT3RCgs4hQuTzPxo5KdXonZCEcEppJRXPSAGGk=;
        b=wIyPIyU+Qk8go9by6yiOFwdzF7doPgR5Kuv9yNjvJmLabscqVAGgiR/IF0kGLuvYcu
         ZgM4wD0l2dtEA/tAomthkozG1+SekLQiuzH3cJ3tqkQo2SP+o6ZyMhXNGjJj+mmn9AuR
         2Xx3MMED5sZ4t9D6rD488sBjpSDeW1ZaHvlONjqHzMxytDjNdNelVFu65BW5BKm0G+uP
         y7N/jePaxxic+otRT4bQ36rWtABMdOAvmNf0Sn7sztPQfiy/6vi19iJ9TATpUZg/Jdab
         Q2tosJB0DXPed1HhZwYMhluX9aq+dIn9VrQjHajxBjSotJkwgcVeMdXmEEs9kZPx18L4
         UkTA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1y9XsvDndWmRmOt5qfLYM8guQFHB5dqcEUIr9Zw0Iu81qBzSFVD89fIkJ2wByHY0ZKk4v4UU4DXc@vger.kernel.org, AJvYcCUM9IublZWhtPMwzRssHF4Mav0VjQt/VulAk6VAFN96YhbOZ6ZaLmMvH9cYyhlW2tYtnR6F4e7J42IJ@vger.kernel.org, AJvYcCUa9aCQ2Dq6Z7Ay2qyOfQ3fGNQSzPyy5uw9jGZJQedVcK8UhEhUZyFFjHPRufedhdJa+ZbIpqHp@vger.kernel.org, AJvYcCVpA0+5uD6VAkskyBjCDqZjD6YMdfWKTkKI+GTJy+03jXeOvB+O91yczEJE1cQ0H7WlkEIaprBtbdjU@vger.kernel.org, AJvYcCVwyLtJTfmutJm0mJdV48JpnZEtduseQb2dq2X4UrQxpYY2OmM0VrEb4yoESyC+Hsb8ov0znDl8DG4k@vger.kernel.org, AJvYcCXWw7g2+TAVdgs/hZ6DUvlMxZgBtwZqiHLWNsSA6eDSd/blCCi8TSFHtwcSG2MSVTHqErV45fRwzo0quGNH@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmWTmiEIDZ6vmihkx+eV1lBCMcQdph84epuZoEOdFPrfsVhRs
	EPAP4Phlkvg5W+YkFYB7G7M9z2kTEVkTmJWfhwACQ/R78EQ21T8Q
X-Gm-Gg: ASbGnctaIo+LtPMsK5FZg4ogJxyGZsxSFniHlObTKXMsJ4PLHcttrA+0HGjg8YghkWv
	X8shiNXELI+1OGjHUrpNb3CJkmv9aQ02UVwBuHNHzDyQHqKHbgDgYX+9hUF6W0+1sTAV6kAbI3m
	U86vyvD9VpVo+yMmHYXUbfkJQso9foZqFb8jz0lrpWXL4uKToWJXMtfRQtqxuaLrS3ZWQibrVnT
	20CRNvrzLIKQszGX0LJ0F5G2M7OKSpfHre/q/PS+LUnJXi1Ykd1iIjMv5Hg8ud0z5ak+/F7rD7V
	1fM3yb3Lygs/WGPUCaMDXc4PnElRasGTr2bDmQpWIit5H+LpRber
X-Google-Smtp-Source: AGHT+IHNdTCVP4tlpYMLzSBTCmdb+FUKkztUoWWSmNuGLsZ5hHiJ+/N3ni46vWUo4PEUry2pLFGjjQ==
X-Received: by 2002:a05:651c:30cb:b0:30b:d17b:26aa with SMTP id 38308e7fff4ca-3107f68abc4mr3616141fa.2.1744791719168;
        Wed, 16 Apr 2025 01:21:59 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:21:58 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:27 +0400
Subject: [PATCH 02/13] dt-bindings: interrupt-controller: via,vt8500-intc:
 Convert to YAML
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3191;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=2W1SHMnD1wJv8s4rxT5+Bc8wad9lO7RuGVZAfK5NWfM=;
 b=wnZH8vnIczYF2PFpRnXlQOB8DA6hJWieCIoYcNSuQwFSJEENXMEeeZjEECR3khTDcZh4VyiMe
 OStBgKZwKCDApl97HJzsq86ijGlwtrE7nM48/qmNdUOxt1H6mzfkAar
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the VIA/WonderMedia interrupt
controller as YAML schema.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../interrupt-controller/via,vt8500-intc.txt       | 16 --------
 .../interrupt-controller/via,vt8500-intc.yaml      | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
deleted file mode 100644
index 0a4ce1051b0252bbbdeef3288b90e9913d3f16f0..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-VIA/Wondermedia VT8500 Interrupt Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-intc"
-- reg : Should contain 1 register ranges(address and length)
-- #interrupt-cells : should be <1>
-
-Example:
-
-	intc: interrupt-controller@d8140000 {
-		compatible = "via,vt8500-intc";
-		interrupt-controller;
-		reg = <0xd8140000 0x10000>;
-		#interrupt-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a3fbe985db276e6a3b65cc66c7de097ed0719c0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/via,vt8500-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA and WonderMedia SoCs Interrupt Controller
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+
+properties:
+  compatible:
+    const: via,vt8500-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@d8140000 {
+        compatible = "via,vt8500-intc";
+        interrupt-controller;
+        reg = <0xd8140000 0x10000>;
+        #interrupt-cells = <1>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c5195a98b15a39583d337fb6310b80432b0f6922..2444282096e03b301ed0e3209b4de7a114709764 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3428,6 +3428,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


