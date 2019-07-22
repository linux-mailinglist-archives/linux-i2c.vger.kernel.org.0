Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81507706FA
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731467AbfGVR0a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:30 -0400
Received: from sauhun.de ([88.99.104.3]:42380 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731458AbfGVR03 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:29 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 0B1A54A14A1;
        Mon, 22 Jul 2019 19:26:28 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] mfd: max77693: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:14 +0200
Message-Id: <20190722172623.4166-8-wsa+renesas@sang-engineering.com>
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

 drivers/mfd/max77693.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 901d99d65924..596ed85cab3b 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -183,17 +183,17 @@ static int max77693_i2c_probe(struct i2c_client *i2c,
 	} else
 		dev_info(max77693->dev, "device ID: 0x%x\n", reg_data);
 
-	max77693->i2c_muic = i2c_new_dummy(i2c->adapter, I2C_ADDR_MUIC);
-	if (!max77693->i2c_muic) {
+	max77693->i2c_muic = i2c_new_dummy_device(i2c->adapter, I2C_ADDR_MUIC);
+	if (IS_ERR(max77693->i2c_muic)) {
 		dev_err(max77693->dev, "Failed to allocate I2C device for MUIC\n");
-		return -ENODEV;
+		return PTR_ERR(max77693->i2c_muic);
 	}
 	i2c_set_clientdata(max77693->i2c_muic, max77693);
 
-	max77693->i2c_haptic = i2c_new_dummy(i2c->adapter, I2C_ADDR_HAPTIC);
-	if (!max77693->i2c_haptic) {
+	max77693->i2c_haptic = i2c_new_dummy_device(i2c->adapter, I2C_ADDR_HAPTIC);
+	if (IS_ERR(max77693->i2c_haptic)) {
 		dev_err(max77693->dev, "Failed to allocate I2C device for Haptic\n");
-		ret = -ENODEV;
+		ret = PTR_ERR(max77693->i2c_haptic);
 		goto err_i2c_haptic;
 	}
 	i2c_set_clientdata(max77693->i2c_haptic, max77693);
-- 
2.20.1

