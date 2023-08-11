Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71863779107
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 15:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjHKNwR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 09:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjHKNwQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 09:52:16 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611B518F;
        Fri, 11 Aug 2023 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1691761932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=u+Op4fSAQGBKlJNTICe166pUDg16oWgLxGnhC/CdOrU=;
        b=Wi3x4EFVYXiXZNT721AcjWkFG6zLIRZ2hMXLjwhWOsT3S2N3RWtrS6Ik2UXTYj0VPxL1Zm
        t7c9QIgU6c+KCZEuofxmMpVA0ta+aXUENndcSXwcWqPoytixDRUD8PjrRHxYGvMteiYl7A
        oSlTxuzkuOtz5T7LGpgC1ptJsyMDLYg=
Received: from junon.lin.mbt.kalray.eu (<unknown> [217.181.231.53])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 9df8bf6a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 11 Aug 2023 13:52:12 +0000 (UTC)
From:   Yann Sionneau <yann@sionneau.net>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>
Subject: [PATCH] i2c: designware: add support for pinctrl for recovery
Date:   Fri, 11 Aug 2023 15:52:01 +0200
Message-Id: <20230811135201.23046-1-yann@sionneau.net>
X-Mailer: git-send-email 2.17.1
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

Currently if the SoC needs pinctrl to switch the scl and sda
from hw function to gpio function, the recovery won't work.

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
 drivers/i2c/busses/i2c-designware-master.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index bee296cd74e6..b55c19b2515a 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/pinctrl/consumer.h>
 
 #include "i2c-designware-core.h"
 
@@ -841,6 +842,12 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 		return PTR_ERR(gpio);
 	rinfo->sda_gpiod = gpio;
 
+	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
+	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
+		rinfo->pinctrl = NULL;
+		dev_info(dev->dev, "can't get pinctrl, bus recovery might not work\n");
+	}
+
 	rinfo->recover_bus = i2c_generic_scl_recovery;
 	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
 	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
-- 
2.17.1

