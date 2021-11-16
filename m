Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B31452E33
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Nov 2021 10:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbhKPJmd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Nov 2021 04:42:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34498 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbhKPJmb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Nov 2021 04:42:31 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: shreeya)
        with ESMTPSA id 14F8F1F45517
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637055572; bh=UOh/mlQFaw22xo9WHVNz2cr8hTemgxQ+nXiVIok1HPw=;
        h=From:To:Cc:Subject:Date:From;
        b=Afe9ZJ51KS4elifx7/n+bOnVyhmJK7jOq5CUFObjKRhdmy0Ndso+6JHDS1XCKaks/
         X1CepfNnomL/PEaWsjgXaLq/Qfbmcm1vyVCIDNdwIh5SkLYEAsAPCQssnXSohdj6x1
         Yp+hGiz62O7isHYD24/DMzFKIQ1ogsPYRoygP44/XmSmDvPt/nuzLbGP34wXUn8VhC
         L3MDwWpQQhKOB7uF53FPy4aG13cuyaNDo1UB02LQIaBOEx8PaOltymiixi1YrAfdIO
         +H50lAfNrK22ST8kOuar5RL4RM5Tj/9DPQlfTPOyj0+Zw2nG4Og8IxFrDS+bP3gcKE
         s5es24O/InECQ==
From:   Shreeya Patel <shreeya.patel@collabora.com>
To:     linus.walleij@linaro.org, andy.shevchenko@gmail.com,
        bgolaszewski@baylibre.com, wsa@kernel.org
Cc:     kernel@collabora.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        lkp@intel.com, Shreeya Patel <shreeya.patel@collabora.com>
Subject: [PATCH v4] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
Date:   Tue, 16 Nov 2021 15:08:33 +0530
Message-Id: <20211116093833.245542-1-shreeya.patel@collabora.com>
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
Changes in v4
  - Remove blank line and make the first letter of the sentence
capital.

Changes in v3
  - Fix the error reported by kernel test robot.

Changes in v2
  - Add a condition to check for irq chip to avoid bogus error.
---
 drivers/gpio/gpiolib.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index abfbf546d159..7b3f7f4d1d06 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3111,6 +3111,16 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 
 		return retirq;
 	}
+#ifdef CONFIG_GPIOLIB_IRQCHIP
+	if (gc->irq.chip) {
+		/*
+		 * Avoid race condition with other code, which tries to lookup
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

