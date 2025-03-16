Return-Path: <linux-i2c+bounces-9836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B57DEA6348E
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Mar 2025 08:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF271711E4
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Mar 2025 07:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B1518E750;
	Sun, 16 Mar 2025 07:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhpWHQKu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF4518DB3A;
	Sun, 16 Mar 2025 07:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742111175; cv=none; b=XzfmyZTWa+EoUzz7zocNAn5dWhHOYtzi4YmcgK6eIyw/9hUimPBniFcatGQZO4Wr/IaHg2NEsfk6zWguEyD+uOgsApXjUErjBnod9i1aKnK4q3WuievHbl5MKhbmkRGppUhfXF2l+dsTSKUyvz0XWVVz0WFpquAtuLNrQNObd7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742111175; c=relaxed/simple;
	bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D66R125NLaM/0SWUBDjvtTN72V1A8KO50zY7MkQOekhT5dPEUlIK4fHp6zBKSWnAh9zzQImUi8pUsAGui4fGApEJkL88DGxbTFcivWffTX1lH/cAhAYNsXaTsvXvUSGFscARu5SdjLMRwyoAKuHvIRtk8LHs98xE5HK3SBvv0S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhpWHQKu; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-223594b3c6dso66730855ad.2;
        Sun, 16 Mar 2025 00:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742111174; x=1742715974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=AhpWHQKurpYYIxavtjaZvyoqpw211qtH9GW2Cn16wnHyUAeYBV6Fd+r0bOSqfQXsF6
         qXv/0PcfK3iKcgcGVvwe0113oYZp7kha4BMrjh8ULpNJGsP1YwUkHgDYAZJjSz/OAo1S
         qaRG6nlZUkqs3uneEu6r5cFzQkqCB+1bl3dhHB6GmD+/RCH76zQya37BzGVu09eOCxrP
         pLP8OtzCiGVd364jC5Y2K1Vw8wrJEfSwi1XrhcgEqoHBhdpusnSjrHlFoh5IBXKh25pa
         hzWdofjQS0ClxqD1tJhh4KA3ghz51zNASolu7NoUMznwKgUXiTpG8vGppkbw4i2vey0u
         VQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742111174; x=1742715974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=PW/1MKrtSTBmaq6j2YStVM6vnrh3PbgalDIWcdS/iQCUm9+mN0gK+rGp9ZXv9w29+9
         XudX6qnhOaxFq27SqXoiy2Tf46h33xowosSLfBwDBOtbVZJHoBW1MvQJxjJ837T6/942
         nHbVQ4mMJXLJ7hfxb4P8tp1DA6kSC/3i/sHfACJqqfJsMaLyqgzFpxQGIWWxhXMtNeL3
         85d6NW0q4pTxdp+5a+tbyMUcUZihtDilJ0gD5r9UE3jMEcQcRo0DyvIxohaK8Cu2ToWc
         zvad98jaEiNvDUeyaN3sE44Qrb5GYnMV5jIalRPA1j+oLa3NTov5eP5pbl8mA4W8n0y7
         uvRw==
X-Forwarded-Encrypted: i=1; AJvYcCU7W7W74Rxa4/BpB3cfsS4BkDPCmaPans9qZe3agvyxtu+2MxQzeTXnOOM++SgGFQnqMNlvOplOla30J210@vger.kernel.org, AJvYcCUvANLW452kulsKpAyw3f491Yc4erp4rjsEhaTdWJa8JVYExtJNPcDqj5hw2eFKg6SPmG+FV6sfKrYh@vger.kernel.org, AJvYcCUxHbab7KVH06M9xkgnPGivrq1RFT1RR5p0/+44j1i0/zD1D1PaivL/EJghsQJhMEPc4YiTClLbNR0g@vger.kernel.org
X-Gm-Message-State: AOJu0YwIN/IWHc08FaFcDcp+0Ed0h4tr4zxV06TF0yIbHks+NmQZB+it
	7DQ/JMwHAX3YiQDZTePHGAHEBLQsK1IsMeOH/zX2JdiHhFfhpWWe
X-Gm-Gg: ASbGnctvrLeANdFzYPj4EtHjyNtopyL57IfKbngdDRkiiSS7vRazplzecE/6gnGm2Qc
	63mE8P4teM0EreG43piIqX3u+GFhnxVNvdSHcdEymwXsU2kHbm7cdLrlq+sePVP5DfjdEuxP03m
	eqFJ5DIwBweAgOoyS1kRvQXliRR5pQGHFaYKLZNZIGoqvZlzeNDgfEMEnl9UdlRf7yuNwxnIBUe
	dG8tKojQ/X+3biNGpK05yR0qltrdVC+yr9yPaP9/rxYrSapkwjmd4gZlgc0vQfGHdFJvD45GXTc
	VDbBvdNT4yQRksoUHfwGlRhKitHowby/wTOL7wQ=
X-Google-Smtp-Source: AGHT+IHnoTX4HvYj6GA+XsaeR/Z5lsvK9bYDQeHmDp9+70ZV3nun+eVO850kkAELvfo3/3lwtE3oqA==
X-Received: by 2002:a05:6a00:4b05:b0:736:ff65:3fcc with SMTP id d2e1a72fcca58-737223ed33bmr8204799b3a.16.1742111173585;
        Sun, 16 Mar 2025 00:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694e56sm5575907b3a.130.2025.03.16.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 00:46:13 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 16 Mar 2025 15:43:21 +0800
Subject: [PATCH v7 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-k1-i2c-master-v7-1-f2d5c43e2f40@gmail.com>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
In-Reply-To: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742111004; l=2169;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
 b=QN7vDkWymm9DXNpwH7BLID5XKsUCIqAc8T69dLCpf51XfHi9rFbn0wEu2xY3I4LyEJhNDsdQz
 kaS++L6eUuDBi3HmNLXanwqZeQUZHTc52mLBYrp++RilH5LSBEKkPkO
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3d6aefb0d0f185ba64e414ac7f5b96cd18659fd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,61 @@
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
+    items:
+      - description: I2C Functional Clock
+      - description: APB Bus Clock
+
+  clock-names:
+    items:
+      - const: func
+      - const: bus
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
+        clocks =<&ccu 32>, <&ccu 84>;
+        clock-names = "func", "bus";
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1


