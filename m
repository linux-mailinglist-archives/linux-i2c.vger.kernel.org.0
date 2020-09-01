Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5442598B7
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 18:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbgIAQaJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 12:30:09 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:32952 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730803AbgIAQaH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 12:30:07 -0400
X-Greylist: delayed 543 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Sep 2020 12:30:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598977803;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=R67TVdKPqKtVG4x1Q47JYeOebvZgXqLoj091CkvVqA0=;
        b=BWu07yLpEtXiQJ39IlULnZ4NKCaJ8JmHVC2uSbifiOWEpZr0WfkwLC24n5ydx0Lp4c
        Pz38cvgLXlZp3wIu66ALRySQFECdbkPm2IC3MeT5GUBEOzH2w68TqNhwiu5O89X4IMZP
        RNLfJ8mk56ELNnGglpjmz0PvS+O0I33JnEJNLqNTokIuuM7V1SBrylJ1mlW92AnJgzLk
        ptDXVGX6+hoZ7aMh4u4f3iXq85DidXiZLAZ3Z9PdQ5WdXEmZUF5WjBxC09y7+eFbj/Tg
        56iudn5Ow3qr+8rmoxOlrxfHgJcS7YL+vDAzHB5qVa4ooP/xty+U3m8PfjyzObDkNBbX
        FZeQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82Nfd22JDvA="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id e0624aw81GI0vh3
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 1 Sep 2020 18:18:00 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, linux-i2c@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] watchdog: da9063: wake up parent ahead of reboot
Date:   Tue,  1 Sep 2020 18:17:56 +0200
Message-Id: <20200901161756.28100-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch ensures our parent is awake before a reboot takes place. This
prevents situations in which the I2C host has been suspended and cannot
be safely woken up anymore when it needs to talk to us.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---

Hi!

This is supposed to resolve the issue that came up in the review of
"[PATCH v2] i2c: sh_mobile: implement atomic transfers" that the parent
controller may be suspended when the restart method is called. See
https://www.spinics.net/lists/linux-i2c/msg46367.html for details.

CU
Uli


 drivers/watchdog/da9063_wdt.c   | 21 +++++++++++++++++++++
 include/linux/mfd/da9063/core.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
index 423584252606..89718733491e 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -18,6 +18,8 @@
 #include <linux/mfd/da9063/registers.h>
 #include <linux/mfd/da9063/core.h>
 #include <linux/regmap.h>
+#include <linux/pm_runtime.h>
+#include <linux/reboot.h>
 
 /*
  * Watchdog selector to timeout in seconds.
@@ -158,6 +160,21 @@ static int da9063_wdt_set_timeout(struct watchdog_device *wdd,
 	return ret;
 }
 
+static int da9063_reboot_notifier(struct notifier_block *nb,
+				  unsigned long code, void *unused)
+{
+	struct da9063 *da9063 = container_of(nb, struct da9063, reboot_nb);
+
+	/*
+	 * Make sure parent device is running. This cannot be done in the
+	 * restart handler because it is no longer safe to do runtime PM
+	 * there.
+	 */
+	pm_runtime_get_sync(da9063->dev->parent);
+
+	return NOTIFY_DONE;
+}
+
 static int da9063_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 			      void *data)
 {
@@ -233,6 +250,10 @@ static int da9063_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
 	}
 
+	/* Get early notification of reboot so we can wake up the parent. */
+	da9063->reboot_nb.notifier_call = da9063_reboot_notifier;
+	devm_register_reboot_notifier(dev, &da9063->reboot_nb);
+
 	return devm_watchdog_register_device(dev, wdd);
 }
 
diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
index fa7a43f02f27..9a3283d488b7 100644
--- a/include/linux/mfd/da9063/core.h
+++ b/include/linux/mfd/da9063/core.h
@@ -85,6 +85,8 @@ struct da9063 {
 	int		chip_irq;
 	unsigned int	irq_base;
 	struct regmap_irq_chip_data *regmap_irq;
+
+	struct notifier_block reboot_nb;
 };
 
 int da9063_device_init(struct da9063 *da9063, unsigned int irq);
-- 
2.20.1

