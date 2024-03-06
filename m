Return-Path: <linux-i2c+bounces-2227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46639873DFB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 19:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02913282F9C
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DF7140381;
	Wed,  6 Mar 2024 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EejnwEd+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B713E7D6;
	Wed,  6 Mar 2024 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747976; cv=none; b=Wwjwa5+6mch/rZ7XlYyNP0ZeP4ecFv2Jbdm6i8w4yzOieXm/J12oxYVMPinx/S18AmpihDEa5PepRAYyJr9Y9IADTPxebUY+0gtct4wt5emiANZw5PRbE2AcaQP3Y4rJ1bnVRdTz7jRVTeSfM5eWUb01x0MMVPUWRvPCxoTWCQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747976; c=relaxed/simple;
	bh=JPU8ZqhLIMygFGqnyux6VMGW8Z+jhzIZZf+y7SYnbpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWIcl320l0nT3JqVTcQqa4ks/4veutQ5NECOeSyJEL9qjye4mcrYMkkNy6Y+x1wnYAEpPlsyTVWfwh+k7Blar5WLXbRw3wAM6cjqfygSV5KD3w8HAcySGqdbw19soaJdOeLFfAszojtXKwje8Io7B4sMFEkx9w6GPhPZm8FgOfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EejnwEd+; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15ED54000B;
	Wed,  6 Mar 2024 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srUFtx6yOhpJjE++KGlLiKzSDt78pohnW3Pif7vfVCg=;
	b=EejnwEd+Hqra3vQDx5L53ConTD3AhuGJJwsYYjnw3estXXLVQy7gxKU/tJrxGA9SX/o9S7
	X5sQUW6Y9Wk5a6TnH/BBuX40YN2WTGLHI8SoXQ3+1A+/QUC7JiR/awZUn1UqnlNgxKAOvt
	yr5HzHgziUQIo8biU3IXYAyzWTLOXRvEx7av77hJutaqXJf9TaYZhGUMOF9MqqqQXSQMMJ
	tDyENWS/O4XKNkbh7kd/E7aIFmjO8OrpfzRG0wE4uU48zudFE2B4O3PA+dtv6baibdT/Ho
	s015aBzTvx/UYK3fxbf56Yc+kB4fbNnGpvMyiCgIJ2MhOaLhrsUEmHVTisFJSg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 18:59:31 +0100
Subject: [PATCH v3 11/11] MIPS: mobileye: eyeq5: add evaluation board I2C
 temp sensor
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-i2c-v3-11-605f866aa4ec@bootlin.com>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
In-Reply-To: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
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
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Declare the temperature sensor on I2C bus 2. Its label is the schematics
identifier.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
index 6898b2d8267d..9fc1a1b0a81b 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
@@ -21,3 +21,11 @@ memory@0 {
 		      <0x8 0x02000000 0x0 0x7E000000>;
 	};
 };
+
+&i2c2 {
+	temperature-sensor@48 {
+		compatible = "ti,tmp112";
+		reg = <0x48>;
+		label = "U60";
+	};
+};

-- 
2.44.0


