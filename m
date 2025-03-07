Return-Path: <linux-i2c+bounces-9753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77870A568A3
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Mar 2025 14:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABEC61890C80
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Mar 2025 13:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03268219EB6;
	Fri,  7 Mar 2025 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwtR+01X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D22219E98;
	Fri,  7 Mar 2025 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741353405; cv=none; b=Nr++Z0ZjSS1tN1Oe5WlaF5OxWQBSWzgt1HyKCZIAeBIW7TFzNPivNe/GE+zEWdf6rBZQJ9skWp3P9z0E+IwCAjwd3q8tb+Ol1GvmhzmItBPTrb5nkei++rakwtGR1Ee4NDQiePg4pGJhes1rzXM7V+8s1X6+/poI67NdJNc2nj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741353405; c=relaxed/simple;
	bh=Gc270i/DQwjrh9iRRxvjY11dqiqcfQ99KjBuKm1O9Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjTXkGazwfAdK1xnJJYL9NHykdbvTuQboHoZslzSX582/8TPfKIQPU65d6OeT3Q6ruZSFiBuBRQUIr7QuihIx0bgkM3pku55lTkfTTAwu47bIEpfD0Et3zaPdNdfyZ+FiHxLT5x7XLZqPhoakIC7hSDeis5+KG+gjjDBAwlav7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwtR+01X; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2fee05829edso3915009a91.3;
        Fri, 07 Mar 2025 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741353403; x=1741958203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efgQjhR4aCabfgdF2FkohcAA8CG2VfCPk8HHcJhIIXs=;
        b=kwtR+01XvFTtKUZiT0n9XJ/lflgQyY4++Y53nfvwZizqYhbtXlfOWrPTfWHaOeyA94
         CZHyV+bq0bcnESXMTKq65cGbF6jwx37N8cfeuEGiT0iygfta2MjeYyn3uxdI5mQGKEqH
         0V1pR1qdDFLQEYZ7EU0p2doBYizaxm5G6EN4qImfQbgTgHS88nSnUP7kXnce/AXr1Wtp
         XnRYu977jWwOtMtrALQmYbl1DOrYky3os+5FvUYJ/kTyy1sC3J5/2ILB4mW8UKOZQbAq
         8AVTlG97nIIMWum4n0a7AAiX1TANDsUKOegzqHUpxhb75d++wVu+NiA4yu/qoQ876ve0
         rlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741353403; x=1741958203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efgQjhR4aCabfgdF2FkohcAA8CG2VfCPk8HHcJhIIXs=;
        b=USnKQi0fBQtFEoW8IBCRHRypwBi8qK/D+cIjmITL8e6u9kn3L9EtOcvN0fNLd90CVL
         Jo5FC0SHecWGMzDuHIq0N0yyh1KXczzswBFBmvNPvoRpNERVKjO/qNL8PVq0PN4t5Xqd
         fxaEwJJZsS2JWOH8CL13/SDBIMIvZ98aL5M44R3WIa4KaL98PBNvL5I3EevG+qtIdo4X
         5uCt41qLNmgBy0MBAqKvMtlCTTQ45MXfBeqG/YZdtJfdlweD4B2SyD0AYCmjOA5IRykH
         50slXSaU+3/dvH02HpT/3Uj2sr+ldg6mlL0N63MShMkNBOKlCETj9N5ETmn4xjClx3oO
         yGIg==
X-Forwarded-Encrypted: i=1; AJvYcCV9cunlyjISu4dEdE83xBJcc3q8TGawAxcbBGYEe7QdfjlCNaGARrGO/FY/yGx0gS6SrasAOC+EPaLz@vger.kernel.org, AJvYcCW4THwJg4uZiDumKP6TKmWqd7ZWl8HTNtMMiWFfeVxkN4KcE736xt8uMZkdd4CX+VXo87qDQXEnlKOr@vger.kernel.org, AJvYcCXe4VmpsGsRGwtlcqIZyasCBaQYe3IvZJr5TCqe0MVnToYSX7y244juNl2F4UnjeTpUTBeijrd9XUYxN1VM@vger.kernel.org
X-Gm-Message-State: AOJu0YzMRruWbAnChsMruCNsCDI5N9jqUjaaeWRaqxuOfxQ2ADu6D2Gp
	SDDXjCg+4bcThfC7MXLP9phzNjeR2TQQsU3kxl2832iubKvwtxyG
X-Gm-Gg: ASbGnctERdtGdXPmyw0FbduPLflyKIsuX4HTCIxqsPW5vG0sl63CVAOBY3iYO7ieLRh
	u9gZIjz1Zv8XHFoY6/WL20RnCCxJHhZciGe7jEGi8475cZDlK9CpzQ3dfSaBZNGY3LtrumXu8JR
	kpA4wHFurjonYen7LwQ5KfzsMDvTyi1iBBmx57Zi7Ius/mny/9EZPBF5TuZSe+vi2zjIBqXjlt9
	n3Jxh0WetpVY1f2sVCmv5J/buzWzzvHLty19ULvlp++kQXSKS4E2qTQT73HVWSwVjxoLTTltjwt
	ILFE7WL+Yi+kn6YjtvC7kdX20XO2
X-Google-Smtp-Source: AGHT+IGOn8DDBRvJaqYmjHkVKOo2YGgRckoyLCbOPcvQyE/WHG4r5RQgaVBafk+cqrlqSRAtImzL2Q==
X-Received: by 2002:a17:90b:17c3:b0:2fe:6942:3710 with SMTP id 98e67ed59e1d1-2ff7ce59681mr4835480a91.3.1741353403442;
        Fri, 07 Mar 2025 05:16:43 -0800 (PST)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693f7cebsm2984589a91.45.2025.03.07.05.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:16:43 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Fri, 07 Mar 2025 21:13:46 +0800
Subject: [PATCH v6 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-k1-i2c-master-v6-1-34f17d2dae1c@gmail.com>
References: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
In-Reply-To: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741353244; l=2076;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Gc270i/DQwjrh9iRRxvjY11dqiqcfQ99KjBuKm1O9Sc=;
 b=uHKb/n5KV0CgdPyA2JMTLZC0UbC95R96oPXM6/QfwaU6OD4o25nhIjtQFExpRt0uPI+m7mVOi
 JNP0g1UOrxkCMLczzmrt8b1hgMxVQflzUKmt59MiHLLTi8unxpBBpEk
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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


