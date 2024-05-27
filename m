Return-Path: <linux-i2c+bounces-3679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0B8CFF2D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2024 13:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3B3A1F23642
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2024 11:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3430A15E5B7;
	Mon, 27 May 2024 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VeRbRvUl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD66815D5D8;
	Mon, 27 May 2024 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716809965; cv=none; b=rju2dpbXEB+xJX4ezhWstCgoaQ60nMGARnE/Avk8OqI/KeGwM2lY3fUDCjqGID+f5EdmgGyvxGGPTECoxEmLYyYJbFCOfN3MhaGfOPvlPaf2p9kLl9IiyAVZHZuloKxPn3Cz6T0WQf18Ue7tPADI3uqai+5HRCrIAuKIvfy1oac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716809965; c=relaxed/simple;
	bh=8Q8bUe5t7Cc3xBL4MsSFOl/19C3f3eghMC1wwMxip+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nV/ieg+43DmMLHyLuvm3Cyrd44MD9KUD8/aUmCqiBrfmB9zPhB8yXtdqyEX9kmWvSQZyVE7CaBGU2Q03BITaUJemu4FCJSCaHtC2krMryrVVLR0dlvuctVbb1aR4scyhBU5BMgA/tB1iOgwdtqiUN6RCoAkxrA2k1MV/tKFh0Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VeRbRvUl; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 35B541C0009;
	Mon, 27 May 2024 11:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716809954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ltCzBYQuXG2u5FgNITnslerb1IuiczmEUWFQZ/f86s=;
	b=VeRbRvUllm8G5mHocd47dPjG6HfWX050s61cslirc8h6i7kYsoBbBbxIRAL5azOMZJtcYM
	OusN6PMXjautJR+fM19G3zhYJmnYJ8liW75Zuk7I77a7gLiVEGqRY8Y/MpttYbRoQWBYBA
	X9hudvyOggofFvMSBoJB58tyXap3nyWHD/zyWuG6I5X+S2DlSJA0K0R6PqROZollUySEid
	l/fxeZXY7Bo/7vr3KRSKktLHP9I/S6dm8ZlzTDXjsCRqYQS/LP5ugSf/SRyiyokvsjDWPY
	pcm/gqWpex6QX6bdGnkg2ebWIYvd7LCbYATrf67zwyVtcKQg5sHs4ury6GBgQw==
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
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 2/3] i2c: mux: gpio: Re-order #include to match alphabetic order
Date: Mon, 27 May 2024 13:39:07 +0200
Message-ID: <20240527113908.127893-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527113908.127893-1-bastien.curutchet@bootlin.com>
References: <20240527113908.127893-1-bastien.curutchet@bootlin.com>
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
2.44.0


