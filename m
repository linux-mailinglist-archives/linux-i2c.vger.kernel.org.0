Return-Path: <linux-i2c+bounces-10403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7E5A8B36B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95DF6168EA3
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2580D233718;
	Wed, 16 Apr 2025 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5Vsvsdb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118BB22FDF2;
	Wed, 16 Apr 2025 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791728; cv=none; b=NgJU5n4boHV2yhxHLIkO3QZb1V9G1KUPtGqFNPhUNo66XADgZ4mc+Y4QlLNsQ+TzGY4GIPy+l/9lfscDhDuZSV/zS4j90mitNJ/65tuShIvxXaSHsuuLp35FUhYfpc0JjqgHhBP0dT9pR5/xuyK5h8bRQnkw3tWHCxpg3Y8Evsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791728; c=relaxed/simple;
	bh=GDEv30ykcwNrp+ITbOwo9y2a8t6U4fArDqmF8aS5Xdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=So7Xh3tGoJ/Vrw2vboj699wpYv8xg+BcgvEqXg1jf5G3Y54EAWPYH/CPcooFxhdisTc7vV8jsyIeNmAgbk8UkJ0crer3FoKKU2M6zdJolfQDDErKbs31MPz31dKcakpJYC1qX0BOTAyUaLXF23SlkmJYtw1MbH3c2s8/GUHM/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5Vsvsdb; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-548409cd2a8so8473239e87.3;
        Wed, 16 Apr 2025 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791724; x=1745396524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hz3xMnjSXc8Vbo6UN6ksVtAm9/A6drzyntoCMibD+UY=;
        b=j5VsvsdbcgxD5ywKDT7raR4kAralZD/IrvwUv6fR68BbkResrrqXL/DJhr+EBWiMwD
         xW76Ot7ryiOkGZM0V/1jI3plAx9JlRvG+N5j2ZGNqFLqwW0GTFMow0DF7pNDiIcbPZmS
         aCU0f05Z4JO7CQRmaVF1JVCWB5RJDf6Rf8b+ZcWfN45blWtFqy0lxEgrv0RqxFDeLfDw
         laCQYlyL5yey5+LsgpLIHzeNy5xx7nCnIa5KMdE451g9wJpOmkDhObP+tXVHCPHrmCyn
         aigAOHqPV6Wku26Xf4AKZ/Lcb6mYfadhveieJ3oA3kn+nYYhnMhoFHaZcvz87nO4i15v
         PHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791724; x=1745396524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz3xMnjSXc8Vbo6UN6ksVtAm9/A6drzyntoCMibD+UY=;
        b=NdsCz4LF7KR/nQa3hKbqhrhwAL4M618ZBLW5PEdLHAgfharITNSyoxZ+oERcGxYMIL
         b5mKAaOJyLPDgKfloB5imigGw7a+7oe3YmW/4vL6yBVmS4MJmw6c09U+b+Mo4IVzkcj9
         Q+ogqxy5vdUNKh5UNlZCTzbDuVSX25ombnGqpT2GgDrkhhlCNiLnrje75Ufz12Y0WE8x
         kPhQQOWtSey86Rp3tKPRbO5YiP/wRfl/p+0RkCMnkdnGqGTwaEAaFpKpPfeTJWMu6EYb
         SNd1UdD2o8/tKPj7l9oqs3DsYy5wToQqDh2lEPy61ZOvuGYFrYG2TBjn7JWsd18FrvTM
         1RiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBoKtEYnFJpmTokmkVXjb/cLDWetPHgxL1qnA427X1xMKrS1ZBIg0eHtNJ7gH5ckLAX471fF9IJgr6@vger.kernel.org, AJvYcCUo9AYkFMlAO4qLgqlJEoMOT/2lnnFMg++SAGKUBpKvJ0b63Ou2IK6Ig/z3vtBi4Tukz2/U71liofOt@vger.kernel.org, AJvYcCUqyDFIoGCQZcLB2lsk0e/YdqcmvBVJJxX5KfYRqfaewaIq8zbdtS1/xLwIsu/Z00QOXzkN9WXT@vger.kernel.org, AJvYcCUtfyBilEDmo7ZFCWWfneKdwz0bmTl2Om4ejtvZb7CSMz8+xuqJABOXPKsKPHgh/8niQ4tGrzYzdUUIOwkz@vger.kernel.org, AJvYcCVkci/17Jls8b/MDK0SBy/AfNVLPxD7DkgDYLbnHbTUwWQsGKeN6e71s6LHmyzW+RYy52KNbAvy9k69@vger.kernel.org, AJvYcCWq4ooCqp8lfQztRXVUqf3VYbP0J5KaNf2AWxeTQ9cD6LId/JY7NaCdUnSwk6Vw9dV1Q20J7FuycxYt@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXe95a9Jc6cvwf+y9AAuSxMeUMuFyBQdOK2pM79dCm80jEejo
	29MuiiM117bUP1mbF5IHF3kB0LNCIYXJUPx8E9k2XhyGpPAXhnN8
X-Gm-Gg: ASbGncvL7R09QC7cORMtlCpkdZzdJ4SZmaFqbFMproYIKA0FvGI1dTz51lezVTFV307
	c48nd+ZCEZ5KuikMvTp7bIgIGdFKJk6HHzQnp6JYSJfm5Bvfqr98LNoKuF2QB22JIXCWxoglH5p
	IqOgZYPCu+BIfCkccMu5+gVsVQtRmssMq5x6Yo2zf8YtMMF0v946SZua2Fa+a1y+pQMSQteyFYM
	ZJEYazOJqmB33Sv66yDqjHjWjynXLAR3vUre4V79vj7N5WKCFBx8PMB+DJOE73pyXVoimINzqLs
	K4Yq86ynrNm8ksxVHjDtjIHLe0he2h4aZpUL0xiXVx5IeTLCdx+w
X-Google-Smtp-Source: AGHT+IEuJuLfFCt+9GyN1idWy06ZmoWNGkSGMSxNf750gdW+sq3Ker5OqE2naLWKfRaLvI2raaZoxQ==
X-Received: by 2002:a05:6512:1041:b0:54c:a49:d3e4 with SMTP id 2adb3069b0e04-54d64a7b65cmr279874e87.9.1744791723651;
        Wed, 16 Apr 2025 01:22:03 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:03 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:28 +0400
Subject: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3702;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=GDEv30ykcwNrp+ITbOwo9y2a8t6U4fArDqmF8aS5Xdk=;
 b=GCpdFEkoTHE9ybEwUmMP3zyIuVwotvOJHUhwhdPuS+K23AdgM+TEtrCEsV9kNiqMrLEc7Go9c
 pPuHSamLO18BrZxR9rp9FI8e2Nx/MOHbD9zNhPB3twsFUREVO16jeWc
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the WonderMedia SDMMC controller
as YAML schema, and switch the filename to follow the compatible
string.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
 .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 62 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt b/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
deleted file mode 100644
index d7fb6abb3eb8c87e698ca4f30270c949878f3cbf..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* Wondermedia WM8505/WM8650 SD/MMC Host Controller
-
-This file documents differences between the core properties described
-by mmc.txt and the properties used by the wmt-sdmmc driver.
-
-Required properties:
-- compatible: Should be "wm,wm8505-sdhc".
-- interrupts: Two interrupts are required - regular irq and dma irq.
-
-Optional properties:
-- sdon-inverted: SD_ON bit is inverted on the controller
-
-Examples:
-
-sdhc@d800a000 {
-	compatible = "wm,wm8505-sdhc";
-	reg = <0xd800a000 0x1000>;
-	interrupts = <20 21>;
-	clocks = <&sdhc>;
-	bus-width = <4>;
-	sdon-inverted;
-};
-
diff --git a/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a7d962bc13c7ff70b50448201b0416efc7f787af
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/wm,wm8505-sdhc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WonderMedia SOC SoC SDHCI Controller
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: wm,wm8505-sdhc
+      - items:
+          - const: wm,wm8650-sdhc
+          - const: wm,wm8505-sdhc
+      - items:
+          - const: wm,wm8750-sdhc
+          - const: wm,wm8505-sdhc
+      - items:
+          - const: wm,wm8850-sdhc
+          - const: wm,wm8505-sdhc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: SDMMC controller interrupt
+      - description: SDMMC controller DMA interrupt
+
+  sdon-inverted:
+    type: boolean
+    description: SD_ON bit is inverted on the controller
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
+    mmc@d800a000 {
+        compatible = "wm,wm8505-sdhc";
+        reg = <0xd800a000 0x1000>;
+        interrupts = <20>, <21>;
+        clocks = <&sdhc>;
+        bus-width = <4>;
+        sdon-inverted;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2444282096e03b301ed0e3209b4de7a114709764..f106850b9d3d349d82953b672588b967a37ea27b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3429,6 +3429,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
+F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


