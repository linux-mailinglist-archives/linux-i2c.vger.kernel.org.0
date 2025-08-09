Return-Path: <linux-i2c+bounces-12190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE0BB1F710
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2E0A17ED04
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333742C325B;
	Sat,  9 Aug 2025 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5wgPwHj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E9A2C159F;
	Sat,  9 Aug 2025 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777254; cv=none; b=l54m/i/Uz9WuS1DRksepVCSrpGsIdHcVXupjlqRDVlkrBrhGTbDe2HNWC6aeK0cKwzejRLXGJCadB44LYHfLpkRDJXon5sowtlmjYFXNDJ6Y4Ykr8j8C9361eCQe51AKYcDq3elbAx8MtAfr4Ybe1R25hX8+iIttQfd2j8v8nUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777254; c=relaxed/simple;
	bh=OiTvHe/YwVq40QflTkfW2ighoOEPUM9bFIryaTWGZpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rht3EingTamXaXGdnJ5FSI55aJhXElaJDJq6GQLEJRme/fuUBrZvuUUSz8mBf/PifLmKjdgZuSKrVCsOFMIgdYXjx+1S9DzA+Cp2tEjG2wijAcRFR4wNFddZX26Q35+z1l2kmR2ibnm+KYjutyMlAA91JnlgQtVneDlF67uEe2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5wgPwHj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so2038004f8f.3;
        Sat, 09 Aug 2025 15:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777250; x=1755382050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x01HofB2oYI2ircIKHe7vh/ImG5DHrPLvnb6TS22PdE=;
        b=V5wgPwHjKxZHvsoeT5ReCyHBKf1ulQqzP1rNl9EJ9smOSDkZEhtrM796we7Tot8Fqd
         yo0e3Ppx3hLWOt6nYMn59F/1V6Yla+hCWQfwBifeOr7ygko/JgZRBPJ9AikSW14IW1+0
         AUoTVni+17KZKuVeqCP8TjVvR0eU2a8LgvhPyBwm5YfvVq31UIqQveOLrlfetcnVrJzU
         8HtDsweQJbdbg6Frki6fw72KE5bVDSyM2Wn1ayvHgGIzCahdEzQBMYZM06iWHc3qRGNl
         NwDXkaFFTMuOk+1TIyQsTKZf/dTfqrD/EIe0BUadRvPXfexKM+z4qTr96AtvoPWCGF6w
         qDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777250; x=1755382050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x01HofB2oYI2ircIKHe7vh/ImG5DHrPLvnb6TS22PdE=;
        b=h6OAetZz14SRX8v/dCGaFYfukHJr7E+Ij1MTJlNhJ7RHikX++x1hI4UybXuiTyv64Q
         XnS7lBwamg+HPbVKoCbgQWbjk6jJ3fbmb3z0tTlII/Oz6Bd2ppRcR6PEWadgHJSKc5Y1
         DBE7nlCkNmFczVCoHPh3dORo+aXa41oFiaBHDUHA0T/EFlK4eZWmuJwjbEdqNrGXbBz4
         DHZwKJ4lzyBFInAJwY5kn+/bF1JlF5zPVrzGCv7Ap0ukfTVEYBiG3ixpoIOY1Od2ZUwu
         wCY+wwBhdoPiLpHtr0b6RewgztBuFfFNjaZ3bD6h+QROS3EypD5Ob3L9cBgjdfgkJBMn
         VwrA==
X-Forwarded-Encrypted: i=1; AJvYcCU9HU2SYwsrvOs4Tzv27QlSkVgKIPDhm8y6oQFFM+RKcYvYcy42yR8bkxBJOBwVnqld/foIvZDBGgbqNifi@vger.kernel.org, AJvYcCWFmZ5IgzXwbg2UBJkr67HboB3iSd/+aN/WJ1MWSSBXj393mF4LJqRmvl7AuO/m/MJzdknIMPYAxqNQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5DH4gz9ESFnHU5+TcDJdoOs7KKYdNbyR/n0hkWBEc3/phU85
	E5xjgoe47/pi/U/13No/aznp/XoAGh4ypfIa3RSXaS+enELHhvHmTl50
X-Gm-Gg: ASbGnctQB9Gclwfj4dyb3bzKIxlh7st45su2k44ufJmZ7h56IGQdZFw9Ga8+WetfQhW
	2mbeR0lJl6nFWgTlWxPSVGACf3siDy8Ia1VB//58sNNKutFTG/gzqH/evedBco4gpEWNm5NAAZS
	syx7jGAtw7w4rIIQlr0dpro9yhRMt8yGlW0UBmpyiOn46QRWdQM5q1rYQEjnPQQPKMuBnoQvg9G
	8fAs21tSS3dhp0Yd5k2wtYh1j8SWq6CipaBqLYSI2KyrPgwghnGknKfmsFcdt28o8W3J/Zd8/Mn
	A/Nn7jVjkzHQ+XkEqLvj2VPb6XiBsrAfzu6ERFWq3ks/Qa/gxXODr3P3pSaZdFdtk//NF1hzz3F
	sC6PvPpS48icFn/KsQUG7F3a/TvnpAFEY3YMfwW8RzomEbKsiW8gX
X-Google-Smtp-Source: AGHT+IEmXde2Gk5rzK8CHUGvozU5YhGWQ6QBDAU/8Wk/1x26jBWFGKkqYGWNUUoXj+RdGzQ7ISVKTw==
X-Received: by 2002:a05:6000:22c4:b0:3b7:93df:39d0 with SMTP id ffacd0b85a97d-3b9009402e9mr8186547f8f.15.1754777250413;
        Sat, 09 Aug 2025 15:07:30 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:30 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 10/11] dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
Date: Sat,  9 Aug 2025 22:07:11 +0000
Message-ID: <20250809220713.1038947-11-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
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

Add a vendor-specific property to explicitly specify the
Realtek-internal ID of the defined I2C controller/master. This is
required, in particular for RTL9310, to describe the correct I2C
master. Require this property for RTL9310.

Add compatibles for known SoC variants RTL9311, RTL9312 and RTL9313.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
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


