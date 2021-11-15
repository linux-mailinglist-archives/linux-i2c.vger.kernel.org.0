Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A173450FD3
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 19:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242436AbhKOSgv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 13:36:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55570 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242158AbhKOSeu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 13:34:50 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: shreeya)
        with ESMTPSA id B5E3A1F44F22
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637001110; bh=U/odPWkiNZqaJgSMaK/WWQK5FMSfWCiioBpM4k781b8=;
        h=From:To:Cc:Subject:Date:From;
        b=FwbjEaP/e1wNeo94buJljl/fvd51gUI7iaNQIRzB0LOnu8jMazdH0ZlbD1ZpoeTeB
         zSsuvvHM9c2Hq32n6uyEdysWb7OxPsGFv35srrfaVshs6KKJ6Hch+ZeceS5kPsspFG
         z/7bj6UcSMvH5loo/QJ/7EbsHAH0PhWfKbmwJBuJDVnMn1MOgYxuUEjlE7ufFkL/0j
         rLvgo3X/uctgUjkg2w1jIBX5uLm2Io2OMGVNqgcQkog2/8KDKgaEMgn97P8BpmZ6bR
         7e3Dl3dgeDrLz7LR2ox8uQHqg9ZeL3OJjqtfALMN7nj7jkNznKJ+mUdpt1UGkr66rd
         9puA1Ra4552pA==
From:   Shreeya Patel <shreeya.patel@collabora.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        andy.shevchenko@gmail.com, wsa@kernel.org
Cc:     kernel@collabora.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Shreeya Patel <shreeya.patel@collabora.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v3] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
Date:   Tue, 16 Nov 2021 00:00:29 +0530
Message-Id: <20211115183029.234898-1-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We are racing the registering of .to_irq when probing the
i2c driver. This results in random failure of touchscreen
devices.

Following errors could be seen in dmesg logs when gc->to_irq is NULL

[2.101857] i2c_hid i2c-FTS3528:00: HID over i2c has not been provided an Int IRQ
[2.101953] i2c_hid: probe of i2c-FTS3528:00 failed with error -22

To avoid this situation, defer probing until to_irq is registered.

This issue has been reported many times in past and people have been
using workarounds like changing the pinctrl_amd to built-in instead
of loading it as a module or by adding a softdep for pinctrl_amd into
the config file.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209413

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>

---
Changes in v3
  - Fix the error reported by kernel test robot.

Changes in v2
  - Add a condition to check for irq chip to avoid bogus error.
---
 drivers/gpio/gpiolib.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index abfbf546d159..4d7fb349e837 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3111,6 +3111,16 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 
 		return retirq;
 	}
+#ifdef CONFIG_GPIOLIB_IRQCHIP
+	if (gc->irq.chip) {
+		/*
+		 * avoid race condition with other code, which tries to lookup
+		 * an IRQ before the irqchip has been properly registered,
+		 * i.e. while gpiochip is still being brought up.
+		 */
+		return -EPROBE_DEFER;
+	}
+#endif
 	return -ENXIO;
 }
 EXPORT_SYMBOL_GPL(gpiod_to_irq);
-- 
2.30.2

