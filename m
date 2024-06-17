Return-Path: <linux-i2c+bounces-4061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A9490ADA0
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 14:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48D1E1C2336A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 12:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9361957E8;
	Mon, 17 Jun 2024 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l+MWJeEJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BD6194C67;
	Mon, 17 Jun 2024 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718626108; cv=none; b=XyC/KFJ9gOkx7BdAcO48Z6Sbu4LCe6MNsG2WHoqokRPS9QFbP30xJL48+Rr0xUS5LGqBn1dEKJa3R2SHFYoFgkD7DM/o4QVxiwTLjwp65xme1RWdPbgpInHM0e0sUv6K6ulYtHOxkCRrEhUm3jg0sq9XIgO7bYipSvq/f7F0OIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718626108; c=relaxed/simple;
	bh=6rqp/IetoXZDMasN4pJd5j6omzCuq26v3C9C5JHRIuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JkluXe9y8lCQ44SDBwP4ebw7z7WPkjwMeM8fevjbxQYADVqXzDR4Ke5tT5fU37eqDT31cPUGsVGaDGtIMb9EH6NL0CjyXhihhqRTTV1kJNoW1V11t9pOLYFBGrH1rcQmwFTB5QBGVQdj2nEua0iDI3rxFAICktcDOXHKl/2zhbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l+MWJeEJ; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id AD0F94000B;
	Mon, 17 Jun 2024 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718626104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hV1T1441FVEYwTy62Jd9tktJYs4xntgXUcM3i5i8A6k=;
	b=l+MWJeEJ3vyqFS/w6UK5EQ+2HVEdSqJgOGiG4shuRQD9rKoh7ZryfIgL/2+AK2aqLyE/88
	56S1lZlRLuWTfvmFcGfSIU65XAZuNbDg1pRRmYYrxgLSgTumYyTuAdk6Akw9fcvEvMzWvI
	+rbiusfowBDe3WegaQqopZnDQUCC2RWfU/w0ksHs9vt3L5BZ6JXFq80iNT9rSyszdhhYfw
	hVUFCCYJyYEVfRO3tolJpnScoQdpsTLVXzRzWNdLnBi8N73IGxIIoQbYj721FLmriDFJ9k
	EF0zRFLCAXZFQBkxsLm8oNrqWd0LLnLeN6RLVJzKA8tPCIAg84M/aCSJsWjz+Q==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v3 2/3] i2c: mux: gpio: Re-order #include to match alphabetic order
Date: Mon, 17 Jun 2024 14:08:17 +0200
Message-ID: <20240617120818.81237-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

The #includes don't match alphabetic order.

Re-order #includes to match the alphabetic order before adding a new
one.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index d6bbb8b68333..c61e9d9ea695 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -5,16 +5,16 @@
  * Peter Korsgaard <peter.korsgaard@barco.com>
  */
 
+#include <linux/bits.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
+#include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/platform_data/i2c-mux-gpio.h>
 #include <linux/platform_device.h>
-#include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/bits.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
 
 struct gpiomux {
 	struct i2c_mux_gpio_platform_data data;
-- 
2.45.0


