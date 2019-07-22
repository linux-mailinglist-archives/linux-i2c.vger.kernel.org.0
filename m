Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C68AE706F2
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfGVR1k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:27:40 -0400
Received: from sauhun.de ([88.99.104.3]:42320 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731319AbfGVR0c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:32 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id CB25D4A148F;
        Mon, 22 Jul 2019 19:26:30 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] mfd: max8998: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:19 +0200
Message-Id: <20190722172623.4166-13-wsa+renesas@sang-engineering.com>
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

 drivers/mfd/max8998.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 56409df120f8..785f8e9841b7 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -195,10 +195,10 @@ static int max8998_i2c_probe(struct i2c_client *i2c,
 	}
 	mutex_init(&max8998->iolock);
 
-	max8998->rtc = i2c_new_dummy(i2c->adapter, RTC_I2C_ADDR);
-	if (!max8998->rtc) {
+	max8998->rtc = i2c_new_dummy_device(i2c->adapter, RTC_I2C_ADDR);
+	if (IS_ERR(max8998->rtc)) {
 		dev_err(&i2c->dev, "Failed to allocate I2C device for RTC\n");
-		return -ENODEV;
+		return PTR_ERR(max8998->rtc);
 	}
 	i2c_set_clientdata(max8998->rtc, max8998);
 
-- 
2.20.1

