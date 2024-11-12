Return-Path: <linux-i2c+bounces-7935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D189C4D0D
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 04:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC0621F217AD
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 03:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFACC207A28;
	Tue, 12 Nov 2024 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eklffd2a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F52119DF62;
	Tue, 12 Nov 2024 03:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731380953; cv=none; b=WlHr/WZ4v6ZdzYqbCd6c4BhR1FJG5Yt8OXCDZlTF98c4Hy32261nTj+NbKXKNtAxb5C/P+LX7UVxX2c7ibe+adM26slwwQQ93+MtQ48OWy5qqmFHj4DF9vC7vZwCQK/PAzC8ZKgEpd7/kK4hYDqFuYsbYG9lmO8VadEWq64Xl6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731380953; c=relaxed/simple;
	bh=nsVqUonf54o4xofk6dxMKSvNVjYbHvPlGYhH5SAhdKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZG4I8G/wbDYCCeWbRy4x7d4B3onx9JlW3ZRRAHY008WprE2G/N/RJdolTv+xtidEOwcACrxZ7OPzHvI/N36XKHuOdYFlNZRGdnehl4LiiESmUZTaMYC208gJvm1fq/8aG+NIDVZqoDTEhHFpkN1c/EFCPvViYxGvtBgy9mlcQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eklffd2a; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-720d5ada03cso5241079b3a.1;
        Mon, 11 Nov 2024 19:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731380951; x=1731985751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teIMfE7F8k76UXttPluaXL0JVOEyX6VLC8jFeSsriJQ=;
        b=eklffd2aCvaudwzNjhbSJUpiQuWSNJrEwZ9ikcPKWe6m+1oJhX0y7gd3rjgrLyOdQr
         HdoGqLKQeFiCq11JsniT0tq9x4Qwl2Ttc4JXU/7nOyR6jvopCsaF4X5YmPHX+f64bWpZ
         FXvCmSH7CJcAulFzHSzzfV27ntPa8tXHrp1UlafM1fldy0zkmGv+A8zAp9Wa2OOPjF50
         JVyv4GzBptMxMfyjJBJtZroxHzdFEXA25bIEuJGht5feWyKTA2TnT7Yxq3qzxR3fGmea
         qwQ0ZNnbErfQL5OHoQqTjKryH1qLC4RrzdYXPh95ha6gZuDaQVRZQrT/F0d7wWbw4eu3
         Drog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731380951; x=1731985751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teIMfE7F8k76UXttPluaXL0JVOEyX6VLC8jFeSsriJQ=;
        b=t+ryokyIDUcB5ujlF3YTybs3uOAqIsh/fe8Bkd+EK3By9klhOOppiC9iz7ufzaSF7y
         LUf7ZwMeOAFp6mSY+ZMZBlCg9HCspp87qinD5P6RuSbj8AIHlUNwfhfimK25C1K9+3df
         3GqTSuHGyHj3Bz8HUX/MaZi1/D6LWv1X0DuzxhF+4GHsg4CvfbxnXqX5TidJ4Zlg0l1S
         OTyJikjbd9Ne8KjfI0dDGNO0ETLxlgGDMY0HCQ7JzqGuZhD0zJJNVm2K7AlQuEoG44sh
         +jZ0KnL9ZIauQxsA3KCci4VzAps1v+awXw1XuGk2RhDb6mwpN+EY4LxlhHYWx7I+ggav
         2plg==
X-Forwarded-Encrypted: i=1; AJvYcCV2UanuXQwi1nLcOJvhuPKfvqC5MSpepByQn9csaRZFAH2OcwNz7pPJkmlQYsdNG3DTFqMnuyRLn9nR@vger.kernel.org, AJvYcCW3cL9On4cgmx8FqC8hb8NLRp1AfxdPMHTIAiOuuecd7rfzhD4Uvs8mvR+rqZ56RpGzvUiJxOfNUO2f@vger.kernel.org, AJvYcCWMaZzNuCrk9rSOHgi7mA+TNcVEZbNxBvkv3lGYsnlVqz95PBFhFVvFtAb36qMcyi4HnvUrholKlIpJhrVS@vger.kernel.org
X-Gm-Message-State: AOJu0YxeKYmxsmCbiObxXfWPRq6N70Qd/YgFOLgCl3HomML6vGUpYFP9
	IOcIHe9XpFkXJn8BYxAZXJStp7jsy/cjZdr+zxRiFznNk0MPlZwo
X-Google-Smtp-Source: AGHT+IGh437lETvXJiDMcfleA8zJ1r+cu0YN+Jk1elR9u+DnqP5mY42588SgR1t41x9A6cwmCmh9KQ==
X-Received: by 2002:a05:6a00:234b:b0:71e:4fe4:354d with SMTP id d2e1a72fcca58-724133510cbmr21071538b3a.18.1731380951155;
        Mon, 11 Nov 2024 19:09:11 -0800 (PST)
Received: from [127.0.1.1] ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a3a9csm9873447b3a.110.2024.11.11.19.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 19:09:10 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Date: Tue, 12 Nov 2024 11:07:39 +0800
Subject: [PATCH v3 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
In-Reply-To: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731380939; l=1669;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=0TSA8J0dv++gwSGf4gyY25LsOYWNi3V+nwVFt1LG5fk=;
 b=YzEU1We52rRN2kGTzJ1lmFndHmt8GOvgFfdwPQsiMnpgmLvsomIH8q/ofhcLMZjk2GuTB1je/
 QTmH2swAHfIC335BmJe/w8l0mp+JiGBsEsv4igsDJzLk4I8bevzN56C
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

From: Troy Mitchell <troymitchell988@gmail.com>

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 000000000000..e8cce360bf03
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,52 @@
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
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz.
+      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
+    default: 100000
+    minimum: 1
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
+        clocks = <&ccu 90>;
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1


