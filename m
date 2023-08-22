Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E372C78446A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 16:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236801AbjHVOex (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 10:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbjHVOew (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 10:34:52 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E371BCEA;
        Tue, 22 Aug 2023 07:34:47 -0700 (PDT)
Received: from junon.lin.mbt.kalray.eu (<unknown> [217.181.231.53])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id ba139134 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Tue, 22 Aug 2023 14:34:46 +0000 (UTC)
From:   Yann Sionneau <ysionneau@kalray.eu>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>
Subject: [PATCH v6] i2c: designware: Add support for recovery when GPIO need pinctrl.
Date:   Tue, 22 Aug 2023 16:34:37 +0200
Message-Id: <20230822143437.9395-1-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_FAIL,
        SPF_HELO_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently if the SoC needs pinctrl to switch the SCL and SDA from the I2C
function to GPIO function, the recovery won't work.

scl-gpio = <>;
sda-gpio = <>;

Are not enough for some SoCs to have a working recovery.
Some need:

scl-gpio = <>;
sda-gpio = <>;
pinctrl-names = "default", "recovery";
pinctrl-0 = <&i2c_pins_hw>;
pinctrl-1 = <&i2c_pins_gpio>;

The driver was not filling rinfo->pinctrl with the device node
pinctrl data which is needed by generic recovery code.

Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
V5 -> V6:
* Put a proper commit msg subject

V4 -> V5:
* put back `else if`
* reword the commit msg Subject to add the `i2c: designware: ` tag
* Add the missing `Reviewed-by: Andy Shevchenko` tag

V3 -> V4:
* Replace `else if` by simply `if`.

V2 -> V3:
* put back 'if (!rinfo->pinctrl)' test since devm_pinctrl_get()
can return NULL if CONFIG_PINCTRL is not set.
* print an error msg when devm_pinctrl_get() returns an error that
is not -EPROBE_DEFER.
* print a dbg msg if devm_pinctrl_get() return NULL. 

V1 -> V2:
* remove the unnecessary 'if (!rinfo->pinctrl)' test
* test if return is -EPROBE_DEFER, in that case, return it.
* Reword the commit message according to review

 drivers/i2c/busses/i2c-designware-master.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index b720fcc5c10a..30b2de829a32 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -855,6 +856,17 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 		return PTR_ERR(gpio);
 	rinfo->sda_gpiod = gpio;
 
+	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
+	if (IS_ERR(rinfo->pinctrl)) {
+		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
+			return PTR_ERR(rinfo->pinctrl);
+
+		rinfo->pinctrl = NULL;
+		dev_err(dev->dev, "getting pinctrl info failed: bus recovery might not work\n");
+	} else if (!rinfo->pinctrl) {
+		dev_dbg(dev->dev, "pinctrl is disabled, bus recovery might not work\n");
+	}
+
 	rinfo->recover_bus = i2c_generic_scl_recovery;
 	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
 	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
-- 
2.17.1

