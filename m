Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23B6C7070B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731438AbfGVR2U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:28:20 -0400
Received: from sauhun.de ([88.99.104.3]:42320 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731327AbfGVR00 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:26 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 3EA064A149C;
        Mon, 22 Jul 2019 19:26:25 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 02/14] mfd: 88pm860x-core: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:09 +0200
Message-Id: <20190722172623.4166-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
ERRPTR which we use in error handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.

 drivers/mfd/88pm860x-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 9e0bd135730f..c9bae71f643a 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -1178,12 +1178,12 @@ static int pm860x_probe(struct i2c_client *client)
 	 */
 	if (pdata->companion_addr && (pdata->companion_addr != client->addr)) {
 		chip->companion_addr = pdata->companion_addr;
-		chip->companion = i2c_new_dummy(chip->client->adapter,
+		chip->companion = i2c_new_dummy_device(chip->client->adapter,
 						chip->companion_addr);
-		if (!chip->companion) {
+		if (IS_ERR(chip->companion)) {
 			dev_err(&client->dev,
 				"Failed to allocate I2C companion device\n");
-			return -ENODEV;
+			return PTR_ERR(chip->companion);
 		}
 		chip->regmap_companion = regmap_init_i2c(chip->companion,
 							&pm860x_regmap_config);
-- 
2.20.1

