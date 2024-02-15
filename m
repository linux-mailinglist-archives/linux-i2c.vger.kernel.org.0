Return-Path: <linux-i2c+bounces-1753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E29856A1E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39EC3B2477A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91AEE137C2B;
	Thu, 15 Feb 2024 16:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kWG7BC12"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9B9136641;
	Thu, 15 Feb 2024 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015960; cv=none; b=dwJ+6MHS/206j5KcxQbaKRi9/ii58fExGbNZG2KVQ0X9nTElRtqvE0uaR58gVYH1ZIVt+D2php1VQa+7NgCdcBPobEvbpH39wh3dfA7x7w7Rw5k6VLTP/ExUyvPqDgwn7MwQAqj4ZRKoP6iYRY/mFAcEXywpn5C/AMPywuBNXMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015960; c=relaxed/simple;
	bh=PoCHE8ou+HqKf9q62XlctFuCc6VGGNXKJurmEW+jTBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T685ffRVP8pGUNxmzA65RMb0JJwz7INlNMaeaAHS5GIdk2mb1hXuQ5DNB4mch7KJUGvrCG4g/ULaa2IZudvW41ZmwCIoHnAcS1T5WnuRXbcXwYsgnksq6zw4kb5umEe56R+n/LWlXqu3phbYfe10GyoRTGVk49Z0yJEGLiwEV+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kWG7BC12; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB00BE0008;
	Thu, 15 Feb 2024 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ribMBPqXMF0NG1bmqS6MEZxQmeMHwKGVz7dwwg0eqZ0=;
	b=kWG7BC12XnwCMtgu8iNlZZ1k883FJfp/4NLueKs5RUtF4zoIBip8jNQPyQ2nfFyywkg+Ct
	x7u6YMzdUP7Aek/2T28DCeM7AR36ForU5LFQSzqhztJE5vpTccmvPpLiq3aB7cBPtfghEa
	RMtYir9OIFLeCD7xfH0ZdyV1Sb5vzqaDOEpGzWBQsL4LxYQfiKaVjSie831y6qQsDCpPXj
	hnytIyxnYl4hGDJxv9TD+WzkIgC6Du7os7sLCI0BYfGCu6VaPQnYo7qZV0Kskr98lWHwgq
	m29O/jQMpd0C7GFvFjYv5sUqrYdqGUzuvlUsHky+YcOKJbtHhnq0bUUWksJs6g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:10 +0100
Subject: [PATCH 03/13] dt-bindings: hwmon: lm75: add label property
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-3-19a336e91dca@bootlin.com>
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
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 linux-hwmon@vger.kernel.org
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Declare optional label devicetree property. Show usage in one example
with dummy name.

To: Jean Delvare <jdelvare@suse.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: <linux-hwmon@vger.kernel.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index ed269e428a3d..5ca2c83b413d 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -52,6 +52,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  label:
+    description: user-facing name of the hardware monitor
+
 required:
   - compatible
   - reg
@@ -83,6 +86,7 @@ examples:
         compatible = "st,stlm75";
         reg = <0x48>;
         vs-supply = <&vs>;
+        label = "CPU temp";
       };
     };
   - |

-- 
2.43.1


