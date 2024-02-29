Return-Path: <linux-i2c+bounces-2062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3024286D199
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6AA41F263E5
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865187A141;
	Thu, 29 Feb 2024 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eMuCMAFg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9308B70AE4;
	Thu, 29 Feb 2024 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230258; cv=none; b=equwyvw3GpItlNYBfLGLnLzZPri9l+gXlOhOfNth8Tvw4rhsOrZB/ZkExnhNtybadSe7cgKFeHYNUN69E+MYIoRYXdYN+PCWf0IDrQxHj1GXFkxcZGysOidl1hTN8MssQvJHTHMSjYIwtuRLrsebqWRpcprgbNf/khzliFggSCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230258; c=relaxed/simple;
	bh=miJJTTkCiPwGMNDF2KARqHikECescd5oBPrYE3A6WQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJPbbukeC+MbXyCCX/m5/RCwhbUypt1ekzapLknHbFWeiMt/qsbN623csTqF+Hjm2nASHSAU+Mbwn2jCr7V4TpCuGK2dlzSxexLRfn6LqR9xLfKMSJdqzRU2X+Ib+a4nLoJzy0GfUMRRi53BdLz2mzmBhLvCa9aZueAE+yQ183g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eMuCMAFg; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1D0860006;
	Thu, 29 Feb 2024 18:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4fOFj5dg3K7TaQX64fGwyCGx+GtP1xlvjO5rwEKu6Ic=;
	b=eMuCMAFgafsfwxncHS+aZQYb277Ijt6BWHsbu4zyWZyARHQTCi+3AeaodO9iC0+fi4pNIS
	dD0CiWXjwEy/qQyPZrvLG/tdHyEFw2B54c8PwDhiAd7fEuhNpFwvMBJmHlyVc7ZbcGAMPl
	QLVgN/5YRxCz+kxpoX04mQo+B9m+vgnPUdJ9i3gzZ9mx101MgOvMW+5I8kPceElAG6g3f5
	RojWpqWe8s5aXI1K0TpnueUCFVgklQzR3A9uLfOa9a+JNQY607m9qI57zu6S8RUlJZFUiu
	icZEz643p5Aq+kAGuJUaZRYLHE8a85OQJ0r3d8vUFfR8ApUyyqlsiXGtHEGbuA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:50 +0100
Subject: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon schema
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
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
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 linux-hwmon@vger.kernel.org
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Reference common hwmon schema which has the generic "label" property,
parsed by Linux hwmon subsystem.

To: Jean Delvare <jdelvare@suse.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index ed269e428a3d..29bd7460cc26 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -57,6 +57,7 @@ required:
   - reg
 
 allOf:
+  - $ref: hwmon-common.yaml#
   - if:
       not:
         properties:
@@ -71,7 +72,7 @@ allOf:
       properties:
         interrupts: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.44.0


