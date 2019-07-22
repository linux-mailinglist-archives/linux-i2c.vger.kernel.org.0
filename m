Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D869E706FD
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbfGVR1v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:27:51 -0400
Received: from sauhun.de ([88.99.104.3]:42398 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731464AbfGVR0b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:31 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id AEA374A14A4;
        Mon, 22 Jul 2019 19:26:29 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] mfd: max8925-i2c: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:17 +0200
Message-Id: <20190722172623.4166-11-wsa+renesas@sang-engineering.com>
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

 drivers/mfd/max8925-i2c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
index 20bb19b71109..114e905bef25 100644
--- a/drivers/mfd/max8925-i2c.c
+++ b/drivers/mfd/max8925-i2c.c
@@ -176,18 +176,18 @@ static int max8925_probe(struct i2c_client *client,
 	dev_set_drvdata(chip->dev, chip);
 	mutex_init(&chip->io_lock);
 
-	chip->rtc = i2c_new_dummy(chip->i2c->adapter, RTC_I2C_ADDR);
-	if (!chip->rtc) {
+	chip->rtc = i2c_new_dummy_device(chip->i2c->adapter, RTC_I2C_ADDR);
+	if (IS_ERR(chip->rtc)) {
 		dev_err(chip->dev, "Failed to allocate I2C device for RTC\n");
-		return -ENODEV;
+		return PTR_ERR(chip->rtc);
 	}
 	i2c_set_clientdata(chip->rtc, chip);
 
-	chip->adc = i2c_new_dummy(chip->i2c->adapter, ADC_I2C_ADDR);
-	if (!chip->adc) {
+	chip->adc = i2c_new_dummy_device(chip->i2c->adapter, ADC_I2C_ADDR);
+	if (IS_ERR(chip->adc)) {
 		dev_err(chip->dev, "Failed to allocate I2C device for ADC\n");
 		i2c_unregister_device(chip->rtc);
-		return -ENODEV;
+		return PTR_ERR(chip->adc);
 	}
 	i2c_set_clientdata(chip->adc, chip);
 
-- 
2.20.1

