Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51CD460159
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Nov 2021 21:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356117AbhK0UDe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Nov 2021 15:03:34 -0500
Received: from fgw20-4.mail.saunalahti.fi ([62.142.5.107]:59373 "EHLO
        fgw20-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240428AbhK0UBd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Nov 2021 15:01:33 -0500
X-Greylist: delayed 962 seconds by postgrey-1.27 at vger.kernel.org; Sat, 27 Nov 2021 15:01:33 EST
Received: from localhost.localdomain (85-76-76-77-nat.elisa-mobile.fi [85.76.76.77])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 1ee2b9b9-4fba-11ec-8d6d-005056bd6ce9;
        Sat, 27 Nov 2021 21:42:14 +0200 (EET)
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Subject: [PATCH] i2c: cbus-gpio: set atomic transfer callback
Date:   Sat, 27 Nov 2021 21:42:14 +0200
Message-Id: <20211127194214.26785-1-aaro.koskinen@iki.fi>
X-Mailer: git-send-email 2.17.0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

CBUS transfers have always been atomic, but after commit 63b96983a5dd
("i2c: core: introduce callbacks for atomic transfers") we started to see
warnings during e.g. poweroff as the atomic callback is not explicitly set.
Fix that.

Fixes the following WARNING seen during Nokia N810 power down:

[  786.570617] reboot: Power down
[  786.573913] ------------[ cut here ]------------
[  786.578826] WARNING: CPU: 0 PID: 672 at drivers/i2c/i2c-core.h:40 i2c_smbus_xfer+0x100/0x110
[  786.587799] No atomic I2C transfer handler for 'i2c-2'

Fixes: 63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 drivers/i2c/busses/i2c-cbus-gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cbus-gpio.c b/drivers/i2c/busses/i2c-cbus-gpio.c
index 72df563477b1..f8639a4457d2 100644
--- a/drivers/i2c/busses/i2c-cbus-gpio.c
+++ b/drivers/i2c/busses/i2c-cbus-gpio.c
@@ -195,8 +195,9 @@ static u32 cbus_i2c_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm cbus_i2c_algo = {
-	.smbus_xfer	= cbus_i2c_smbus_xfer,
-	.functionality	= cbus_i2c_func,
+	.smbus_xfer		= cbus_i2c_smbus_xfer,
+	.smbus_xfer_atomic	= cbus_i2c_smbus_xfer,
+	.functionality		= cbus_i2c_func,
 };
 
 static int cbus_i2c_remove(struct platform_device *pdev)
-- 
2.17.0

