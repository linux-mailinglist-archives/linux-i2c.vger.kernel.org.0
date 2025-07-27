Return-Path: <linux-i2c+bounces-12047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE4FB12F60
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jul 2025 13:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7E33BABDA
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jul 2025 11:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDFD21517C;
	Sun, 27 Jul 2025 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fcb+7ccP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DFD191F91;
	Sun, 27 Jul 2025 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753616890; cv=none; b=upgAapV4bl6d8ktMvTyKsY4XmMipD6DgWmRgOZVd8IOG7hdyTNCK/f/ndRbkJp6Irk7OXmkOb99jZiVIuIpTDdgiSsZkJaxclGlTF53npAD15P6FWVak/6OoqnznNBcUwLQvgQcjsnbfi2YTfyfTLOx9bOsePGfuN9PdqXDexNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753616890; c=relaxed/simple;
	bh=BFNEgLr3Jyqkf24mL5NUsA07bK1jC80BfK15YYxEdLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kcb9XGoyN/ph5ZEl9foje4uA/lxWcPT8eTK9pSyPhr05sL1ejBHlqsmK5VboSX8HoEA6U0Oqukky0ZRnntLCtoyB4w4yxLA19Te0Dqe1IROHtUJUcp+KxB98luXcj1VhcUU7Up1/OyJHwQ4KEAZFC9w3Dkkr0ARuZqqwbRNG83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fcb+7ccP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so29115995e9.3;
        Sun, 27 Jul 2025 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753616887; x=1754221687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmoDdKBnSQ6ajSkfEeQ0+GG+YU90Y5b34iZYojz+YV4=;
        b=Fcb+7ccPEg1CH4oLodPADNET+YtWSu2DlH/egSdAH574da02z2DhV8A3i0SHThxrhz
         ACu+oVVH9MljXef3LWYiNYVRLo1mb0JJU+Ib2wsRjZFKMjU79w/cL1Zrzgx10JYdT5CK
         ekD/R4TYHo6DC+XApTpyiALLdGk6gH0Lkt2lrff6ZKdWJfkg8eP1g96g1BFXyKnnqZqf
         StGeNUrJwCjqB38n+yZjPmj7r1GMGr+LbJMUd1ZIKUtXEZQb0yQn0fkLtY7pHcthScAd
         Oa06XeDyMPrQzMx8jKBNLLHhwojOFKjonKAfZgowzDKiIbg8ycANFZQ6VsnWGEELTUa5
         +Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753616887; x=1754221687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmoDdKBnSQ6ajSkfEeQ0+GG+YU90Y5b34iZYojz+YV4=;
        b=edV9kfXw/mQsCK5czU2wN9V8dmno6uRDOoNK8t7xA0tYM5DfG5LeqTyXpQXSe9Fbdc
         En17DfhyPQeyfvsAm1nUKa715h2RMGj0VvR8HwlIcSCy5F9Jj/njQU8+7CcVtkgEzV6A
         YRrZzDzmtwmCe/rLnCAexdpb+h5t7UtRGXv34Q2HLgU9TZL7RBKXVaDpviiLuuE8GkM7
         dWv2sP58npmvqyP9Hcs5sNG1XfXKUqDoW6gHJR9rf8jAZ62LrPf05nZ9eHqEKfzWthQ7
         lZPfSJD2ZSCiH5+SMRgEJP40CE75xWHiHqQdMnEhjvIZJAqtgGKfFiyN0tnWkqo6CTto
         Wp9g==
X-Forwarded-Encrypted: i=1; AJvYcCXlp0J/3yCQjxAzHULNzjilFDj1oFCjsg9Ao1r4DjA9Uek2hQbAK1LUeElRKLHDmYMYsMe10hrA9/bg0bGk@vger.kernel.org, AJvYcCXr4XLeedBRFY99LdFTlbaH9yUsO2wLeSTQfpMAFQ3dYOzAo/dGJ8dDWm3MLzuyhXPEg+z4UlTAQbc0@vger.kernel.org
X-Gm-Message-State: AOJu0YyX+TZMvMhE9gmA2PinZsTmnpsROgpGjKl3892EgQtdVGMR0Me+
	QyMCsW+bgnN7IU9baFfjf2w25kdZfm6aSkF1q0q0CwSxX7wrkiqqBh7cNdPy8Q==
X-Gm-Gg: ASbGncuIcrUycGl0wn0RSdtabOmt3IvW7Lmo+2dpVfa+77/ZglfqFKgDOapqiEPEpD9
	BXWDwz5eT9ANshshCht+3sTGOUDex36ILQJxt3dKxB6CgytkHTR1uXe9F9A2tnXnEYMhrxVND15
	XEx57eAz+D03LknWzVLJcU1TbP2DKbz6ibpy8iewnsAFySKEN00olze1YkkFuiYGhBGXCeIIM9e
	Jx4OpRwG29BrJ7a3trmhAKUysl326J5d103T2wE73N4dzVvASEnIhE53GpQZUg1NxEWZ+15VryB
	g2cOqELjaQ3TQFW0MDCjIHZx8j8cSYkxBbhwgBqoavXkut4Ewv283xOk4KCGcEbj5YRQ6olV3wV
	6WTcI94xXPwB8A2a4B1ckZajHfbdBMteq21P8Y9cOXvCAgwmT1QMwqO2SgArjbanOxA==
X-Google-Smtp-Source: AGHT+IHj/pEEk9asrs5KxOKjhwzIbsMo/LICagsLbBTOrUfv0QNHMwQdWGFoDPyzS1bChzggXe6faA==
X-Received: by 2002:a05:6000:400e:b0:3a6:d95c:5e8 with SMTP id ffacd0b85a97d-3b776641178mr5903207f8f.35.1753616886563;
        Sun, 27 Jul 2025 04:48:06 -0700 (PDT)
Received: from builder.. (190-11-142-46.pool.kielnet.net. [46.142.11.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb284fsm5621555f8f.12.2025.07.27.04.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 04:48:06 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: linux-i2c@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
Date: Sun, 27 Jul 2025 11:47:59 +0000
Message-ID: <20250727114800.3046-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250727114800.3046-1-jelonek.jonas@gmail.com>
References: <20250727114800.3046-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for RTL9310 series I2C controller.

Adjust the regex for child-node address to account for the fact that
RTL9310 supports 12 instead of only 8 SDA lines. Also, narrow this per
variant.

Add a vendor-specific property to explicitly specify the
Realtek-internal ID of the defined I2C controller/master. This is
required, in particular for RTL9310, to describe the correct I2C
master. Require this property for RTL9310.

Add compatibles for known SoC variants RTL9311, RTL9312 and RTL9313.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 58 +++++++++++++++++--
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
index 69ac5db8b914..29676e99a8c3 100644
--- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
@@ -10,9 +10,11 @@ maintainers:
   - Chris Packham <chris.packham@alliedtelesis.co.nz>
 
 description:
-  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
-  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
-  assigned to either I2C controller.
+  The RTL9300 SoCs have two I2C controllers. Each of these has an SCL line
+  (which if not-used for SCL can be a GPIO). There are 8 common SDA lines
+  that can be assigned to either I2C controller.
+  The RTL9310 SoCs have equal capabilities but support 12 common SDA lines
+  which can be assigned to either I2C controller.
 
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
@@ -35,8 +45,15 @@ properties:
   "#size-cells":
     const: 0
 
+  realtek,mst-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Realtek-internal ID of the I2C controller/master.
+    minimum: 1
+    maximum: 2
+
 patternProperties:
-  '^i2c@[0-7]$':
+  '^i2c@([0-9]|1[0-1])$':
     $ref: /schemas/i2c/i2c-controller.yaml
     unevaluatedProperties: false
 
@@ -48,6 +65,25 @@ patternProperties:
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
+        - realtek,mst-id
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: realtek,rtl9301-i2c
+    then:
+      patternProperties:
+        '^i2c@([8-9]|1[0-1])$': false
+
 required:
   - compatible
   - reg
@@ -68,3 +104,15 @@ examples:
         #size-cells = <0>;
       };
     };
+  - |
+    i2c@100c {
+      compatible = "realtek,rtl9310-i2c";
+      reg = <0x100c 0x18>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      realtek,mst-id = <1>;
+
+      i2c@0 {
+        reg = <0>;
+      };
+    };
-- 
2.48.1


