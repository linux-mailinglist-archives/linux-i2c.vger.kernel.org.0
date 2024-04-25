Return-Path: <linux-i2c+bounces-3128-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C748E8B1CBE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 10:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E645CB22FBC
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 08:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9250B757E1;
	Thu, 25 Apr 2024 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L59uDhSr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B297318A;
	Thu, 25 Apr 2024 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714033384; cv=none; b=ssssegjkFHI2Xf4hDGsj+kaAwpBRkcUJEcYv9iNBRKlspuAnO0+D5lNcjwhunBfq77B2E++o+ixrmicRx1/Bx7u5j5llDZesdOyCqdqk6J+jalnr3tScUl7XREVdpdSl2S+ltcs50CyZo1rYDICZiHSSb7eFCKv9VrD15MwVW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714033384; c=relaxed/simple;
	bh=4OnVVG04wGNmpMy5VHwC4+AcL9NxJc2smcCS5/sFr1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TUYAnrn1mgnJ+SWiGikrz7hxCBdVZDy1EMf62aQhm5mZZSwqij3liu1e5wtgOUDo0iuohWrbd+3X3+opomYyHvVPVCatOst7Yj6X4qNFdx0ndtg0wvtEsAaffHdslX06Uwc/7qqns5MdDtNhLIUVgjfNq62Ta7w8r+aiuEUcd1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L59uDhSr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A596720005;
	Thu, 25 Apr 2024 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=liuHsChJKivxfUk61Ur2FQ2Uhj35E9zYaulgIuxEJHE=;
	b=L59uDhSr1cMv34KF9Or4U/nZ6c3L12kSRHqevbGt5QVGCFlUJ46YbIWG1QlgYiYntX3lXd
	ljXSiLFoC9hgtN1/mplyjMcDJVdG1LIZRn/g02ddXSywtCOXml7KVTFk6kpCmxoJjls/IG
	Pby6COfUwQt7uqZZ+xnHWZNCvWR1HOutYZjQMcxiIUDEOahdcXv+ie4MI5QC1Yj48GmdKm
	eSZOXOv8EVsfdxcTnRizXqT3QUc1aEKatvQPUkk/lnO+2cLrccQRf6lV41Tg5y1hCHXanP
	FELLVOQFJebeXDVIZcMjvgTwa1zPMSGfZVVsXbDflh8rObXRM49yfp9n2YfiUg==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
To: jszhang@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH 1/4] dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
Date: Thu, 25 Apr 2024 10:21:32 +0200
Message-ID: <20240425082138.374445-2-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.bonnefille@bootlin.com

Add documentation for compatible string thead,th1520-i2c which can be
used specifically for the TH1520 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index d9293c57f573..a7fa191fefd6 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -33,6 +33,10 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: T-HEAD TH1520 SoCs I2C controller
+        items:
+          - const: thead,th1520-i2c
+          - const: snps,designware-i2c
 
   reg:
     minItems: 1
@@ -142,4 +146,12 @@ examples:
       interrupts = <8>;
       clocks = <&ahb_clk>;
     };
+  - |
+    i2c@e7f20000 {
+      compatible = "thead,th1520-i2c", "snps,designware-i2c";
+      reg = <0xe7f20000 0x4000>;
+      interrupts = <44>;
+      clocks = <&i2c_ic_clk>;
+      status = "disabled";
+    };
 ...
-- 
2.44.0


