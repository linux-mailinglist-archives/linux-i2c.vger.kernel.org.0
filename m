Return-Path: <linux-i2c+bounces-9905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D56A6883A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 10:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BAEC3BF313
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 09:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A237259CA9;
	Wed, 19 Mar 2025 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUKi0MVW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B188254AFC;
	Wed, 19 Mar 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376728; cv=none; b=tPkqWltkYLzZhUEX1cQILusYe8zEyAezhcrZ3uJuyFKq4Zvh4vqkDf43w8NP1PeqBeL+ggajtlN8J+wTbbFtXGDqE1+tO9LEHe2eu0rbdR/Ssc+p87ycdxgLABOf64KyttXSkWJvDgAf34uDiahULUkhQ+vt9tu6cd/v+PBruDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376728; c=relaxed/simple;
	bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFEQoRVYWZPmj5WadxsuqHBlypc0W0jRMpKZ8iIZJT8i9qenQE5XlqborCnbt40Suc7R43v+8DXAVpe/I4bcvvquSjG3xOLOko7Lsu+VUerjErpYqT9EvnO5vC0x4JxCUQq5W1BsMtakBtkJM19kzGqsi5F2QvuYaQl7YYyKaYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUKi0MVW; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-22398e09e39so141698725ad.3;
        Wed, 19 Mar 2025 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742376726; x=1742981526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=iUKi0MVW5V/L80MobTTOrxZ8CDbPq80dirk42u6HZLu4uRPPAh7LJOkzkQeh9x7W+H
         6jD/nuyNjHlOf1jrBv969iTilQ91pX3JQlEXEuZP3qeRrM+HbTaDrtDmcrXaJ3zd+qk6
         W/1EunIM+k5omXAibVpdiEJ95aAbNLMZDF7+SQzQgk5najYdHNyKJlOe1ndF/xCMG7pM
         cixT3XgZ8Nmyqrl/XLRZqCoCZJQDwAAAlQHcpm2QA3xDsvAIJbGqPzfordbH7QMdOlSO
         1P/CvsBOPWlTxVhJJhGDg/OU3zDdND6mr6N2Hbu6ZVMjrNNpOKU1ZizTZssklqGaeZhr
         a8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742376726; x=1742981526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=Vw5t78fSGTjZpm4Jl5+dAp241btYwfg3lJLLF3e1AYJVysPkBre3If07MM39JYkVb5
         6mSKBUZXSegc/hhzTAQ64K+k1xGy0xiAe/pIZStZNNqqja5ZEGB5DmUTTJz8efWViqwa
         eWzGwe8xQ5uoxUx/5S9ZtgSxHiVnWkOYLJGO3Zqv6q6kqYPmw51+mAjHuv5CntaQ4T/v
         3eKg8zAmyO/ATcpH8luMjwL850yeLzr/pveOG/ZTiJxsIdEBib38/Xf8OrCH1BIscSrn
         Q6KSHMwPM9hxEGsHdh6XjfE7Wpjx4/X/ZSXhJHtU26ts6G0TfdoEoRG7UxfBJk+v2jqr
         OiyA==
X-Forwarded-Encrypted: i=1; AJvYcCUOqIS8v2IjjoTz/QTnuEo/S4G3j9i4woHmvyhH+EgBXjMeoS2cRSFn3EOdC5szHzjH+Qyv8f6lDZcTROih@vger.kernel.org, AJvYcCX5E1bqnhbZv+nif0g8x05Z+iQTk8xptfidxlT25rwrzr6jmGh3abcJlYaEC3obyqyfKyQhaD/F25T8@vger.kernel.org, AJvYcCXzeLXYBd173ZdgUig1UJj3qQaXSMy0Z0BgIxNojWMktd795GKBMiRtyFW4qzMgwfWMojhsCI/DLKrr@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnrInz/Z+q0q7Dr6Vb3xHW5cbCmv6btBCox9IYx/ZAu/EcE+1
	x68kj24EUWwQMNj5tvTo4A24Orbm9QV4lqO4h1WxTSi6IW5w75ca
X-Gm-Gg: ASbGncu4bJSsDRlLAjfupQ4zc5cOHEQ1mgaJQpYyrvjRUFKkQS1CmFPjJ7X2rDoSmPu
	B+lzmawobcZgk4X4VaaTIyYU97JlkIvfqa4nqcSHwnoWvV/S/sSclLkTQq5PGtPq+F1YK0gT2wh
	GTf4dS7E3L8eGTwI0fQG9GkOyGOEu7BvdBUEk6HZoLxbhhq6Z+kWaSJqeyCycCprqRgrT6+eTrR
	jTzLiuwWPwGpCuBhIotD//WQecC4w6lssVuwUpcAy8PecgX/vNfRp0rDRZRuaX1Cmj5SZBGOAAR
	51kUjsk2VJ20bx7F/MyMKjFsa71X
X-Google-Smtp-Source: AGHT+IEJ7BbacbEjBca1zxi+l+r4IWpLrgxPdjplfun8EpRskeUbZl5L1DXxfpSILrv8YPi3IzkmNQ==
X-Received: by 2002:a05:6a00:1950:b0:736:4d44:8b77 with SMTP id d2e1a72fcca58-7376d602e89mr4285875b3a.8.1742376726411;
        Wed, 19 Mar 2025 02:32:06 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115294b3sm11124315b3a.5.2025.03.19.02.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:32:05 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Wed, 19 Mar 2025 17:28:59 +0800
Subject: [PATCH v8 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-k1-i2c-master-v8-1-013e2df2b78d@gmail.com>
References: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
In-Reply-To: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742376553; l=2169;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
 b=ZFqrmrmY/RWmGj7gLZCWgUTyAZDH/C6mwYsfTc7zti10F5HuSECxeuGJzGC70nnaguSUYNzC1
 XRwzIOgU+UbBQzELodEkO37GCtbQMP9WNVPJcdR59lFVF2Ap5222r23
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


