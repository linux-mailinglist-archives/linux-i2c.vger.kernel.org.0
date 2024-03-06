Return-Path: <linux-i2c+bounces-2221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A45873DE5
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A84A61C22BE2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 17:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43D613DBA7;
	Wed,  6 Mar 2024 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WGWNeC2M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2965D48F;
	Wed,  6 Mar 2024 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747973; cv=none; b=jfTTg9pEpWTjjAw1fvYmRoIhe8yM+nvHkxY+mznEZfrPHOEF3Lx6poviORPhGxHt1s44IFkVX0mzVPWwHkTBa25A+ouDYzd31KNLU7FWW9lA0yzum+ex3uT/jYHv2sIA+R3ENs/7RN89CcUx1LNeFsOKOQUPCCipKrpj2vobuiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747973; c=relaxed/simple;
	bh=ECHxC7b7bLXcI95sYnAvV2Yu8iR1BSGxurCKiipgcxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nIELKkdBaXuR1zB9DulCSdqBzYf79SrCoNZjkZY2loSrjRvVmQQO4BNpEilVH0tXqXuY0w8s3EgVAsIZo/D1gBcwiTiCa1ll3yF+CDejcaklVInDnazXex+KXN5Id5aLVU+ZHmko8nz1nd8q+tdJiiblHDwu0P0sOKWbO6HUPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WGWNeC2M; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5F8A4000D;
	Wed,  6 Mar 2024 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnePZ6t0muj+qmO6GfgW6xbIGHfwmN9GJxf+1OfIJzA=;
	b=WGWNeC2MV1NPZRTiQznlZ0yZ4yKFUe/qf+KzxskGcjIdLN+SrgM1jyS21PiAySEAn+hv5N
	gEzBH4kuV8jXhiZY/Nlr1rCBbm3xBDeYy18MRGBcQtztI6xVP6sSC0qFAaz2snAxVShLTu
	UdcXZXS51wR3IMhvA79U9MrWpwfvUrFotZioi/EtrIpxJrBtzCaCb8jhEHc5QQvEuBwjkx
	uIQL79O9KsFFIFP5OxR3QBVWAZh6OpU/mcvHnkbKe3DcgeBCNz6ZLRhD0W6+eziLIkPcqI
	PV1iGk03maSyqjpUfDpRHWb/tniMSimlFZ74ACB1oLSeAGGw1vyeAa66ULROvg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 18:59:29 +0100
Subject: [PATCH v3 09/11] i2c: nomadik: sort includes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-i2c-v3-9-605f866aa4ec@bootlin.com>
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

Sort #include statements in i2c-nomadik driver.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 7d039bd36aa6..ce18f7d43945 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -15,21 +15,21 @@
  * Author: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
  * Author: Sachin Verma <sachin.verma@st.com>
  */
+#include <linux/amba/bus.h>
 #include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/module.h>
-#include <linux/amba/bus.h>
-#include <linux/slab.h>
 #include <linux/interrupt.h>
-#include <linux/i2c.h>
-#include <linux/err.h>
-#include <linux/clk.h>
 #include <linux/io.h>
-#include <linux/pm_runtime.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
-#include <linux/mfd/syscon.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 
 #define DRIVER_NAME "nmk-i2c"
 

-- 
2.44.0


