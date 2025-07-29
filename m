Return-Path: <linux-i2c+bounces-12060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45040B1496C
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 09:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66A5A18A0A7B
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 07:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ED226B942;
	Tue, 29 Jul 2025 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAupmg2J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A925BEE7;
	Tue, 29 Jul 2025 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753775530; cv=none; b=SXMk58yJzLuMBBovJVRZ+HLpNbyiDove0NL4CfW1RS0Sm5SHv4MznVuFB5fA7oPMmVPIMNMrbFzH3TMux0OTIjwjopukS0sB4AN0QoTT91fKH2DXZY0mLFGNnfZjPIv9Nu1u23BXPXihBjI/emxjAtchCaq9gKGeDkvt6aAd25s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753775530; c=relaxed/simple;
	bh=BFNEgLr3Jyqkf24mL5NUsA07bK1jC80BfK15YYxEdLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e97vlr8Bo/QwiyzYyuVUvkSZbleKy+xqR0pj77/cexplMsysQ6mFqrIK0tZdJAlY8WoGJZlsYXF6HWdmzfEUonhksRMMcXBsPxDyKn344MkMeqE37e8JTuUh5OUIN3rC+4B9+KnB/+0K7hmvhgLw7nK7cpjtFjGx96sh0rnatYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAupmg2J; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so50352865e9.0;
        Tue, 29 Jul 2025 00:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753775526; x=1754380326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmoDdKBnSQ6ajSkfEeQ0+GG+YU90Y5b34iZYojz+YV4=;
        b=eAupmg2JVjAi48CHdTUjKkRjhVUxYz7kG8vDNvT18kseSwmOqrTyMzVwVyGOuNMrJH
         UqXhhxijC96+ZqXfAPEj4qQRdNUfxvHCXhu1TSXZiE6RL48IJYOAjHQgWmOAYTSDUI/r
         fXitQOqmPEq7YPuko9xVNYZBdOCfiiTgwJyjqJ504ydINuaf3b6Yv3HVdetON3/qiXLF
         jRzFM7F78RPWYvo13EJqsRKrXR8nkbXgL/YoTsA25VQqUGJdQ9Q9Z6pZI0kiPLWsspgq
         gUBnPY46cnt+Y1/7RitRiQ7SPQkbktrtn6jHymgfVcnCOQm5BafA4YRg56G/ZnduUQ4a
         Eheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753775526; x=1754380326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmoDdKBnSQ6ajSkfEeQ0+GG+YU90Y5b34iZYojz+YV4=;
        b=w7TJ4nHWPq93qt2rm6eM0S0S6e1+baQMNmaMgv3uJ2Qo9O9E8ChuLGvXsBqwKjOfKB
         rcnnavhxV84bSkP7I0KHzrKBhicI/5U4Mf/qic0sW7M/Hn2/XYrVjiBIj6crSPyjNrES
         qYzUvU5pvZdRJFkQLhxD9JMG/ua7jT9y6TYI2q+7cLrvGEEpeLfnQAkT+16SSCklR/lw
         zCkYOO5SAQYi+6R4dVnZff3fJO1giV597IvbKey+WTZKk4iHDxvr+KVuMcRHLuRYjUBR
         b5xndIGsuSvQf7LJ0STywER091iuYNjFvRBrdFHdC7Jt5TlldacgfZ4YhfxSH2iIL7fF
         639w==
X-Forwarded-Encrypted: i=1; AJvYcCUzsJeb5CYVO32/BBPLXQlDhCCbnAYygw0xp/S89CMjhXpaVl+PqAwXZ3M+jRLjmr4oCU48CgW/qHv06iFs@vger.kernel.org, AJvYcCV75TqRpbmeInRYo8MpztShwwtnmR8/0O0M+OA2tEumdcWbPgtBTRt7xkrMt8DITDBuAwa5XG/c3NE1@vger.kernel.org
X-Gm-Message-State: AOJu0YwCsmKlBykrxUxqRl/zWDDv0Bea7Zo6mCkhKiouDXoMzyi8lObh
	tGt6thxeUlivvppidcyXrTKmRFCYB3GT2E08SnHZyplWUzQyykOOJeuo5xiEyQ==
X-Gm-Gg: ASbGncu/cCofTrkhUL62KxbbBVu4z/XtrGosEaLhSycioUTYDD9AdDjgfo6+O/iOPy6
	Las5yNUD3K8NTHkJvQuWmOms/eNCSaorUaKeTZ3rdKaZFulFG/XMw3EPKOyw4OFZ1JGxcGu6qGD
	H6DW14HX0uSmkSU1mJpN34Q1KjJubrkmeb2xxg0g2UnENtSPhRJ2qtBHPV7c7Tws+7zhKms5jnB
	kIXVgmQU4UQnBYCbKzus0rGSab4xWIi862xcl87G31RPDJwP0qdAAOfXElt2sPzzp8oVsABZO+L
	ZUDMejgOT34CMl0CirJMQgONus+UGNFtOQ3Qnr1Yl++VPf0U6HWYgZ7AjvkWkxiMYS0nSTiYoOm
	om5GeWgii8uaK7/LQDcM0Rht5GIbVrFFQDCZMJohape9cxOXcXA==
X-Google-Smtp-Source: AGHT+IE8yB5PNAcZMXAqDKGxQDq2MQlXh7T76QvTkuM5jV9Osr/s3QzyXL97/N7G/ygGRH6jVjRxfg==
X-Received: by 2002:a05:600c:530f:b0:454:ab1a:8c39 with SMTP id 5b1f17b1804b1-4587c490fe5mr86897255e9.26.1753775526445;
        Tue, 29 Jul 2025 00:52:06 -0700 (PDT)
Received: from builder.. (53-8-142-46.pool.kielnet.net. [46.142.8.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f047afsm11046706f8f.39.2025.07.29.00.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 00:52:06 -0700 (PDT)
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
Subject: [PATCH v4 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
Date: Tue, 29 Jul 2025 07:51:44 +0000
Message-ID: <20250729075145.2972-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250729075145.2972-1-jelonek.jonas@gmail.com>
References: <20250729075145.2972-1-jelonek.jonas@gmail.com>
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


