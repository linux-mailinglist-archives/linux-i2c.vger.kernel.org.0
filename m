Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D83758DA
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2019 22:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfGYUal (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jul 2019 16:30:41 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:50290 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfGYUak (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Jul 2019 16:30:40 -0400
X-Greylist: delayed 535 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Jul 2019 16:30:40 EDT
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id A8BE073ADEE; Thu, 25 Jul 2019 22:21:44 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH] i2c: designware: make use of devm_gpiod_get_optional
Date:   Thu, 25 Jul 2019 22:21:36 +0200
Message-Id: <20190725202136.19423-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is a semantical change: if devm_gpiod_get_optional returns -ENOSYS
this is passed as error to the caller. This effectively reverts commit
d1fa74520dcd ("i2c: designware: Consider SCL GPIO optional") which
shouldn't be necessary any more since gpiod_get_optional doesn't return
-ENOSYS any more with GPIOLIB=n.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/i2c/busses/i2c-designware-master.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d464799e40a3..867787dade43 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -657,13 +657,10 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	struct gpio_desc *gpio;
 	int r;
 
-	gpio = devm_gpiod_get(dev->dev, "scl", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio)) {
-		r = PTR_ERR(gpio);
-		if (r == -ENOENT || r == -ENOSYS)
-			return 0;
-		return r;
-	}
+	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
+	if (IS_ERR_OR_NULL(gpio))
+		return PTR_ERR_OR_ZERO(gpio);
+
 	rinfo->scl_gpiod = gpio;
 
 	gpio = devm_gpiod_get_optional(dev->dev, "sda", GPIOD_IN);
-- 
2.20.1

