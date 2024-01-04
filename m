Return-Path: <linux-i2c+bounces-1102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F147823D45
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 09:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CBA128219F
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 08:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A17200C4;
	Thu,  4 Jan 2024 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5cW7jIh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EB320300;
	Thu,  4 Jan 2024 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d5b89e2bfso2326505e9.0;
        Thu, 04 Jan 2024 00:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704356236; x=1704961036; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yo/kfwaC+0cghHBJkwXJQ+6GFXjHeH5fKOmyjA1y+g=;
        b=h5cW7jIhBvXQdYwTTZvMAaeKxpSZ2admIYH4ysAdSwiYfwjiXBeIsrTjZ6PWm7Rev7
         XhyaUoIgOw5uzOlaASnzd10jh+u0oVt8AWVlstHYh2tmrlc3YWY9TzAkwk9Xh0VytruH
         j7eOQuO7wY3GYrolESeow6K9TZgo4/WDxSOryDm7sDhqKZyzogqewvk0ATbC5fnZfKXy
         E2hvalEUviRmMwGp7fKXDvSV9rN1cBuxC1Il36UvBv2weWUNlmvMqdqvkzmvRL6PnCwl
         xP2SmMYFn+CznBGuUG00MC84PZyLHkllg82HrhMDQ7qUnghOP3Syw+eXS+xFMaO8Mwwd
         rz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704356236; x=1704961036;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yo/kfwaC+0cghHBJkwXJQ+6GFXjHeH5fKOmyjA1y+g=;
        b=fE6XXNRaLBWRkZ1PvuVUTZtrg28Mr4magC+e9WH76t8ozIEa7CDjoMGp/Zt326gC1f
         GWMt3UbU1kYhnWHGDGwO+tzKDEuRFIJ+O0FmabOsqrBQib0za1KnLtX3PHNuMo9MJ7pe
         J/QWYSmFQwEDKCoYcM+0+FNR6E47xuX1wQrztx9fiBYeFJvA4/wKDv/oe3UtXNeisBHl
         L3V6LKPky81Ls6CQl3lvJq6WekaIR02y0IoX/KHfYKwONAiiD9qDx/iPjGAIvlPl4QdL
         MEyTBfusb7Zt2jB0HP2Wjf1bgHYu+lQ07xAZqAWtyDt/RMKdK1x2zmzS5z73vqZRGb3Z
         1qMg==
X-Gm-Message-State: AOJu0Yx7VWRgoUkvycHQqiJk+JCuOQxWf5OcXYvcY7LU2as5u2GOTRvW
	57rQYDE31WyDbgf69XWi1yLyBFEilS+3eQ==
X-Google-Smtp-Source: AGHT+IFGaSyxG24OcdSoHXozNsCDm76Z+2nM0b/f6GyEABzDvL3qGjNXJ3M+mM+2Zn2H/bT5qhq2dg==
X-Received: by 2002:a05:600c:3507:b0:40c:4be1:be09 with SMTP id h7-20020a05600c350700b0040c4be1be09mr126121wmq.186.1704356236164;
        Thu, 04 Jan 2024 00:17:16 -0800 (PST)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id g5-20020a7bc4c5000000b0040d62f89381sm4794049wmk.35.2024.01.04.00.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 00:17:15 -0800 (PST)
From: Benjamin Bara <bbara93@gmail.com>
Date: Thu, 04 Jan 2024 09:17:08 +0100
Subject: [PATCH] i2c: core: Fix atomic xfer check for non-preempt config
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240104-i2c-atomic-v1-1-a3a186f21c36@skidata.com>
X-B4-Tracking: v=1; b=H4sIAINplmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQwMT3UyjZN3EkvzczGRdIxNj0zQLY9MkU0sLJaCGgqLUtMwKsGHRsbW
 1AFguDeZcAAAA
To: Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: peterz@infradead.org, mwalle@kernel.org, Tor Vic <torvic9@mailbox.org>, 
 Erhard Furtner <erhard_f@mailbox.org>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.12.3

From: Benjamin Bara <benjamin.bara@skidata.com>

Since commit aa49c90894d0 ("i2c: core: Run atomic i2c xfer when
!preemptible"), the whole reboot/power off sequence on non-preempt kernels
is using atomic i2c xfer, as !preemptible() always results to 1.

During device_shutdown(), the i2c might be used a lot and not all busses
have implemented an atomic xfer handler. This results in a lot of
avoidable noise, like:

[   12.687169] No atomic I2C transfer handler for 'i2c-0'
[   12.692313] WARNING: CPU: 6 PID: 275 at drivers/i2c/i2c-core.h:40 i2c_smbus_xfer+0x100/0x118
...

Fix this by allowing non-atomic xfer when the interrupts are enabled, as
it was before.

Fixes: aa49c90894d0 ("i2c: core: Run atomic i2c xfer when !preemptible")
Cc: stable@vger.kernel.org # v5.2+
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Hi!

As there are a couple of bug reports already about missing atomic i2c
xfer handler warnings on non-preemptive configs around [1], this is an
attempt to reduce the avoidable noise.

thanks & regards
Benjamin

[1] https://lore.kernel.org/all/20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com/
---
 drivers/i2c/i2c-core.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 05b8b8dfa9bd..e48c0cd21438 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -3,6 +3,7 @@
  * i2c-core.h - interfaces internal to the I2C framework
  */
 
+#include <linux/kconfig.h>
 #include <linux/rwsem.h>
 
 struct i2c_devinfo {
@@ -29,7 +30,14 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
  */
 static inline bool i2c_in_atomic_xfer_mode(void)
 {
-	return system_state > SYSTEM_RUNNING && !preemptible();
+	/*
+	 * non-atomic xfers often use wait_for_completion*() calls to wait
+	 * efficiently (schedule out voluntarily) on the completion of the xfer,
+	 * which are then "completed" by an IRQ. If the constraints are not
+	 * satisfied, fall back to an atomic xfer.
+	 */
+	return system_state > SYSTEM_RUNNING &&
+	       (IS_ENABLED(CONFIG_PREEMPT_COUNT) ? !preemptible() : irqs_disabled());
 }
 
 static inline int __i2c_lock_bus_helper(struct i2c_adapter *adap)

---
base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
change-id: 20240104-i2c-atomic-2435f835b598

Best regards,
-- 
Benjamin Bara <benjamin.bara@skidata.com>


