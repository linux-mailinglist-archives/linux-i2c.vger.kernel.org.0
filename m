Return-Path: <linux-i2c+bounces-3568-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 132858C8720
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 15:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C57781F246B1
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 13:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDD6535D1;
	Fri, 17 May 2024 13:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="Vub0Ksgh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D11655E49
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715951819; cv=none; b=FC28+5pl6baC7dcafonWHqPp60KdPoRR+UDS6HrKhmLmn+AXRbdZBe6u5TpLqTRNRyaZyOJsl83AwMlGbklDk4dp28/A6i2DLfs4n4UFNPnLrsjl+pbLO6p8Iyb+tJ3gHv3r5oGJ9ZxIZC7NtjRgaMDu4dlFyzsNHppghXM8Zfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715951819; c=relaxed/simple;
	bh=aauTBVOT3XeIZIf4iPBR3drvWHeVdecOUmzx3NQ0Dn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/DzxIAs23Nz1QgEjI1MDXyZ7mFyaSRTJh/dSeywQPn8EsaUt6F4ZjvD/qKuBFwdFjlJMi5lSUhBpSmG8mtalMJCPWXeQK9I7gl5115xlbLEbvkXH4WxqYD92C0NbrFCzesJxFDLoSKs0YKSXQagZpmCLaYV+zQ0jvCykhukLYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=Vub0Ksgh; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: broonie@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715951816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoT2lrcR+fSoon+5nFQKLzIon+tYudtRC6WweACFb2U=;
	b=Vub0Ksghb7U+GY2K5QmoEjBgJQsxJ2FhQH5cHdYuKBbWrLz/NH0WKLvjeeA6k6I0idG3mx
	JMAKohti18ob3V/hv0HJk5qO28wjy+aPzA37yZBk2MUKhE/K4ByWa4SuO6YN4hfjpydzbT
	6i1MmJ3ahd99XJM+PH825HpB6VjQNkIYA4GY9hroEAg5nYjJpBMZrwVS7mxD8+SCCdmwUP
	UwqF0PER8BryHj1iovUY/KrusPIAIT8wKOpKy95vmenGVrhU1JUhQkz3MuZRg6ekcy0duI
	IRUwGczmtNM5q2z3K+qLV99AT1e4mr3lvbwVdI8pWtDTyFamdiCBlxp2QJaIIA==
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: rafael@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: brgl@bgdev.pl
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: perex@perex.cz
X-Envelope-To: tiwai@suse.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: linux-i2c@vger.kernel.org
X-Envelope-To: alsi@bang-olufsen.dk
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 15:02:20 +0200
Subject: [PATCH 13/13] MAINTAINERS: add maintainership for A2B drivers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-13-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Add all relevant A2B driver files to the MAINTAINERS file and mark
myself as maintainer.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90754a451bcf..c2019c78b77c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3501,6 +3501,18 @@ F:	kernel/audit*
 F:	lib/*audit.c
 K:	\baudit_[a-z_0-9]\+\b
 
+AUTOMOTIVE AUDIO BUS (A2B) DRIVERS
+M:	Alvin Šipraga <alsi@bang-olufsen.dk>
+S:	Supported
+F:	Documentation/devicetree/bindings/a2b/
+F:	drivers/a2b/
+F:	drivers/base/regmap/regmap-a2b.c
+F:	drivers/clk/clk-ad24xx.c
+F:	drivers/gpio/gpio-ad24xx.c
+F:	drivers/i2c/busses/i2c-ad24xx.c
+F:	include/linux/a2b/
+F:	sound/soc/codecs/ad24xx-codec.c
+
 AUXILIARY BUS DRIVER
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 R:	Dave Ertman <david.m.ertman@intel.com>

-- 
2.44.0


