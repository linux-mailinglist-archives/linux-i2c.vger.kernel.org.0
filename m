Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D4E77DDEA
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 11:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243604AbjHPJxD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 05:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243644AbjHPJwk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 05:52:40 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5CADF;
        Wed, 16 Aug 2023 02:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692179535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=/bQOVUk1e3G6QvspZ4ulPcqWFNFGRI07zJ9KxOxlZ5w=;
        b=1rNAHQ1SUAhWqxSCvC9R+pMxQgyEQTeinvPk4eJZalNXYtHeWKPWoKRPVnhDMtpR5ypKRK
        HBJkg8itrJ4DrX0/+Z19Z/QIlzaEwNKLdXrgnu9Nic6OL0UFN+7lmYQWOfTqgJ+85uQerW
        aYoxVTdW3pdFlxRBYnBOK8C1TeN8LuE=
Received: from fallen-ThinkPad-X260.home (<unknown> [109.190.253.11])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 7e150d35 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 16 Aug 2023 09:52:15 +0000 (UTC)
From:   Yann Sionneau <yann@sionneau.net>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>
Subject: [PATCH v2] i2c: designware: add support for pinctrl for recovery
Date:   Wed, 16 Aug 2023 11:50:15 +0200
Message-Id: <20230816095015.23705-1-yann@sionneau.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Yann Sionneau <ysionneau@kalray.eu>

Currently if the SoC needs pinctrl to switch the SCL and SDA
from the I2C function to GPIO function, the recovery won't work.

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

Tested-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---
V1 -> V2:
* remove the unnecessary 'if (!rinfo->pinctrl)' test
* test if return is -EPROBE_DEFER, in that case, return it.
* Reword the commit message according to review

 drivers/i2c/busses/i2c-designware-master.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 3bfd7a2232db..b45accbff915 100644
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
@@ -905,6 +906,15 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 		return PTR_ERR(gpio);
 	rinfo->sda_gpiod = gpio;
 
+	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
+	if (IS_ERR(rinfo->pinctrl)) {
+		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
+			return PTR_ERR(rinfo->pinctrl);
+
+		rinfo->pinctrl = NULL;
+		dev_info(dev->dev, "can't get pinctrl, bus recovery might not work\n");
+	}
+
 	rinfo->recover_bus = i2c_generic_scl_recovery;
 	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
 	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;

base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
-- 
2.34.1

