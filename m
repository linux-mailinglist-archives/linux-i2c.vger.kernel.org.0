Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A236E432990
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 00:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhJRWIB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 18:08:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39594 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbhJRWIB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Oct 2021 18:08:01 -0400
Received: from localhost.localdomain (unknown [IPv6:2401:4900:1c20:2044:d49c:4fd9:7471:bb74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: shreeya)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EB76F1F432B7;
        Mon, 18 Oct 2021 23:05:45 +0100 (BST)
From:   Shreeya Patel <shreeya.patel@collabora.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, krisman@collabora.com,
        sebastian.reichel@collabora.com
Cc:     kernel@collabora.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Shreeya Patel <shreeya.patel@collabora.com>
Subject: [PATCH v2] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
Date:   Tue, 19 Oct 2021 03:35:04 +0530
Message-Id: <20211018220504.8301-1-shreeya.patel@collabora.com>
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

References :-
https://bugzilla.kernel.org/show_bug.cgi?id=209413
https://github.com/Syniurge/i2c-amd-mp2/issues/3

Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>

---
Changes in v2
  - Add a condition to check for irq chip to avoid bogus error.

---
 drivers/gpio/gpiolib.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 27c07108496d..12c088706167 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3084,6 +3084,14 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 
 		return retirq;
 	}
+	if (gc->irq.chip) {
+		/* avoid race condition with other code, which tries to lookup
+		 * an IRQ before the irqchip has been properly registered
+		 * (i.e. while gpiochip is still being brought up).
+		 */
+		return -EPROBE_DEFER;
+	}
+
 	return -ENXIO;
 }
 EXPORT_SYMBOL_GPL(gpiod_to_irq);
-- 
2.30.2

