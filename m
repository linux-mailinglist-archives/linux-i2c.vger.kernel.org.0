Return-Path: <linux-i2c+bounces-15160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 938B5D1F53D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 15:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A473F306A0EC
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 14:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9CA2D595B;
	Wed, 14 Jan 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dm462atB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B12D3A7B
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400042; cv=none; b=B32UXVmRmodIH4OmRH5DshDcjyzQ8IDG1/jkZzXB75c8MMnHavXu3TYwA/BMnOx+tARijivRDJF0r5LHO1wneCAUpmyoDLBCDocy2fypKuEOE6tQ1q1T4gMckyj6xw0Sw9PBZH8fkIT2ytMn5ObpLTrsh1QrGXhHHj9GFi6ah1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400042; c=relaxed/simple;
	bh=6HChBFN3+eN58bAfM528LWbrmEuRIcjyzHO9UkHjyc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZ0kzwJzKz5Gw8TqhL4dSh/Xj/zibcnlFZbQ4rfQ/5SMgY0iglp6yw0PUefA1ksrbtGQwcmpx4Yd6eVQAUjg0cQfuu2B8H7fEyEvb0yaITkVgufg9vXYRRnZXffIobhyZtmQ7xZIPTWg/cVx9rSnRw/VHT9QuaHrj2OSpwWaZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dm462atB; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so12796039a12.3
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 06:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768400039; x=1769004839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw0lSbQFfSBadWYIdCR1R+5LqktQW19yPPn8YWeadt0=;
        b=dm462atBvWYnP4TW2NKp5IfBlfYYyQ/+rCCzx1tXMlfrh17gWwXDkRgbAN9G/sZhw5
         OscQpVegGXG3h3/ZxfqSrawqdwknzqfNeQIaih1ZBM8qLABEVvMetxuU+BeKFzT2r7zP
         JN+336wWiFtmH/fWLQbej13tDskZIf2WLN3civGprHAhfl11U/kPQZbcNCgZn2sRKBWu
         UfNYefgwUH9aF2bN6bitJCcRmP9ugaMeJKxuVW0jsyTsO9U2KIF3Om9U9St+/YJWE3Bm
         fYRqnerqsWpQ5WjemM8dvdDowb1rPOES9+aVsSuHT2FH36iP7BtyTyNSYWndl/+cH9Y3
         g/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400039; x=1769004839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lw0lSbQFfSBadWYIdCR1R+5LqktQW19yPPn8YWeadt0=;
        b=Ob/9jWRApVjL1K5UEj+K7VtKKfotxFmBZDo7FuBPIIL4ObGQoxsNW0i4yyYwlV3chi
         d73lIsNp1oKSenf4F0v0FO5B/v1mQSHoQTYOOBAbFSigdP2E22Zz4LEogPF9ua1LY70q
         oDg1ogmJn92+lRlEl/KLr1RCmJ/MdCRH4lUeLX6/5WJPkvCzAeBu3DzIIy4aNmrWzAio
         QIaYfcG/RBVbooklt0NJOix/NDkRdjqd5D3vtjgcRhcdBiAGe2o4T3fo2R5WSirFvixY
         VW/s7Fbw4thoS2JsnIzi3NqUmiVVfYDqAuwFk0pc0fdlXZ2SKDlWwkmFbLnKDfoD7BSI
         01+g==
X-Gm-Message-State: AOJu0Yzo+28eNDDzFsmEAQM23LAjW4QWh/qruRw44XjDL9wX4fs1e2uL
	dTgDokyx9Z7bD6eF5OFrscf4IO3TXgZxn86Utb69zR5FeU1CZq58qean
X-Gm-Gg: AY/fxX6nwnGApqD7S4EfTdLgKTSHH58hPggLKwa37OLwHVlV9WUbTnUBPyPDvvXTYbQ
	vJh9go+X+mZLOiIqHcNJCz1Wqxxmf9ZHYf4lmahGtJs7vyqpPmHkVyDdiF0jPbuz208Ezq+Cu+8
	queMQtP+jkX2zpyZgdsExSSeErs8pqV85FhUqI0WHOwGBh5pxCUDxI+L0SkYyusU5LnMkyXfe/s
	OqJDPBBWxghs+TxUOux5Rpp8GBHKdkmkWTpjhAUHMTktBopThScYIRrKzxyKKH07aCAlQu+XPRh
	LpnIOi4BvykEpBEYfJZgscudDCE+GyOfNakuvPFWXbj12fzCeOX7P/BsPts7MXfSThMWtch0pqV
	58kZ7ahe7DZg9hlBuA64Q+k2TPVMsIHj4/A+eeC873jR8lH0dX+0JlSxT1m7Kd5TcWY7iN25UXW
	cTqJtXpMi0LoKHDRf327PeXg==
X-Received: by 2002:a05:6402:1e94:b0:649:69da:6218 with SMTP id 4fb4d7f45d1cf-653ebf7a2e1mr2353585a12.0.1768400038618;
        Wed, 14 Jan 2026 06:13:58 -0800 (PST)
Received: from C-PF5D4647.localdomain ([147.161.248.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22651950a12.29.2026.01.14.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:13:58 -0800 (PST)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org
Cc: linux-i2c@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v1 1/2] i2c: core: add "force-set-sda" flag for open-drain SDA without "FLAG_IS_OUT" bit
Date: Wed, 14 Jan 2026 15:13:51 +0100
Message-ID: <20260114141352.103425-2-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114141352.103425-1-jie.i.li@nokia.com>
References: <20260114141352.103425-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On certain specialized SoC platforms, the I2C SDA pin is physically
open-drain but lacks the "FLAG_IS_OUT" bit in the GPIO subsystem.
In such cases, the set_sda function isn't assigned, causing bus
recovery to fail.

This patch introduces a new optional pinctrl flag "force-set-sda".
When this flag is present in the device tree, the I2C recovery
mechanism will explicitly attempt to toggle the SDA line through
the pinctrl state, ensuring the bus can be freed even when the
default recovery logic is insufficient for this specific hardware
implementation.

This change is necessary to improve the robustness of I2C
communication on hardware where the SDA line can remain stuck
low and standard recovery fails.

Signed-off-by: Jie Li <jie.i.li@nokia.com>
---
 drivers/i2c/i2c-core-base.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae7e9c8b65a6..ffbab3e4528d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -42,6 +42,9 @@
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/fwnode.h>
 
 #include "i2c-core.h"
 
@@ -422,9 +425,25 @@ static int i2c_gpio_init_recovery(struct i2c_adapter *adap)
 	return i2c_gpio_init_generic_recovery(adap);
 }
 
+/* Check if SDA can be driven for recovery when
+ * GPIO direction reporting is unavailable.
+ * Usage: add new flag "force-set-sda" in dts pinctrl.
+ */
+static bool force_set_sda(struct device *dev)
+{
+	if (!dev || !dev->of_node)
+		return false;
+
+	if (of_property_read_bool(dev->of_node, "force-set-sda"))
+		return true;
+	else
+		return false;
+}
+
 static int i2c_init_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
+	struct device *dev = &adap->dev;
 	bool is_error_level = true;
 	char *err_str;
 
@@ -446,7 +465,7 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 		if (bri->sda_gpiod) {
 			bri->get_sda = get_sda_gpio_value;
 			/* FIXME: add proper flag instead of '0' once available */
-			if (gpiod_get_direction(bri->sda_gpiod) == 0)
+			if (gpiod_get_direction(bri->sda_gpiod) == 0 || force_set_sda(dev))
 				bri->set_sda = set_sda_gpio_value;
 		}
 	} else if (bri->recover_bus == i2c_generic_scl_recovery) {
-- 
2.43.0


