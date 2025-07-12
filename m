Return-Path: <linux-i2c+bounces-11920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 073ADB02CAC
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 21:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FF7B3BEFF4
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 19:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA4928EA62;
	Sat, 12 Jul 2025 19:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So2XQMq+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296CC28AAFB;
	Sat, 12 Jul 2025 19:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752349405; cv=none; b=U2w62sHJ4538xnBUmwZlbzyu8NnbFbB/4EmkPo221G2e6fDwUonKxhNDCqyTNOiWieXs3V7fAbqrs5P0rc9dyCPR+oy1gzFSy5CepcTzme+bWWE+aA0RLoDd/T5q176PEFrAdDKY4S1TVGW5ahPuOIHOcyQrjuZiP7uanzihfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752349405; c=relaxed/simple;
	bh=DOAhmjsOlvN9MwQfbMO8GopRxJHyZJzc+VBE0n8W1YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXRHjJWcWKGpXh9u56xwJEfh3KB7aEFgCKOagSY/yxZJ0jrF6R0ivv27uglxx3ywpOPn4fOkJLM4aeTLZyy88IefACSPPehoMb7PbfYJpSaQ1943LmwYiIPaeVGB+LR2aJMO9WMrtn24u9XA4iiJNgDyMlWZMmz5EgLoEK1++Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=So2XQMq+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-455b00339c8so11250655e9.3;
        Sat, 12 Jul 2025 12:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752349402; x=1752954202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JPPcxp7NaWkh5iaP2zm8RZQZs3fI/IYSYHIoSMY0FI=;
        b=So2XQMq+p4H++7hZvNWvKe5yrmb1TurM0wxq4K9Va4IfhAi0ipcIiP2Y43dh89D2IT
         /qlzIl01+fmDZs+Hj9VjwpdX5BDEdj7Bb5iVI1l326OdvcgDYi+/ozhoq50GQrTGh+9G
         EkSxKUBhvqNZJgJhjFmeGQ0fSjc/ydNWe3MVCQQZSIx/VBIw2BemDt2KlJEvFfB6wYZc
         1XLpPFEWoOQ/DvhcPU7WPCG9tB9qkuhsdXSto4hDRP3+BAjAxjcnn3Nr+1zA40xSMJT3
         izDFte2MM0PsJg3WjJhdpNHthePdfBzBs/9kjV6QpC42ohIQXoisbHzqf4KbjfzxQZAb
         HgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752349402; x=1752954202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JPPcxp7NaWkh5iaP2zm8RZQZs3fI/IYSYHIoSMY0FI=;
        b=btyl5Bmr7zdr3CW3POx3v2ARz5MKb+siOM9leiNjZjnO40NuJRAdbs4YE5HuLjlZY1
         3Kib746cbK53i52X4dCR9cw9T0jz07ci9wtrrE/Pub27+e9E1BFZhzWEK2WScvH4sNH2
         nJCIr9nzzd3jVGaUtA56JVIRt8TmhIKdDoRN//Pgb2F6jXsHNbuE9kU6OO8Rbc/MQO/N
         G2QHiKmuzq7FKruefDc9p97ZnSc9SuDdXSAPv3DbckwmAwCSrVm+Ns3v89vcqMX0Bvjy
         az3SN0kqmZb4InTNHdyW6iQidjy6obMNoBrZHllKFcwMLQFilsGF3cwu81s3r825LenT
         9k4A==
X-Forwarded-Encrypted: i=1; AJvYcCXnHm4/3JwFsyot+SVsS7ufBDMei5RScijD0R0GFe8Fw0WxE2T3eibFsjNSosGspbiRMFvJjgsxNTa9PW/U@vger.kernel.org, AJvYcCXqKwgeoq3/4+BUO0iBPUhLvPY2Fh1qKPsZRSgIQaxAphOr9aXh5vtzqO+rpfFh7joAD38G8KCbnejl@vger.kernel.org
X-Gm-Message-State: AOJu0YwUZmW48XE2NqEzFRDn+/bE5MKmzomXenpRI96wdQUIzfef1ROl
	k67V9ZJw9YC7PCBjwP+lqtKArv6ar20TV8KXGecrltYlsKCq52T9rLl2HUOTIQ==
X-Gm-Gg: ASbGncuLIaFwRHWQlFCAON8w/JlFiHEJqlle6f5pvDtZcUgJTFMe6oJeBQYsFFpSjDY
	A8UkowkG2OqZHAQOVGcDKOMBpJGr9RxW77cbBd1haJd8ZFSnz5EVIHxuXbuRva6vKz1dHVvXgRr
	DVfn1Gta8rF8GTR5QgR8w0kwdbTCzwstvAoE2gPb8OGTGjEguKe8mOHWKDhp1bF48uv7ocowCTc
	WB68lAusF8EcS3E5Gjk4OOcMyEf/dH8ZjGfXgwcJaMvR6+/jjEvgzjeMlU56The138Hh+pQhpxv
	cKSn8/M7R8CILwmoZivqh4kWZHzq+IV5E6saAkX5dWIXpLOWtfUKp861rQF/LMNK/4+WiHAneOe
	DPo+o298Ji1vJi0s1YfsxX8asPfvoSxbglYAnCYx9JNDOrmkk/Xdn
X-Google-Smtp-Source: AGHT+IGg+JDBd9preoVjnNefXW/WmxWfoHLPwJ7MUwBkxBuvsQ/Koi4ItSC+RrVrZqOWADDoxnsHoA==
X-Received: by 2002:a05:600c:5387:b0:456:76c:84f2 with SMTP id 5b1f17b1804b1-456076c88c8mr32334675e9.30.1752349402024;
        Sat, 12 Jul 2025 12:43:22 -0700 (PDT)
Received: from builder.. (246-9-142-46.pool.kielnet.net. [46.142.9.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032e9esm123422335e9.3.2025.07.12.12.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:43:21 -0700 (PDT)
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
Subject: [PATCH v2 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
Date: Sat, 12 Jul 2025 19:42:54 +0000
Message-ID: <20250712194255.7022-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250712194255.7022-1-jelonek.jonas@gmail.com>
References: <20250712194255.7022-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for RTL9310 series I2C controller.

Adjust the regex for child-node address to account for the fact that
RTL9310 supports 12 instead of only 8 SDA lines.

Add a vendor-specific property to explicitly specify the
Realtek-internal ID of the defined I2C controller/master. This is
required, in particular for RTL9310, to describe the correct I2C
master.

Add compatibles for known SoC variants RTL9311, RTL9312 and RTL9313.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 37 +++++++++++++++++--
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
index 69ac5db8b914..54327ca09e14 100644
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
@@ -23,7 +25,14 @@ properties:
               - realtek,rtl9302c-i2c
               - realtek,rtl9303-i2c
           - const: realtek,rtl9301-i2c
+      - items:
+          - enum:
+              - realtek,rtl9311-i2c
+              - realtek,rtl9312-i2c
+              - realtek,rtl9313-i2c
+          - const: realtek,rtl9310-i2c
       - const: realtek,rtl9301-i2c
+      - const: realtek,rtl9310-i2c
 
   reg:
     items:
@@ -35,8 +44,16 @@ properties:
   "#size-cells":
     const: 0
 
+  realtek,mst-id:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Realtek-internal ID of the I2C controller/master. Only required
+      for RTL9310 series.
+    minimum: 1
+    maximum: 2
+
 patternProperties:
-  '^i2c@[0-7]$':
+  '^i2c@([0-9]|1[0-1])$':
     $ref: /schemas/i2c/i2c-controller.yaml
     unevaluatedProperties: false
 
@@ -68,3 +85,15 @@ examples:
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


