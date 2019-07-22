Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64BC870834
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 20:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729023AbfGVSOs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 14:14:48 -0400
Received: from sauhun.de ([88.99.104.3]:42782 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728594AbfGVSOs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 14:14:48 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 3F0F54A148F;
        Mon, 22 Jul 2019 20:14:46 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: is31fl319x: simplify getting the adapter of a client
Date:   Mon, 22 Jul 2019 20:14:16 +0200
Message-Id: <20190722181416.6743-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have a dedicated pointer for that, so use it. Much easier to read and
less computation involved.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/leds/leds-is31fl319x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 2d077b8edd0e..ca6634b8683c 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -333,12 +333,11 @@ static int is31fl319x_probe(struct i2c_client *client,
 {
 	struct is31fl319x_chip *is31;
 	struct device *dev = &client->dev;
-	struct i2c_adapter *adapter = to_i2c_adapter(dev->parent);
 	int err;
 	int i = 0;
 	u32 aggregated_led_microamp = IS31FL319X_CURRENT_MAX;
 
-	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -EIO;
 
 	is31 = devm_kzalloc(&client->dev, sizeof(*is31), GFP_KERNEL);
-- 
2.20.1

