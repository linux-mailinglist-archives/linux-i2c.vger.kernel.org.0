Return-Path: <linux-i2c+bounces-9676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41454A4B791
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 06:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 571A316CF55
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 05:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175F91DCB24;
	Mon,  3 Mar 2025 05:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE0FNt0r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C123BE;
	Mon,  3 Mar 2025 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740980027; cv=none; b=CDSCMhATFSq+FXCpldK4TifsoYRp1UWrrQzV1ze43aukG169Ct8+QnrDbZXxh4l+GX5g2aUhIiG26OLimCupK88fmdGf7HPKbKcTXjTyP++gaDLHOOCPysHvRxkwj29HoUNk7kN7fVbSsTDvR8GEaTBB38eRYgVeFAc/tyrrLxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740980027; c=relaxed/simple;
	bh=WyvZQZnkegQJcav1opY1yTg+77W2I4l0eYIU9UQKJUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cV4kt1rhpQJtpxT8dmV3WFIowIzLp0b3igzShBlsnHijHwFMdPothN7LibvrKm0LcI4Nmb6jpYT2aVmqv0Kk93jLV2mPNwgsrrNVv8vo+nhE64HlcQ6djp911qleFoysiL8rWVr2swVrN5UpSCvbXVnb6fy0PJlKZwgsNVOUdSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE0FNt0r; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-22356471820so61093375ad.0;
        Sun, 02 Mar 2025 21:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740980025; x=1741584825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+eXT9z/Rb3KNpQtDwfjs09oHkg6BFqRPNyVa/Q2Gt0=;
        b=bE0FNt0rx5cK+ftFhPHzN0o7gWAVEpRnQPErC6pihwcJP/3AYq0qCI1oEticyRTg5b
         BhneiUdbu6w+oSeUZGhuwBhukPWs/DNKaW2srlBQJnWl7OEEJYl2fdvvbxjBFm/uY3+Q
         RbqYAge4jaob+rw+VYsOG37N8B3qlWoVaYHEQphgNyoOfjC8UHwbZ1BPZoQKiJGEfWUO
         +Xnc19ZdSkoNC3CVS132+hJCVX/ePd/gm/a9QwghE1dSF6HKND0vH3vjjvTyN/bKTdZL
         O4uDB/N0hU54AH0EmmRgXD4MkPFaMWNj5CG7eIOhij6f7V9+mjF8L1Xe16it2atmxCPx
         m3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980025; x=1741584825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+eXT9z/Rb3KNpQtDwfjs09oHkg6BFqRPNyVa/Q2Gt0=;
        b=HPnKmIAmI4cFpevgJshgLcmsJytGtgWKn97NB+u0oWM8z6R3IXw0zoqvBCQhmHnEtV
         oKUFaMDarWJH0V5kecexbyWerQMLQhuU8qyfcwDa3a6wDpsr+u8/Sfp/s73BE04Z9HwP
         LziwT3F2oObA549dir79Yrj7s0gPO9zb9bjMw+SGLEDdLchow8+I4zeR4Lti0o+Qn0l0
         Asdd/SCbPtKnQrJkt3x6mk0B4ew2+sv+fYE52ijJb5apVC1xck0tubEJUCl3/KqQPfjG
         4MsO0HFlR93/d1jVYIpV/ir50wVrp4ckHbyztfFFXLdwcGNLBT+dAEog+o50L+tYJRNG
         iD5g==
X-Forwarded-Encrypted: i=1; AJvYcCUKtbVtRK9VJLqgTSWbnEGXPsu8ioWWuUBAvO9L3xhN8sN9mVEtYQN2ZmGUsJ3oL48bMKkjoZ5yttWk3FeT@vger.kernel.org, AJvYcCUk+KmtzddxLDCMtMl1sZ0a2XLnCj1WfuZNakAWY1eWH2Xp/aphR6wryjxQNIdSV2CqgjyFfQdXpDC7@vger.kernel.org, AJvYcCWdFGK+TPz1kZknrgN/HP769rrhcCi82RC/eNj6wPSUSHfV42f19W+ML7/ssRd3xcQk6wMNErxwFr+w@vger.kernel.org
X-Gm-Message-State: AOJu0YyGPUHt2ujaNrEV1ZrG9yrDiWkDhToHXojgaipbZchFI7M/EJiz
	e1TtyYTwCM2r5dVcM1RB1OYK0dfCL9FlPYh3//L9ms5wM2Q2guk3
X-Gm-Gg: ASbGncunLEVQOnPa6eQgLZsib8eQETnTX8amJechq52zQIz2UBVyrY4EpGjMxxegCN4
	UVdYb5xBgsBW9iRc3636qAXt0BFfPARasyE59Wf9k7mCWboGPRDcZLL+JMXRCvZ876+iavvcDzR
	W6Mt45vZ4oUG0vFxwTNBKw6dGeZQ+WCi6Hh/HnnIIfyvayqVyD42eO9S8eSYOSiQnTh+lRcoKdJ
	BFWpZHvgn14G96LmRHudfmv9AI2mjTcGCLIztNeVsiT0HaI4abV3INU3jvfHKvV9JPq1bQ93qVs
	kT2OgQRaczOfbbsgGuNmjAI7qox+/eiB/JdYh3TpjI+c9pGkTuKk
X-Google-Smtp-Source: AGHT+IEyaUjmgSlTtj+8k2F773pN9r5qnqS5vCYIihiuZJW6fbf014mZKdFIuFfygmkGDpk/z8yWag==
X-Received: by 2002:a05:6a00:2191:b0:736:5504:e8b4 with SMTP id d2e1a72fcca58-7365504e9fdmr3983858b3a.19.1740980025412;
        Sun, 02 Mar 2025 21:33:45 -0800 (PST)
Received: from [127.0.1.1] ([240e:341:e66:ce00:d50e:ead5:2cdd:617b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364b4eff66sm1856002b3a.83.2025.03.02.21.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 21:33:45 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Mon, 03 Mar 2025 13:30:55 +0800
Subject: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support for
 K1 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
In-Reply-To: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740979868; l=2000;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=WyvZQZnkegQJcav1opY1yTg+77W2I4l0eYIU9UQKJUM=;
 b=0ubbWNBWTlWWqmCoMVoGa4yBgAQyxEgJ+1WF2YIEEYL79YMfXOo4pMDgR72wGcovLwLiSJ1u2
 Qu2PRZqdELIDEThOa50RkOtck3dt3NFvAOJrN60sWZKm694J8pP/IDm
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..db49f1f473e6f166f534b276c86b3951d86341c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C controller embedded in SpacemiT's K1 SoC
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+
+  clock-frequency:
+    description: |
+      K1 support three different modes which running different frequencies
+      standard speed mode: up to 100000 (100Hz)
+      fast speed mode    : up to 400000 (400Hz)
+      high speed mode    : up to 3300000 (3.3Mhz)
+    default: 400000
+    maximum: 3300000
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
+    i2c@d4010800 {
+        compatible = "spacemit,k1-i2c";
+        reg = <0xd4010800 0x38>;
+        interrupt-parent = <&plic>;
+        interrupts = <36>;
+        clocks = <&ccu 176>, <&ccu 90>;
+        clock-names = "apb", "twsi";
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1


