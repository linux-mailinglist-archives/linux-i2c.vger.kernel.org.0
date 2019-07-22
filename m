Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 809327071E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfGVR2v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:28:51 -0400
Received: from sauhun.de ([88.99.104.3]:42264 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731306AbfGVR0U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:20 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 929F54A149B;
        Mon, 22 Jul 2019 19:26:19 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] rtc: isl12026: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:15 +0200
Message-Id: <20190722172618.4061-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172618.4061-1-wsa+renesas@sang-engineering.com>
References: <20190722172618.4061-1-wsa+renesas@sang-engineering.com>
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

 drivers/rtc/rtc-isl12026.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 97f594f9667c..5b6b17fb6d62 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -454,9 +454,9 @@ static int isl12026_probe_new(struct i2c_client *client)
 
 	isl12026_force_power_modes(client);
 
-	priv->nvm_client = i2c_new_dummy(client->adapter, ISL12026_EEPROM_ADDR);
-	if (!priv->nvm_client)
-		return -ENOMEM;
+	priv->nvm_client = i2c_new_dummy_device(client->adapter, ISL12026_EEPROM_ADDR);
+	if (IS_ERR(priv->nvm_client))
+		return PTR_ERR(priv->nvm_client);
 
 	priv->rtc = devm_rtc_allocate_device(&client->dev);
 	ret = PTR_ERR_OR_ZERO(priv->rtc);
-- 
2.20.1

