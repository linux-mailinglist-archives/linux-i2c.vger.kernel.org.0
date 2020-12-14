Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD0F2D9BA4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 17:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407986AbgLNQBi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 11:01:38 -0500
Received: from www.zeus03.de ([194.117.254.33]:60916 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406958AbgLNQB3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Dec 2020 11:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=8GQApI/l+g6NMrOgnLOb1AORT3M
        0jd6EgA/DdNEWurU=; b=2cutqTMUAdEgLb15UMDdgyXdvCVRFqYLbcMzNSUFBX9
        /843smyaWVovJSI2CNf4t4cY1+BJnjiZm7iZAANSjOEDxwUNQzRNDmcZDv1CzQwU
        bCS8Oly0hvz5/1LDjyYEEMqjSbQ/3c7ZccUUu9MTMmYktMlaGxg+9WQtS1eFOnF4
        =
Received: (qmail 2470543 invoked from network); 14 Dec 2020 17:00:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2020 17:00:48 +0100
X-UD-Smtp-Session: l3s3148p1@163Rvm623q1UhsJO
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: gpio: fix MODULE_LICENCE
Date:   Mon, 14 Dec 2020 17:00:44 +0100
Message-Id: <20201214160044.3378-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Let MODULE_LICENCE match the SPDX header which is correctly based on the
previous textual description.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index a4a6825c8758..7a048abbf92b 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -520,5 +520,5 @@ module_exit(i2c_gpio_exit);
 
 MODULE_AUTHOR("Haavard Skinnemoen (Atmel)");
 MODULE_DESCRIPTION("Platform-independent bitbanging I2C driver");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:i2c-gpio");
-- 
2.28.0

