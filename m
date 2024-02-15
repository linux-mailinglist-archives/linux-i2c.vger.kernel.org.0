Return-Path: <linux-i2c+bounces-1751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEFB856A12
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88DA7B2481D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545B1136987;
	Thu, 15 Feb 2024 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JP1M/bpk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF1135A78;
	Thu, 15 Feb 2024 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015959; cv=none; b=XovIUtAGTZ837B2Sd2fE28C+jVC7fvFMv1JzNsRn8FeIFgBBxGFV1u6+8ZM9KQ3CtEi3KyydW5Vp8YF8XDR1il6A6vqfwn4BKvgjxD/Kk1RfLiuC4icG7XFnJuGYnDwH3SDbdn7L9Kgs12ShYSOnRb80e5LUde9S2BerF6o5UMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015959; c=relaxed/simple;
	bh=Ijz14cGEXQbqSJZ0xGJh261hxmWQfnydjiU88f3iIpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtq9nhow3sjvTZdGJAJYqW0/0Wh9eC3JOz4Iu0Hg0a+eViXM5YhJdX3pGj4LcXWjk0n7nWdqsqfLf4UPviu4+GWMzGz/k9VetHAXvZ8+i3rUuG8w9pg/4a7TEUZMeqjBBq9kjKh+LNgb4ROFWge+w2NanqrcUcezWZH0qt11Lz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JP1M/bpk; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CE20E0014;
	Thu, 15 Feb 2024 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G6Tnp2unso4XKazSiaHxm91hgMMt9GxFy8ctCox1SvU=;
	b=JP1M/bpk9bS3ep85U+nbtsJhPr5WGZqySKANmguhxV3YSIYrvZOMDOgVZeA87geAQb9jUf
	6P8LNCHsKt8QUIE0xct6uroeEAxUrm0RnZoZU9QkzvinQmkyl+wvbIvJhFYjYFUnS3EQfW
	+ttcLLGBR++EuNY+uVTPqcfrrC1xAq3oqBCRyLXthyVpK13mzESZMdzptdcKUQCYJCVUl0
	/O8bECxGAPEQmIo/w+2nhxKiDkWnHWewJiB4pDCQ6IeflfDVIPkHpTsqxf212e96mkqdyS
	AkREzWfipVxO/lnFPW66vP4sJQf7RsOoaHSfxsT+hRK5di/BTcrbsbktdq1A6g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:08 +0100
Subject: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Expose I2C device timeout configuration from devicetree. Use µs as time
unit and express it in the name.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
index 16024415a4a7..e6b95e3765ac 100644
--- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
@@ -70,6 +70,10 @@ properties:
     minimum: 1
     maximum: 400000
 
+  timeout-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Timeout on I2C xfers in µs.
+
 required:
   - compatible
   - reg
@@ -98,6 +102,7 @@ examples:
       clock-names = "i2cclk", "apb_pclk";
       power-domains = <&pm_domains DOMAIN_VAPE>;
       resets = <&prcc_reset DB8500_PRCC_3 DB8500_PRCC_3_RESET_I2C0>;
+      timeout-usecs = <200000>;
     };
 
     i2c@101f8000 {

-- 
2.43.1


