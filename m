Return-Path: <linux-i2c+bounces-3700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EAD8D32C4
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 11:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D3FB284672
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 09:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037CB16D325;
	Wed, 29 May 2024 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ag7y8wJu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5D216A362;
	Wed, 29 May 2024 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974274; cv=none; b=N49iojq47qYQEN6vQH7f5RGy1lfNMTZJfpbtT1h1TJ5O/cFAU3Zs/8RwcrkwCNGdjunT1ttcOab5N/GT7NZHLDVjzE8A96/1iePz1Mk5OnYmMyedGlPXMrn8AEAGeZz2KBcOJ9h/7CycPs4tlTYkHCX6ppi7QDoWiye72xjB044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974274; c=relaxed/simple;
	bh=8Q8bUe5t7Cc3xBL4MsSFOl/19C3f3eghMC1wwMxip+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUj0PkbzyQArUaqkL3WtRCTDDvZtbJbvJE/tLNWng24EEUlIHS9AczC0P4NZIHNAykP+V/1pem4Qb4aBjcLgxB0JxjOMBPemaifCoflFdWSC67vxAgN47vaOERKaCuZ+X6GeFpAKjDSQ4gKDfojN1v5g96jR+PweO4qkdsPYWOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ag7y8wJu; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 644A540008;
	Wed, 29 May 2024 09:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716974265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ltCzBYQuXG2u5FgNITnslerb1IuiczmEUWFQZ/f86s=;
	b=Ag7y8wJuduiSMmSRM2ZYkpkhP1tQiRS9laxVzjhQxs0hLTa9rMcbioOHahTcK+r0K2yfI/
	N5Pn55ivrT8LeZM1izPRQAtHAz/4WQwdX6xLFF6qrIFdDxWkrNC/0ME/125LhLlPUaA5XV
	9MTH2v+PVVD1VO3eQGuWlqVRUlt7QtVQfpFzFxCaQORQea8NAVbR3+PHwsNtwpSOKMna2G
	cqPNEyLv8UbWGaqLbTOGW9vrMwg2QJQREkzWDrkoR3vSNqW4PG+nVgXpktq9lGuf///Gbr
	3pioFx3LhqJk7VJNieNya41esHfq9EQHpKlJP4szkMUgDTckJoE2iCzztEBvYQ==
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
Subject: [PATCH v2 2/3] i2c: mux: gpio: Re-order #include to match alphabetic order
Date: Wed, 29 May 2024 11:17:38 +0200
Message-ID: <20240529091739.10808-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
References: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
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


