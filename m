Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 581FC706FE
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbfGVR1v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:27:51 -0400
Received: from sauhun.de ([88.99.104.3]:42368 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731468AbfGVR0b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:31 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 43EB54A14A5;
        Mon, 22 Jul 2019 19:26:30 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] mfd: max8997: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:18 +0200
Message-Id: <20190722172623.4166-12-wsa+renesas@sang-engineering.com>
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

 drivers/mfd/max8997.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 8c06c09e36d1..68d8f2b95287 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -185,25 +185,25 @@ static int max8997_i2c_probe(struct i2c_client *i2c,
 
 	mutex_init(&max8997->iolock);
 
-	max8997->rtc = i2c_new_dummy(i2c->adapter, I2C_ADDR_RTC);
-	if (!max8997->rtc) {
+	max8997->rtc = i2c_new_dummy_device(i2c->adapter, I2C_ADDR_RTC);
+	if (IS_ERR(max8997->rtc)) {
 		dev_err(max8997->dev, "Failed to allocate I2C device for RTC\n");
-		return -ENODEV;
+		return PTR_ERR(max8997->rtc);
 	}
 	i2c_set_clientdata(max8997->rtc, max8997);
 
-	max8997->haptic = i2c_new_dummy(i2c->adapter, I2C_ADDR_HAPTIC);
-	if (!max8997->haptic) {
+	max8997->haptic = i2c_new_dummy_device(i2c->adapter, I2C_ADDR_HAPTIC);
+	if (IS_ERR(max8997->haptic)) {
 		dev_err(max8997->dev, "Failed to allocate I2C device for Haptic\n");
-		ret = -ENODEV;
+		ret = PTR_ERR(max8997->haptic);
 		goto err_i2c_haptic;
 	}
 	i2c_set_clientdata(max8997->haptic, max8997);
 
-	max8997->muic = i2c_new_dummy(i2c->adapter, I2C_ADDR_MUIC);
-	if (!max8997->muic) {
+	max8997->muic = i2c_new_dummy_device(i2c->adapter, I2C_ADDR_MUIC);
+	if (IS_ERR(max8997->muic)) {
 		dev_err(max8997->dev, "Failed to allocate I2C device for MUIC\n");
-		ret = -ENODEV;
+		ret = PTR_ERR(max8997->muic);
 		goto err_i2c_muic;
 	}
 	i2c_set_clientdata(max8997->muic, max8997);
-- 
2.20.1

