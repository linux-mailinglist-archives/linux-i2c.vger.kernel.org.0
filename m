Return-Path: <linux-i2c+bounces-9671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E8AA4AF4D
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Mar 2025 05:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8B31893C7B
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Mar 2025 04:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D9C1C5F0E;
	Sun,  2 Mar 2025 04:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjmeWqit"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EED1C3C1F;
	Sun,  2 Mar 2025 04:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740891320; cv=none; b=tnZZZeSymv0qs2J9ixjj4FgxBRGt6YK5r+4GtUolaSJZgxBqUPKH1I++DRQjVana/sGFeTM8vC6IOg/+ZOx9lws06w5hTV6evxygfDCmCENb5SGWS83F5OsYCMIO5V/VegAuztWecbm4GWJgewY3Z7YKJjXAOah7Lx9UhrpS9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740891320; c=relaxed/simple;
	bh=Sfb4Omrz1NkMC60FT0g7m4bVx+uq3N0U0AC52Xqnt9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2f3faz8cJZLwda/7Xu+FwUgJlXAt9owdiiUoGVViqBjId1geOjix/UyeXNqX/OPDatGiaFmFADmwtrBtIjK0Qy2IPW2JRTGZ9/nRLFx3ILSR+DshgxYCzvKZGxGwLWNiljQ81LANt2fpRuFVGJkE6nQoJ29y1dbwDzsfOHawNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjmeWqit; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-22339936bbfso50208535ad.1;
        Sat, 01 Mar 2025 20:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740891318; x=1741496118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8UA4MHprNOqDw50/1wxBBH0Wcxx4sG4K+C13w4SBrU=;
        b=YjmeWqitdbIwgXqVdQluzLLzDB6L1k+yDflr04Knrjx4XS2t1++NlVgBbzb6vucXvu
         Jm1e9xWjme7zI2SrHkUk4sqqMx5x2BE/MIkm34l4Qu8+G/R6CPv75ZGkzT70GOvWJOdY
         aF33rNvI1iefnJfZokZXVWRA+hpXc46D8jMpUy0aYZoYgxL9CdtCfSDDDMzhPtNPbf4E
         H6QsKd4JCkl9m3iAat49ZwYgZXO5CGSu/SdB1c05FYeeYKN2OIp3Grnn6pTUM3t5mIYa
         lf9efaLJYgSbphxhW4ksLboP5RyNy82MH1CTjt4V7/10xdtdt8Af8cDUyAlJ8wGH4gXL
         qxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740891318; x=1741496118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8UA4MHprNOqDw50/1wxBBH0Wcxx4sG4K+C13w4SBrU=;
        b=jZNOGzpQUopf7As7KX0v/6pMfFwUmF94Qwp+WyIMy6WaM8H8/dmzFWZPin+fEoH56V
         YiVzuYWPNuUSr5N5V2B1X1uyaKVCNKMYCqpXRBDSMcK3ZpvOt5tYWJferF40sGU9qqdH
         QwcZX/yzAmeALZ5Q89qR1NZmS73YTsrLBwljBOIEl+A5538vzbkT9tE2QSX+5q8VTs5/
         hkPb/tdPn23MEz/VZ50Fkuxtxi2eeQPxJYIggWCv/ZMpb0/5kDvhnjf652Z2k7GD6ggm
         rvHaszrYiwkGQnQnOHaSuvUF8Nk018oYvIzE6WjdkpL260ZO6fEmBVd+Hlwe4JVETWzW
         hILA==
X-Forwarded-Encrypted: i=1; AJvYcCW6MrwI+hEBVrSpNez3ne3ssc6l+PES8ixMHxdNO2cyhIzGjbVpWyEVI7KnTRsxYn+u5/9qD95Yt77A@vger.kernel.org, AJvYcCWcaOYbdFBsZYk4LyU0M4qkqbh0mjx6Y7A31pqp3zTi74QLl8f8KkwaRSg3bXKVi+u5w9EcptiDfk8p@vger.kernel.org, AJvYcCXEDaIwC2FNwmFK3Li0bdFf72FDNuxzAiyZtLs/F2lMwHmLhYHPzJpv+5E3EIL3sWR7A8ZDMmL+FF5/Eltg@vger.kernel.org
X-Gm-Message-State: AOJu0YxFzzJ4OrAeXjdvC1VoSH26gC8D4TSFuYciklA20RDvzcXYFfj0
	wHTgYQ5vE+Np5RqfvrJWmuEEweWBx4Cl3jcK+a2P6LpKji/6OcsvKEZOhQQp2p7AyA==
X-Gm-Gg: ASbGncvUQB56gPYTLnp1tLGK0pdBb2ynErDYahWovlQ13bQESeDl94Jqg5arknbK89x
	qof/s3PbduPXYuXzj9RaEpYIPbCK234BVAu7KvYIiOrahaUfPCceSHwQeJJ4GeMPPgXIslEs1KW
	mnueOyEzF7TUirD4K8NP3QNGa4n2hsfjy2u3/kuQgLvy9548C0XEWnY/26VkY61wfXcCv+a3ewb
	hd264R9h95KJsfUgdPcWJDr/xaXBqvgBrbh+83WGFkTDohjTpOLneQRQZ/Qh9cMt7fBXgTlW8Xx
	W3j64DX12EzxkYsjT+t6CotYAMKQ
X-Google-Smtp-Source: AGHT+IGcOWRvVhpO+Lzj44hFBHvuT+/dqjw5qG3v2emyk6zN78mMCNj6CS1OBdlIULr+lXZ/TNO8CQ==
X-Received: by 2002:a05:6a00:188a:b0:730:7499:4043 with SMTP id d2e1a72fcca58-734abee5219mr13166547b3a.0.1740891317777;
        Sat, 01 Mar 2025 20:55:17 -0800 (PST)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb70sm6359319b3a.124.2025.03.01.20.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 20:55:17 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Date: Sun, 02 Mar 2025 12:51:48 +0800
Subject: [PATCH v5 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-k1-i2c-master-v5-1-fd77ad3c7e18@gmail.com>
References: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>
In-Reply-To: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740891166; l=2000;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=8g5a451T75BEcXXnmVzoZlVcgDtJc257KeDwX2a7Pbw=;
 b=3sFRXUbSTvmIrv+D7xNY3Hfk+inQnexgYWiliMhI2/Hi7sjv0rywDDRc3Y7Ef4hCv2FjMCMbu
 QGy8rHBNh8dD719g+WhOP74kcnGGWv6D4Ma4TJtuwSVFkxKr2gByQDk
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

From: Troy Mitchell <troymitchell988@gmail.com>

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
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


