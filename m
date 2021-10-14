Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B50D42D7B8
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 13:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhJNLHZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Oct 2021 07:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhJNLHZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Oct 2021 07:07:25 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B597C061570;
        Thu, 14 Oct 2021 04:05:20 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2401:4900:1c20:48dc:2024:938f:96e4:4a08])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: shreeya)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4EF181F44A4A;
        Thu, 14 Oct 2021 12:05:18 +0100 (BST)
From:   Shreeya Patel <shreeya.patel@collabora.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com, wsa@kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Shreeya Patel <shreeya.patel@collabora.com>
Subject: [PATCH] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
Date:   Thu, 14 Oct 2021 16:34:37 +0530
Message-Id: <20211014110437.64764-1-shreeya.patel@collabora.com>
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
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 27c07108496d..fc0ba85f4c45 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3084,7 +3084,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 
 		return retirq;
 	}
-	return -ENXIO;
+	return -EPROBE_DEFER;
 }
 EXPORT_SYMBOL_GPL(gpiod_to_irq);
 
-- 
2.30.2

