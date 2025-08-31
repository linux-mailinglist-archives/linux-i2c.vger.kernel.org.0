Return-Path: <linux-i2c+bounces-12530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C038B3D1F4
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3AAD170A5B
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25BE2638BA;
	Sun, 31 Aug 2025 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiIBObdt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC325C818;
	Sun, 31 Aug 2025 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634732; cv=none; b=AhRLYdg5lht7B7qLPnqJpE6KvEjJasZb2NRXAUSPyFdO+5QxP5lqp2UD+JfxLmJ561td1XMLf7w40AZYAifb+Ug20qsBkyXyPpkzlvaDewuhnIz7DeaGFkaOzqvd5XjH/n1s92K0UicaDJ3uNkjyLdP6XyCh6qM0Jcj9ODlFFSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634732; c=relaxed/simple;
	bh=gnOswjnbXmBMi405dgP0uHVoleNWn/lcXZxumvVI8g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VxJieNrDN/aSCU4iOrHKlafEe7Vya00XvUNjDGkzkRfaG0t2kdcjHUdF5htBZb6CBqlHYo3zFwI0NDbOWPZHZOqTVh3WLnNSpyq0fxm6QspF7CtHoIr7pK7h7+N+xREdDAbZVdBLYC/95786xbcoY8iSGGPZGpHxBBXL2X7OtEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiIBObdt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3cf991e8bb8so1239540f8f.2;
        Sun, 31 Aug 2025 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634729; x=1757239529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uocL+F5w2WClnJd2wZcawwJDtccp4StZfUc4QhYk9C0=;
        b=MiIBObdtWPGtA+P48QPdY8lv6vk034KA01rUjqIe3rpIUoIqWUbWhYkH/Qv6C8kxz7
         7A35oRSDp7bGM2NOuagDNDU5kP8RVpyQg0NU0twjFUEr3mBfjCJwkUilEVTbfqQmjA1z
         lDDnXIyJQpNl/nKQQcAUW1N0w7j3EinqIGXkX7ZhLhUit/kgYncc9zt7oQUG347k6e32
         EvnBuk6ZJwYUrJVHeSOwE54ERB/N/tUo4gNOQqcICKtmv9nWRxXEkag2U6ryR3h1/DHs
         bNSxjMbnwzPsTMrYk6liZpvizZHSBb1a/SSv9wUYb8QpzOk00gycm2siKq9vQrQGtUwE
         UloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634729; x=1757239529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uocL+F5w2WClnJd2wZcawwJDtccp4StZfUc4QhYk9C0=;
        b=Azy6t6yGOoLMo6hebfCtFcbn0I0X1rgYhnDK9PM3JowgZcoVVydOGvx3dN6dYw54HM
         w/oCOcViCAdR4eMMFjg6EIyO/9bHCoXpK9RDPFuSa0cJa0VtzxzbzU/afE5VsyaWQZCu
         7Ojg+TT7nu+JvX2VmyxQK18O1kV59xu8aDQ84z9tAAPTEnuQ0jzm2M5RglhKDvF3461J
         6WHNBopehNYNkUrg2Vj/DltDeJNmaWvysEIBHsu78jhZwsMGhVmnPJJQERWZ23R35H9c
         BEF1dlDQMALyRgDvELLpp56emlTFfZM0SUka98cFZT0jaa1AnyzYJg2HJU8FaU7PhZ8o
         CyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoy/TQDj5wEdggVfuNc0eLJ4OvIsf4UOyB+nTYrr7m2AaJCnAFSs0ay3yK0fBIG3OWPQ6xHenJVrcs@vger.kernel.org, AJvYcCXQzqc2Uc4rtj4bvhj31ZmwVLSoAAyqiX7Oal+KduGjB7JEbN863QpDRM1+64b6mTTAb6JhZWpaKZhem7Iy@vger.kernel.org
X-Gm-Message-State: AOJu0YyNrVPNzf/cAQhsOW1vRoinqdSxNvf3KFXBMTcWg3VwxgEHjLjm
	jhqGrd8WSQks06krQJYMpKV7Zg+VKiWV1f07hJ3V0E4GSHW9jN9kqEFR
X-Gm-Gg: ASbGncvpAJZZis2wFcsFmdhX4ulzUhHwoK3azkDr/01dIhmdrHWwMgeSq6on7Ku+IXu
	DF4I8IheSDkJe2KaAlDSp43dMDr2WntFdO0GNv+HFUyz3FHZSBqzZZCyoICnQ9boxgBvws66hUJ
	TEns0MsIl20Z1mssJL8w6QMpJs2M2uZzyayAIOsJQHeK8ZEAX0NiJIe1IYAdiBbUvuAP8wAlpFn
	VKT1bC9i7SnfG56JVveyTo+C0PdLSXphz4zNopp2RAhMT6dTT2bI1I3/a4SQ633EOaq+u92gsDr
	v4yCSfP+2GFiEB9qi4q2UhO/Vf4zxZXCGqYA9vqYGXynF6ZhjeW2l4vjrCk4AGx5FScypWDgMfW
	R3eUT8cpWYDlT7vH3Ffrsg6TP+NbG8iY9m3JWM0AO20Ht1MeKdvBwAvfOy/yVSMo=
X-Google-Smtp-Source: AGHT+IHetUik0B3udRPnKTN7h6+/KE0rVCAilRvNcqH5Mw2Tl8c/PIvkRa5PaAOMC1bYbZwCQqX7Jg==
X-Received: by 2002:a05:6000:1786:b0:3d1:4c3d:1933 with SMTP id ffacd0b85a97d-3d1dea8c5e9mr3146432f8f.43.1756634728744;
        Sun, 31 Aug 2025 03:05:28 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:28 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v7 11/12] dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
Date: Sun, 31 Aug 2025 10:04:56 +0000
Message-ID: <20250831100457.3114-12-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250831100457.3114-1-jelonek.jonas@gmail.com>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust the regex for child-node address to account for the fact that
RTL9310 supports 12 instead of only 8 SDA lines. Also, narrow this per
variant.

Add a vendor-specific property to explicitly specify the SCL line number
of the defined I2C controller/master. This is required, in particular
for RTL9310, to operate on the correct SCL for each controller. Require
this property to be specified for RTL9310.

Add compatibles for known SoC variants RTL9311, RTL9312 and RTL9313.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
index 274e2ab8b612..17ce39c19ab1 100644
--- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
@@ -13,6 +13,8 @@ description:
   RTL9300 SoCs have two I2C controllers. Each of these has an SCL line (which
   if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
   assigned to either I2C controller.
+  RTL9310 SoCs have equal capabilities but support 12 common SDA lines which
+  can be assigned to either I2C controller.
 
 properties:
   compatible:
@@ -23,7 +25,15 @@ properties:
               - realtek,rtl9302c-i2c
               - realtek,rtl9303-i2c
           - const: realtek,rtl9301-i2c
-      - const: realtek,rtl9301-i2c
+      - items:
+          - enum:
+              - realtek,rtl9311-i2c
+              - realtek,rtl9312-i2c
+              - realtek,rtl9313-i2c
+          - const: realtek,rtl9310-i2c
+      - enum:
+          - realtek,rtl9301-i2c
+          - realtek,rtl9310-i2c
 
   reg:
     items:
@@ -35,8 +45,14 @@ properties:
   "#size-cells":
     const: 0
 
+  realtek,scl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SCL line number of this I2C controller.
+    enum: [ 0, 1 ]
+
 patternProperties:
-  '^i2c@[0-7]$':
+  '^i2c@[0-9ab]$':
     $ref: /schemas/i2c/i2c-controller.yaml
     unevaluatedProperties: false
 
@@ -48,6 +64,25 @@ patternProperties:
     required:
       - reg
 
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: realtek,rtl9310-i2c
+    then:
+      required:
+        - realtek,scl
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: realtek,rtl9301-i2c
+    then:
+      patternProperties:
+        '^i2c@[89ab]$': false
+
 required:
   - compatible
   - reg
-- 
2.48.1


