Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5598E194A02
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgCZVLP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:11:15 -0400
Received: from sauhun.de ([88.99.104.3]:54484 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727938AbgCZVKL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:10:11 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 1D4D22C1F96;
        Thu, 26 Mar 2020 22:10:10 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] mfd: htc-i2cpld: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:10:09 +0100
Message-Id: <20200326211009.13411-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326211009.13411-1-wsa+renesas@sang-engineering.com>
References: <20200326211009.13411-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mfd/htc-i2cpld.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/htc-i2cpld.c b/drivers/mfd/htc-i2cpld.c
index 8ad6768bd7a2..247f9849e54a 100644
--- a/drivers/mfd/htc-i2cpld.c
+++ b/drivers/mfd/htc-i2cpld.c
@@ -355,12 +355,12 @@ static int htcpld_register_chip_i2c(
 	info.platform_data = chip;
 
 	/* Add the I2C device.  This calls the probe() function. */
-	client = i2c_new_device(adapter, &info);
-	if (!client) {
+	client = i2c_new_client_device(adapter, &info);
+	if (IS_ERR(client)) {
 		/* I2C device registration failed, contineu with the next */
 		dev_warn(dev, "Unable to add I2C device for 0x%x\n",
 			 plat_chip_data->addr);
-		return -ENODEV;
+		return PTR_ERR(client);
 	}
 
 	i2c_set_clientdata(client, chip);
-- 
2.20.1

