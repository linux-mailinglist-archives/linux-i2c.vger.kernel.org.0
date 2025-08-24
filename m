Return-Path: <linux-i2c+bounces-12403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8330CB32F90
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0930C7B0C52
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7749D2DE6FB;
	Sun, 24 Aug 2025 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYPpcCWZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2952DAFB1;
	Sun, 24 Aug 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035282; cv=none; b=U9+S12cIhgTO4bBSLeAQVKCVP8HBzi4oxN3bRAW16QruFizmmLpONyk30lY+FiRQgliqeoKuxfUxEZ4BDwxNJZppYWCBPlBLMGbR+Is0yuL1bqiHWofyb/R9WKZBxYAelNLYOJDZr2J3w6HyZ5OcvbwtqwSi5N1W5P5/KX6EU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035282; c=relaxed/simple;
	bh=C8jprGhvwgNFwqx9JXIf4GUQj2+9HFsGRgb2FpChXxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EvrgWGeqJEtdghWQ1yM04QV7otqepNb1y2BWN4Mqj3iZCjHuhw7VY+m//MxPhjTU2xUNayi/NJ8H0WDD9xdNDJmdbayJFyHg+MgK2aiW8Ntu26suePP92gzjO7Qg6nUzF2wwx2GtXnEvugGtTVtp7kdLJtCZ4GT2lR3/cqFCvBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYPpcCWZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3c68ac7e238so878990f8f.1;
        Sun, 24 Aug 2025 04:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035278; x=1756640078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeZs0XJJdh2SbqJW5bpVt1AZYdGyUD1UAVS4r4zgBDM=;
        b=KYPpcCWZVQB6hlqqFY+fFXQ3AMmDoXlzan7Kw5vuMhgbsO7k5sXmmhl74lScKrODCJ
         QnTTpRwxCIa/eFGUorbTiM7kA9I8fqeTJD90jQwWxOc3K/38fq29PLxSLWEe80Kd3mOK
         xZwyC68+/+xfKSYrF+qJ29+us6hW62FCX41jbpHeGBWjJKclV/wUnIWHkOkzaVXXhL8P
         iorVv7TVz7fFKv+Xa22TTt3KQa9WRkWGUSp0yDKtZ1IfggRTVeurDu/SkikZb2LbQakT
         Ob6WJn0pmk22mUbpA2rLLj1z5O2pkfdTh0keO6be4tUS6Fi9uPVJ2sUDUmaiESKeQnkF
         J79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035278; x=1756640078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeZs0XJJdh2SbqJW5bpVt1AZYdGyUD1UAVS4r4zgBDM=;
        b=SIImXPdx2QiK6qyi/4ibW9UJ0/hpRPtS1B2oyAUQHRZTOxIFgfqSmCKtz5I7M/HavJ
         4tvSSaHkPy4kXxVE6pDAoJsmErEgHN3hKDwXwV3QTCIOOudRdOE2DqX/8xn+WvMDKPf5
         MyKpLHSLxUL+yy2MXWXgFXwO8IZ8gT/S8HnbR13lL/6hbNq+HaKNvXgShjxYGTWlfZqt
         TFtJd25buRKzY2dxJ2e00GRPkUgPjaTSx//p5IJAS4IT7AhiMoIvCtNMRX8l+4k80Mj6
         WdO7rhsWQTNGKdxY99NMJlhe3TCmB8nAAN2CPJtObQ/aqMrNv05ckdgb8AZmxMMQis6D
         ghSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT0JZeqVJ6I8WaoCKxMZTLxHMzYE2zE5Jnj+Q8UBXHqoKT/KAigXwGhmSU0rsbtIFe+wLXUCJcrzLBrLGW@vger.kernel.org, AJvYcCXWMl5pfJX5owQyba2VnkWzjxJ7eU3ZmQSDD+BoMLq9//1grE9arQjbZzf72ffScHsuimM3LWBkpQcV@vger.kernel.org
X-Gm-Message-State: AOJu0YzV3DDlrb6NfZsufiwzaOoZSWjuyaWf2ACpTz1bBpO7G9WhnxSg
	VA5Ls5NKMuXo3XKA1qfcDAjo9qmSIQ2QgRB2CQZtQmwiRWcUByDMfk9F
X-Gm-Gg: ASbGnctGXbZcY6zfOqH2X2njEZ5wzN6NJAD4CugD6r20e9qFbm13KJta2T4WtPRbWN7
	XVEETPjtRQoIEoVspCq0+xKSvi5KgDS4MrXtfWPVLg2z1vpy1tP7/MBGyBXJW44ZObNa57aPaQD
	0RIsnk0/Gi0XjPNoznR6ymeGfvf89W27blA/+gEGCrA81yjSojNehWlepWJFFDtqrINQq1CYF2G
	85nCwg2/58iwG4IMk/2ZW4K5r8cMCrKdrkfe2/T+YvWcyNq67bTuRgPtE/DtkgDyQHADK0R65mM
	3XTIMKZ6D4Fejtd8pohD8+5G7JuO+x6hLSPtfWfMa6z/q50H0Zg/zRAp9/pQI4ECpiIPCUHW+HM
	B0GlMoQiJLqTiCC/MaRCGBsxeJ1qjNfVuuRwsSKIan9daCEcW0KebWas=
X-Google-Smtp-Source: AGHT+IFaNZBlLfDzFG6fpMxFZLJa6/ZW1p2M73HbTSPFER9nKnVrqHAhuR0HjpOvPDiVLUZv8W2G9A==
X-Received: by 2002:a05:600c:3b18:b0:459:db5a:b0b9 with SMTP id 5b1f17b1804b1-45b517cfb8cmr67775305e9.28.1756035278454;
        Sun, 24 Aug 2025 04:34:38 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:38 -0700 (PDT)
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
Subject: [PATCH v6 11/12] dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
Date: Sun, 24 Aug 2025 11:33:47 +0000
Message-ID: <20250824113348.263475-12-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
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


