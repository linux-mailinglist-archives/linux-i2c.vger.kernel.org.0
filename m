Return-Path: <linux-i2c+bounces-11721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A6AEF304
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 11:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 549C416F8B0
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 09:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A155C267B6D;
	Tue,  1 Jul 2025 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgHl1VHl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BEE23ABB5
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361467; cv=none; b=RlYU3Q/1cYZEX5eKfor15DOx1PjmZNuuDD4lTebrNODsgjF8BALkdv+9+Oa6Y8yFUvM/QVWL9Ry4SkJyGIpwaO/OLtFK9rdZIPEe/FLad2iz66Ytj+kewGB7P5LgSrlubmrK2dt7peMEG5IswLRbVMZbg4OD+tgBsqhs0KCP2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361467; c=relaxed/simple;
	bh=UCLsrjji4xi9WBC+F3TjaHeoExqc8AyqZqhSAZufmBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1FfY71nq6VpZymAE3FRU82qThABdlEgaVXGQrDl7t4pwBuiq0WoQO0P9WyJC0ibFYLNjQDhQMHO8F67lYCmPDyNCOCT/5UWh/GRE1XzvicPiUSpSMasJc5bXHd+LqjFXvV940OsFcNk8+I+KXL3EJyZujiJkmjewqHis+7rPO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgHl1VHl; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so2729563f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jul 2025 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751361464; x=1751966264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoabGmgU8w0gpmpZAkRXtp/892w1EXvQaKJMe7+uZCY=;
        b=bgHl1VHlpVWSyHODg2JAC2kWhfrFS4FayVn+UK2nQUbCiPC6GJ4esHXmLvbyHNcmLH
         F6SFE3if+ufHVikz0yIhXaDFRqyM2JW1VJkCZ/CY3lP4pObnn6BUnWa36+7UX2fveapu
         o/xYthqMmkEDkTqBK5P8mbNEFpQGQJ4Ayj+7pwKTvt9wOKpaD0Lq6FUeHT9F26LHtosp
         NanG4XyHQi5DKHYbFtnrfjVXFW3Mo2XW8g7a8i4mLRXaaUKI/UBbFQ0hF8jcRhgZE8vm
         xLrhCd/Uhzfw2ONo+62rlC2/+x6zDxZq1KyZiFf86jCEvlMFFVLTzqpcMMu7jQ+5JRkO
         t/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361464; x=1751966264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoabGmgU8w0gpmpZAkRXtp/892w1EXvQaKJMe7+uZCY=;
        b=hvbtdInms/uwqwVDRDz3JQtQXvc2MC83cj+6VAt3lsGp9cNUkDkWGBt5ZyetAZm6F+
         YK6Sz/0aG26BXK3NQS4WkVb1ieDFgn2UlR3EFkeB+MB0C3KKC8wis0yW9kdQcvqlmnJM
         ZX1lx9YlpA7HzVbYXkfYIlYyJD6Wcvm4+XfkZWefEAPODU0ewvS7LkMYGhgTXlt6fgks
         EAuStGHQanqm+RH+BawqcDVNmfUOUcDm23qzrifYQ2Jx/8sw0fJ8ao5ZWB7/ke5VgWxT
         jQfhulGFBE+onCsFbxtZ27zmm1o36jf/roVvmKNEtMd5npWIVKQMSAFjmei6OHERt0Wx
         sGWQ==
X-Gm-Message-State: AOJu0YwcaCYqSqID2COhdMhdFMYz8sSF3OxdR/cS8ajnn4NtsNFBsbs0
	3K+OMFhJBB0NflGAJEA75v4Ft1HP75AEtua6RArXXzmfa5fq8+LM6UUPoEhdoA==
X-Gm-Gg: ASbGncsbBubcZdYCLVPwI8qOhy5cOCnAWD1L/4v8yH+MWOyoJdLU6CzvIBxCjlJewFD
	5yDd1wolfoznVlWFAl8dN6UwlAr0of7AQT5GogzZ8zUPoftFUQZnFTIJX0mfaD6QJW9hRYq10xN
	pAqkI4zAb+kZqGZvTr5uKeeNksHTjwOm3k87A1H8LYQI3+IPInUBKQ/LG0Ep7GEsJj2aEjBDqTx
	K5ns07pSRVmkdJMVfxGu0T/wYeaY1v42kppTpp//GceCSVuWnK463G9xW8oNsppkkeQrnRrXhsz
	YgLoEkfI2lS8lsz0f6BIRMv8ho4UqqMgOW7HrVvX5G81A3SruNcanfClwVJ0UNaKf5OXDTjeNCx
	15Cy5lmCAblq1AQx3hFnz/9FX494=
X-Google-Smtp-Source: AGHT+IG0XIbTc6v7yHYSiY92AegvyQjkD5jGS/gSi+16A6ukFrKi/qmagMEHnQFMKo9nRRvlm21y3g==
X-Received: by 2002:a5d:5050:0:b0:3a6:d2ae:830 with SMTP id ffacd0b85a97d-3a9001a14a8mr12178603f8f.56.1751361463648;
        Tue, 01 Jul 2025 02:17:43 -0700 (PDT)
Received: from builder.. (253-8-142-46.pool.kielnet.net. [46.142.8.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5979dsm12624379f8f.75.2025.07.01.02.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:17:43 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH 3/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
Date: Tue,  1 Jul 2025 09:17:37 +0000
Message-ID: <20250701091737.3430-4-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701091737.3430-1-jelonek.jonas@gmail.com>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This extends the dt-bindings for the I2C driver for RTL9300 to account
for the added support for RTL9310 series.

A new property is added to explicitly set the SCL num/hardware instance
of the controller that is used. In contrast to RTL9300 the driver needs
to know that explicitly for RTL9310 because the SCL selection is now in
a global register instead of a master-specific register.

The regex for child-node address is adjusted to account for the fact
that RTL9310 supports 12 instead of 8 SDA lines.

A single generic compatible "realtek,rtl9310-i2c" is added. To best
knowledge, all existing SoCs of RTL9310 series (RTL9311, RTL9312,
RTL9313) have equal I2C capabilities thus don't need special treatment.
However, in the unlikely case of future differences with specific
SoCs within this series, more can be added as needed.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 33 ++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
index eddfd329c67b..3b32da3de2af 100644
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
@@ -24,6 +26,7 @@ properties:
               - realtek,rtl9303-i2c
           - const: realtek,rtl9301-i2c
       - const: realtek,rtl9301-i2c
+      - const: realtek,rtl9310-i2c
 
   reg:
     description: Register offset and size this I2C controller.
@@ -34,8 +37,18 @@ properties:
   "#size-cells":
     const: 0
 
+  scl-num:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      SCL number (0 or 1) to select I2C hardware instance. SCL0
+      is hardwired to master 1 and SCL1 to master 2.
+      Required only on RTL9310 if both or only second master
+      is used.
+    minimum: 0
+    maximum: 1
+
 patternProperties:
-  '^i2c@[0-7]$':
+  '^i2c@([0-9]|1[0-1])$':
     $ref: /schemas/i2c/i2c-controller.yaml
     unevaluatedProperties: false
 
@@ -67,3 +80,15 @@ examples:
         #size-cells = <0>;
       };
     };
+  - |
+    i2c@100c {
+      compatible = "realtek,rtl9310-i2c";
+      reg = <0x100c 0x18>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      scl-num = <0>;
+
+      i2c@0 {
+        reg = <0>;
+      };
+    };
-- 
2.48.1


