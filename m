Return-Path: <linux-i2c+bounces-10404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A034A8B373
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFBE11644DC
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B3F234987;
	Wed, 16 Apr 2025 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGtcvzL6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344FD23373B;
	Wed, 16 Apr 2025 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791732; cv=none; b=IHinD5WFYPmBDD3T/M8ojEIHAVAizGEGRFAbHuCAAfkrHNo6ppHF23Xw4Rg+Om4dZrn8/aOtwaWUSDPkxV6lVosJpvxd928J5CCSSkWqXYsMwdc/0zF22rQlMttx5unboUif5jviP2/4bJiGPWTVACik0xh7WvcX+/sJCDaZFMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791732; c=relaxed/simple;
	bh=dcxoptYL9HCbCFT2aZUHR8rimZgrebZryeu0MSpFEqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfmGMZGw+6P8al7uBfqq3iCxbi4OJ4gbIvEFQxHcWaC63inmg0ud8KKDMtMfHzYVupWFVa3jkmOQTv0l1AebTssKTV6Jt4uSmA3QqybWPP54FP6pvv/w+E9EzwULJnVzeeKTASfG85sjpIO2JVV2ZIzSL4CIkzg/Byx2hvep4bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGtcvzL6; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30de488cf81so62187241fa.1;
        Wed, 16 Apr 2025 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791728; x=1745396528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8qy9kZJ9vS/40HWYigFrcHUynaDvE5wR9i1xbTW0Jw=;
        b=GGtcvzL6Qn6FhFq3yHfF2H1/dmXhbfkVYvQgj7L0ZqY3Z12N9L9krHAalbqEO1beul
         /Q0pYJKfHUKR5axQ8/w+ucAn/+6ccGEqDUYkLde/0BVdfPN9GFxtNcJRaxv9saL/Ujne
         UDvDOjdgduZCp3AwvTyKDM0Gy9RF4hZTRfzRs3AYCl9fOBW15017uNnDtp97n3ANjZL1
         j/HUY0LHy983/Pb5KU3lW8mgWPIVVtlbGAtiJk7F3Wqumn5T9gazhZp8Rfw61DHJ+1nk
         4S/fOniAOLwXKP3O17XRO7YYAo/Jf7xa4//9uLx2n72GQkvOW7PApj5UuQtc5sx0+3h1
         oWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791728; x=1745396528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8qy9kZJ9vS/40HWYigFrcHUynaDvE5wR9i1xbTW0Jw=;
        b=oWzRNPGz2KT0E0O/owIrxErKLlUrv0ZXuTwdTyRsBT2HuAQh6gNgJLoAwzGAFKook/
         XuK5kM/JLQmjL+cfksD4GIVyMw8gwlrG7tYpSlksq2GnEw9WyETPDtxYBbvXc+dbS1wo
         VNHUK3fw3NwD7L+rpSakKQULpM6ii4J1axEFey/jmfDMXVBgRMTOIDEMYqWEprvX3L1w
         OV5ZoHtC1HrevyXmMTqZaBfmRE1J/EBwb4oiH2PuMwuBNQVWtZDkFe6Ig80MQMuPLxbt
         4WfxM7vMV04mvXN40nIxV9dKQZwCBIJGT8SUCZmvwg6hIComt+FT7f6CCwRJMjGCDGVA
         xUSA==
X-Forwarded-Encrypted: i=1; AJvYcCU1M6+HR31VJth7XtUKiU6W83UoOS2SHKu3ZMgLSP2tJpzlyib8mgoqif1Icjzn3B7TQtSQoT5OI1G7@vger.kernel.org, AJvYcCUSLr+qR6kQtYHgSO/IcmrIXsCyYScVOAR0ZiRGIsjDQqz4KxTUS2GyT0jqXhGVMaOle63ib9bd@vger.kernel.org, AJvYcCUpJtbtsx5sKPl8mxURI80h6sQaOxvB2xsqO6LvETko5HFyXUTo1mVhFqRFmY9X/aa9PWAxHA3wu+KWRrf2@vger.kernel.org, AJvYcCVdCh5OAwlE50FHIirpf9TsF06qX6nFzbNll/M3JVBhG2pA+jZuWZpaAGknpR92XAOQw9RBxd0zUguz@vger.kernel.org, AJvYcCWDNKmQpqacP/+sIlXewVu++jAMRKHzROJaux2JSN62iqlxLzUu5eaiLWJxysmMfvl6rUfvWuD1FjZ3@vger.kernel.org, AJvYcCXP7I7WxVNOq9MyYiphbelDPBN4dqnVltJeGtSJweOvgjEBKPPwIYpZqXbGkwRyoRRn6t3PnfulRi2G@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1CERLGudJ/75UlWmmwrCFKaI10SJ4Pefuqj77axExn0tOGmxT
	DAuomHXlLvSFoICIBDaBT/gD1tElgoEH5j2rHSUZx5B7q5zLTpg+
X-Gm-Gg: ASbGncvTJ7rXaSjJ+1g/y5/WDhFiQFYYufxD+VHoLAfjKiC275y9PDvmkH8HcTW18F7
	QX4kh6vlwjfvF0w1cS1df2aNgRlsNK6Pjx/DWNYzXbrFqOEQ8o7ypICmrnxXZUnT5ZlcRSHuPE3
	Kq3lDknX9RjE3WwiefCo1mthfF3iTQ6JJxMU93RGs2vNPduZu1fjg8/+1KcssPisc5yXddQHBq0
	1t4aAtK8ge7DKRqBVtfSS7qN8fqGxKdPk+vfp3fFYSFzF9a3fal3IQqkj8jzub3RD8UiEvQ/A1e
	jUCP+t4ymQ453N++EdRwW+lxMKGtZjHhnk/x0P7EXGt1QZyDVJm8
X-Google-Smtp-Source: AGHT+IGwzEZB6Wbmx5s+djW77Fr70WX50lyYPxCuVy7xrw+kB3xOzYK/2x15WkC714ccSbYnStizXQ==
X-Received: by 2002:a2e:9a0b:0:b0:30b:a20b:6667 with SMTP id 38308e7fff4ca-3107f6c05aamr3727991fa.9.1744791728015;
        Wed, 16 Apr 2025 01:22:08 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:07 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:29 +0400
Subject: [PATCH 04/13] dt-bindings: net: via-rhine: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-4-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3176;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dcxoptYL9HCbCFT2aZUHR8rimZgrebZryeu0MSpFEqQ=;
 b=bKiVZ4hj2U8YtTwvKXSFiS4NkhtwWoP+P9aKp8A/9LH8ZAT7I4eZiFe/vANxcE9TXeY64CXXo
 8oxCvDfslRACOPN9zaJsiJo8fsniCDH3sTpfUx2IYeNPt39dHTsV8z+
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the VIA Rhine platform Ethernet
controller as YAML schema, and switch the filename to follow the
compatible string. These are used in several VIA/WonderMedia SoCs

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 ++++++++++++++++++++++
 .../devicetree/bindings/net/via-rhine.txt          | 17 ---------
 MAINTAINERS                                        |  1 +
 3 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml b/Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e663d5a2f014788481dfa0c612c261eb6adb6423
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/via,vt8500-rhine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA Rhine 10/100 Network Controller
+
+description:
+  VIA's Ethernet controller integrated into VIA VT8500,
+  WonderMedia WM8950 and related SoCs
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: ethernet-controller.yaml#
+
+properties:
+  compatible:
+    const: via,vt8500-rhine
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@d8004000 {
+        compatible = "via,vt8500-rhine";
+        reg = <0xd8004000 0x100>;
+        interrupts = <10>;
+    };
diff --git a/Documentation/devicetree/bindings/net/via-rhine.txt b/Documentation/devicetree/bindings/net/via-rhine.txt
deleted file mode 100644
index 334eca2bf937cc4a383be87f952ed7b5acbbeb59..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/net/via-rhine.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* VIA Rhine 10/100 Network Controller
-
-Required properties:
-- compatible : Should be "via,vt8500-rhine" for integrated
-	Rhine controllers found in VIA VT8500, WonderMedia WM8950
-	and similar. These are listed as 1106:3106 rev. 0x84 on the
-	virtual PCI bus under vendor-provided kernels
-- reg : Address and length of the io space
-- interrupts : Should contain the controller interrupt line
-
-Examples:
-
-ethernet@d8004000 {
-	compatible = "via,vt8500-rhine";
-	reg = <0xd8004000 0x100>;
-	interrupts = <10>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index f106850b9d3d349d82953b672588b967a37ea27b..001dc954fb44cc9b26570d663ea3bf9214c2deff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3430,6 +3430,7 @@ S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
+F:	Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


