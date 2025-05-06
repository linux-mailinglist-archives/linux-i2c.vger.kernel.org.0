Return-Path: <linux-i2c+bounces-10820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B895AAAC185
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 12:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D84BA18937B8
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 10:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4D5278142;
	Tue,  6 May 2025 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWrMZkNf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6572673BF;
	Tue,  6 May 2025 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527912; cv=none; b=rIvfWTKxLQtOXPFe6/1SkFgFRInJu40d+ox3jiN6opFW4AT0WRArXGTaycZNeoID6YU3tQOykAlHDtljmLNHghHgZjdruz7qn1yk6CmoChbWp/5mdG7FS2QOU5D7mYWw6QrO9OcYvKVYpEHQcq3o/qwKb6iDNIOOVAvM6d1rayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527912; c=relaxed/simple;
	bh=DsRp18KqLHynQ7ek2b6vxlNhlQdmZWpAkRJL4Ln5cTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XBB1jDhKELSQ5fwqgpNytbbTxKf0TqL2yjQsVFPXd9lKODah31di6i1t+sN9mzw2wnFVhAHmP42vIBedxwmTTqvNCoRTrO0679dDj5CGQDz7mr90E72ySIZxNnh95dZoBwErJXPRw4tbK20lB3cX85nitTDiZswZV3mfcvb+Asc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWrMZkNf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e16234307so31271845ad.0;
        Tue, 06 May 2025 03:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527910; x=1747132710; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXv90NJmJZRERtBytNCfPjU778hNLPiLy80HmbPYFyI=;
        b=WWrMZkNfmazDgtMI9P4zeKG6OA2MdaHNy9crn1PqUweHbNGm49UyhdlfW3Y5gidLa1
         1t/mG3yt3tnr6unFZOyYkVkKM98A4cLnX90116DFJevBvkzakuhBMQhvL5zgqSc/XQPs
         547YSsaO+IrM65/fawukisGrYYpM/89TJznrg20gColaYEzVdInfXy21BxWtfMjj/Y2t
         hsRQnHwkJJudyYdUF4gRuYW4V0beR1FnlyglBs7arsP92cpaui7AML8LX2pYxUzGUCb3
         hIPNMGD51gv6fDKy8HTAab3E5mYpPE51iFPYcx4KMUnuyw+9m7kCqnX+kpfaNUll419Q
         EHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527910; x=1747132710;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXv90NJmJZRERtBytNCfPjU778hNLPiLy80HmbPYFyI=;
        b=nmMrIhuHIzn2FWVaP4I+4npvPDiV09pbSPb+4JCLKa1mUS3LaSeBM+qR4KaZL/AA7m
         T+SWXVNLvrI9C6ETGEKizXyskB4lenz3XVVep9UmifMnGxQMfFCEOP4yc+NJMxp771ng
         9g1YLcn8/opEi22lPtGvF5RpEBk3T9bhyNSYXMuItk6M+jIR4Hjwe5/PGYS9jCaSpsK8
         lZpiTbmWPR7rPxonEYEozdAzRqODhlBiPgz0TfTaLqVMB+g14HRhmgIqGPs/tp1UIyA3
         jfxEYSqhOpJMdt5en57z9gae3iqzzQBo3BBNMd/BVWK06fFh1ScAfGVGR9Yf93pDQISE
         EAIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB1XomzAOhJp0JbbxiJvC0wl91Q4UogMmRKu4yDig6Tfj8yYn3AU3v/T2sYq39IfG6TYNmaXCE1g3i@vger.kernel.org, AJvYcCWtztUSvbe9prQSGuj+Mg6q4iH8jMQq8QCp6lURet/ysgK60Ke3jDT4V5FmfzMubq9kCkH8HLMzVebU@vger.kernel.org, AJvYcCXWsF490ZuwnWNbkNtGChGXN/OYrgN3tcAppqPTkbB8Ne7iQvmSh2J+mrQlsXclZjnkWuMqbE1ywakXj8Ai@vger.kernel.org
X-Gm-Message-State: AOJu0YxK8STq56pptkb3Q3X2Bnqv4yT3NA3gmTap5Lwlf5eOWi2TbLiD
	6N9RP2v9YJkG/RFZNh0iFgKUjjJhTBqJlaexgdemvmTcce3dn0bYUGRW2dQhUMo=
X-Gm-Gg: ASbGncuL2JUgPvHgTOFWH0FvCnez+LM84g/sDUBz3k8jNoiWVgTlTdWr73lcE5q2J+R
	FFpLxBLbbktomRyl4oJwBy5TipjTdjnbpv1SHUaNtJ5Qr17V24gs6SELTHdrYrrOg4UqT96t2g+
	5jbWfYw2ahwN0VVaMArRymt3XVjbqAHby49VTRxf6HWEpdAjHSNk5v688aSKWOyFmFpTSXnnRLZ
	BymGc4gOxx/dWh7oLTKOu8nJnh/AyzaoGq0cjj1ipYXNGv/rTeQ4KTHPHFFwzcjikxzkyzd7/D/
	W78P3eJhvbsxmSINXpTaZJMXMv3zlQC4OvwJtIepbCl82N03YfCT
X-Google-Smtp-Source: AGHT+IEQb8VRTFER+5/KPQ67cIaHptMVjdm37TypNQglY+WRH7pzbxrcVJBPZHwUMTsKykPATosOdg==
X-Received: by 2002:a17:902:f60d:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22e32776c1fmr35820535ad.4.1746527909820;
        Tue, 06 May 2025 03:38:29 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232797sm70470525ad.240.2025.05.06.03.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:38:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 14:38:15 +0400
Subject: [PATCH v3] dt-bindings: i2c: i2c-wmt: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-i2c-binding-v3-1-401c3e090a88@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJbmGWgC/32NQQ6CMBBFr0Jm7ZhxSgO68h6GBbQFJpFiWtJoS
 O9u5QAu30v++ztEF8RFuFU7BJckyuoLqFMFZu795FBsYWBiTbUiTFuriVDY4CDeip9QD+raDLo
 h1TZQhq/gRnkf0UdXeJa4reFzfCT+2b+5xHhBMiOzJcO25vu09PI8m3WBLuf8BXYdvIm0AAAA
X-Change-ID: 20250430-vt8500-i2c-binding-5b397b570387
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746527901; l=4312;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=DsRp18KqLHynQ7ek2b6vxlNhlQdmZWpAkRJL4Ln5cTE=;
 b=xVr23GBL4GVFKc7GqRfXepQhft1RJL9XZ2qsOs5diF9sQjU19v77z45H5YgmdOSFGLwEjZ/vZ
 EHC0zP/wNwTC+PzpHvEaFTp+KlfApn+6fLvPlZthelotjuprMlVMzEY
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the WonderMedia I2C controller
as YAML schema, and switch the filename to follow the compatible
string.

The controller only supports two bus speeds (100kHz and 400kHz)
so restrict clock-frequency values accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v3:
- Re-added the part updating MAINTAINERS by Andi's request
- Link to v2: https://lore.kernel.org/r/20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com

Changes in v2:
- Added Krzysztof's review tag (thanks Krzysztof)
- Dropped the update to MAINTAINERS for now to reduce merge conflicts
  across different trees
- Split out the i2c binding separately from the big series affecting
  multiple subsystems unnecessarily (thanks Rob)
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com/
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
index 16037aaa770fc35efb45fc26555afaa5102e2640..4d18afdaf12bf6a5956793814f8db39b34074a12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3464,7 +3464,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
-F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
 F:	arch/arm/boot/dts/vt8500/

---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250430-vt8500-i2c-binding-5b397b570387

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


