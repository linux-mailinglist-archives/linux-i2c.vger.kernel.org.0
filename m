Return-Path: <linux-i2c+bounces-10405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B38FA8B38A
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 492AD5A25EA
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EE0236426;
	Wed, 16 Apr 2025 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FP8RIrsQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E79C2356BD;
	Wed, 16 Apr 2025 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791736; cv=none; b=STldTlrN/9yUwXwCAIzAWHRz3dRxNMgi+BvGZfwweyg+KPM6UUAE5Teid0SGv1g/Iqa3dkXUst69a0LZI1kmEqDgoaOfBnN7RK2M4ICRUhDuwNFzfXQC48Wd+x4jQZmwUtbZ2r/jx/Ub1u7nmuZfjTfI5cjN4zj5ypRnJ19Zt0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791736; c=relaxed/simple;
	bh=pSa2/+lArCQElaZ7zv8t6mgy94jBQOEPi6HZFwmgmf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hjPcwt3hM0GQO2YBmWa30+dXCQcECJ74aY2nQA9yPePKRVC04f2xyQwBYDrHzRFnJdt6hemYGHIEaVm1rlQQ6BCLt43o+UDtJ56gdwOGUzsgl8WQ/+06hqjR8LWMXSzBlCRlHdIIh+BLVF2eMbGBwYTVPM378WZPvGhUrsuiKIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FP8RIrsQ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30db2c2c609so69877251fa.3;
        Wed, 16 Apr 2025 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791732; x=1745396532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dj5PT88n8b2JvNXoUABiLvbxSkILiT0Rl9oj3LLY50Q=;
        b=FP8RIrsQBGljIqhzi7sL/OTHO5JO3jNBVzUWq7zqanAhB3NiP++IWfkOrO3LEbBHnw
         mWB6m8w2gQ/iUbhh+R6ybvYG7/u6AZdZORa6xXQWr8u0+h/dJXZgWD5dQoKmmfDGbKG8
         zRm6pEhZtrVIk6OywuXnTjR5JnQ3yHtvKFO3zeSbV/CMaf7OfdS3WgUUSKTKkFk6Yi83
         xAmre3agx4V7CE14nXo98agv8P0/9G/WCmG7WdYZ1pa++uLbqDpusCIABMnRjFKMpqz6
         xz2Ozc93o6neNYImCdqwvFphiRTvCX/D2cVZmeZaeovG/GRem/YaXaco6F8QPzDoABru
         2yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791732; x=1745396532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dj5PT88n8b2JvNXoUABiLvbxSkILiT0Rl9oj3LLY50Q=;
        b=bJkvJqvexWQWZW1FFADOcjCVcOjT83TvjDnZF6V20t6KkICaOvTP+wWiJ8KuGKkkEK
         SfYVM+0d9xIYqn59PmcZ/XDhxRJ5wW/SQRfeBeA3aygrbbrpVV7V8hKrTu+yfMaYujFF
         kjRLYMG5lIlr6uGFEbuSsBHATVWdkLw+fyfVo0pHvV04Uu450KLjlC0PiYmYFtYN3V7Z
         rA5+oT+fZkiSUP7RugFcc7qtH3HFdEuoSlCqlspPSPnskeLAOGhLMHjT4HeFTWWCDX0Q
         fr0kVs2HPgtUM2uxAK5PhqCLb8stUBb6GXL6sGmZm6qIU2Wt1fegGRzMwTaCF/iK6jHb
         9NMg==
X-Forwarded-Encrypted: i=1; AJvYcCVbtoaXHkrX2fzsIPcB3OlbVEFWWSfRrPJay3FM3htwc7926HdWaYLGN9qoA1pSGbAUbfsMm9eByBw6@vger.kernel.org, AJvYcCVbxtffmA7NRTazoJFbnnleSR9Z8RlgTWbal4vj9MhE8Uk5xRONlCQtx9fITdAOmf/BP5Zrh7q3KSPbOstE@vger.kernel.org, AJvYcCWCZb3Ses0grqZXCptyMX8QX12OcawZKcSHhQw71NTom0uemDCTeiAdkDcWLy0o57nKVD7fehw/7tLj@vger.kernel.org, AJvYcCWKKcCFKVx1mF05CaetB+T2I1YKGbxONEdvLJd/EB9zlZB4DK7mJE6dd32Xn/fgRVKoa2f5X6kDKxyE@vger.kernel.org, AJvYcCXY1IF4MWHkeFKpJgK45G/0yoibZPOZnDn2WI3Hdxu38is/DW7IVu0SiuVagecX5FxdUtlkcOw6@vger.kernel.org, AJvYcCXrk2LX48Xvr0YL4yC+tc0LSNbYCpnJi0e7nn44J+PRvjlQnhAxRkpT2b7BFxU0awv53TMkGWRwSd2Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxVAq1UkbXzL/bTTWAK/gqMd3oJQrUsC1Lnpg3Pm3ax8w69IXK5
	FqrzajX8iQP3XVBxVLy9GALFF5fA0nx89g/i50W2X3pX3VEJjTXU
X-Gm-Gg: ASbGncvDNikvyj7g5Rr2yzHa6wtThqtfNCiPnvSTWgpa4StkutwqERyRlDDNWpxZ/FU
	4IxOYJk5zuStsLISL3E5PWXc//+/wH7VC7rRM8z2JzIPDpEe9Mrr4SmddVANVQcqRNmMEjhDpS3
	hg63kSr79nqZjet7WNEUcSeWZCJru4dTb0bknzEMx36iVPtAuBbYl271srG3Ql8ofF9cNgMpRTD
	HXduMZ/wiWqI7DTR6TDZ6xWw3HbwtUNL2Kytuj6XoIsqDj6PJAfAycxVbZ9963LZVXj+097hsNS
	D+BBxcLE2nt6+TGGkKERwN611TNt4vECtL6dVaeKbEOyEXfbN53N
X-Google-Smtp-Source: AGHT+IE9lnGE1KsUoj9JV0gEDYMhu1y4IoeMb6WofbocdBnl/7R5ilrJ5bpyWUq8Z39pTLiMZzYGWQ==
X-Received: by 2002:a05:651c:30c2:b0:30c:719:1145 with SMTP id 38308e7fff4ca-3107f6cdb69mr3020381fa.17.1744791732408;
        Wed, 16 Apr 2025 01:22:12 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:11 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:30 +0400
Subject: [PATCH 05/13] dt-bindings: pwm: vt8500-pwm: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3177;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=pSa2/+lArCQElaZ7zv8t6mgy94jBQOEPi6HZFwmgmf0=;
 b=5IArVazk/Vp7LbhkSLdoFtXb1jIC+84A1bxqEt5dF1N5SFJ/vY/W23YdW1D3UTtXNTpblMARY
 j/mELPMv6Z7Atzr05vYG8E6JVZSf03GFFz6XvrHPh1UESoohzwmf5mg
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the WonderMedia PWM controller
as YAML schema, and switch the filename to follow the compatible
string.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++++++++++
 .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 ---------
 MAINTAINERS                                        |  1 +
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a5f77fa848e0f604bed63c36b8e0996cf599cec0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/via,vt8500-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500/WM8xxx series SoC PWM controller
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: via,vt8500-pwm
+
+  reg:
+    maxItems: 1
+
+  '#pwm-cells':
+    const: 3
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm1: pwm@d8220000 {
+        #pwm-cells = <3>;
+        compatible = "via,vt8500-pwm";
+        reg = <0xd8220000 0x1000>;
+        clocks = <&clkpwm>;
+    };
diff --git a/Documentation/devicetree/bindings/pwm/vt8500-pwm.txt b/Documentation/devicetree/bindings/pwm/vt8500-pwm.txt
deleted file mode 100644
index 4fba93ce1985a1e4c5a361423725fafb10eaa339..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/pwm/vt8500-pwm.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-VIA/Wondermedia VT8500/WM8xxx series SoC PWM controller
-
-Required properties:
-- compatible: should be "via,vt8500-pwm"
-- reg: physical base address and length of the controller's registers
-- #pwm-cells: should be 3. See pwm.yaml in this directory for a description of
-  the cells format. The only third cell flag supported by this binding is
-  PWM_POLARITY_INVERTED.
-- clocks: phandle to the PWM source clock
-
-Example:
-
-pwm1: pwm@d8220000 {
-	#pwm-cells = <3>;
-	compatible = "via,vt8500-pwm";
-	reg = <0xd8220000 0x1000>;
-	clocks = <&clkpwm>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 001dc954fb44cc9b26570d663ea3bf9214c2deff..d131004add981446b08b1b3d572a3daa8377fd61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3431,6 +3431,7 @@ F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
 F:	Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
+F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


