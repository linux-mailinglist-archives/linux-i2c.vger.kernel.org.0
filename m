Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3D23A37CA
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 15:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfH3Nb3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 09:31:29 -0400
Received: from sauhun.de ([88.99.104.3]:54438 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727756AbfH3Nb2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 09:31:28 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 6AE062C00AB;
        Fri, 30 Aug 2019 15:31:27 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-rtc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] rtc: s35390a: convert to devm_i2c_new_dummy_device()
Date:   Fri, 30 Aug 2019 15:31:24 +0200
Message-Id: <20190830133124.21633-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830133124.21633-1-wsa+renesas@sang-engineering.com>
References: <20190830133124.21633-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I was about to simplify the call to i2c_unregister_device() when I
realized that converting to devm_i2c_new_dummy_device() will simplify
the driver a lot. So I took this approach.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-s35390a.c | 54 ++++++++++-----------------------------
 1 file changed, 13 insertions(+), 41 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index d773fd597bd5..da34cfd70f95 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -434,37 +434,32 @@ static int s35390a_probe(struct i2c_client *client,
 	char buf, status1;
 	struct device *dev = &client->dev;
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		err = -ENODEV;
-		goto exit;
-	}
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENODEV;
 
 	s35390a = devm_kzalloc(dev, sizeof(struct s35390a), GFP_KERNEL);
-	if (!s35390a) {
-		err = -ENOMEM;
-		goto exit;
-	}
+	if (!s35390a)
+		return -ENOMEM;
 
 	s35390a->client[0] = client;
 	i2c_set_clientdata(client, s35390a);
 
 	/* This chip uses multiple addresses, use dummy devices for them */
 	for (i = 1; i < 8; ++i) {
-		s35390a->client[i] = i2c_new_dummy_device(client->adapter,
-							  client->addr + i);
+		s35390a->client[i] = devm_i2c_new_dummy_device(dev,
+							       client->adapter,
+							       client->addr + i);
 		if (IS_ERR(s35390a->client[i])) {
 			dev_err(dev, "Address %02x unavailable\n",
 				client->addr + i);
-			err = PTR_ERR(s35390a->client[i]);
-			goto exit_dummy;
+			return PTR_ERR(s35390a->client[i]);
 		}
 	}
 
 	err_read = s35390a_read_status(s35390a, &status1);
 	if (err_read < 0) {
-		err = err_read;
 		dev_err(dev, "error resetting chip\n");
-		goto exit_dummy;
+		return err_read;
 	}
 
 	if (status1 & S35390A_FLAG_24H)
@@ -478,13 +473,13 @@ static int s35390a_probe(struct i2c_client *client,
 		err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &buf, 1);
 		if (err < 0) {
 			dev_err(dev, "error disabling alarm");
-			goto exit_dummy;
+			return err;
 		}
 	} else {
 		err = s35390a_disable_test_mode(s35390a);
 		if (err < 0) {
 			dev_err(dev, "error disabling test mode\n");
-			goto exit_dummy;
+			return err;
 		}
 	}
 
@@ -493,10 +488,8 @@ static int s35390a_probe(struct i2c_client *client,
 	s35390a->rtc = devm_rtc_device_register(dev, s35390a_driver.driver.name,
 						&s35390a_rtc_ops, THIS_MODULE);
 
-	if (IS_ERR(s35390a->rtc)) {
-		err = PTR_ERR(s35390a->rtc);
-		goto exit_dummy;
-	}
+	if (IS_ERR(s35390a->rtc))
+		return PTR_ERR(s35390a->rtc);
 
 	/* supports per-minute alarms only, therefore set uie_unsupported */
 	s35390a->rtc->uie_unsupported = 1;
@@ -505,26 +498,6 @@ static int s35390a_probe(struct i2c_client *client,
 		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
 
 	return 0;
-
-exit_dummy:
-	for (i = 1; i < 8; ++i)
-		if (s35390a->client[i])
-			i2c_unregister_device(s35390a->client[i]);
-
-exit:
-	return err;
-}
-
-static int s35390a_remove(struct i2c_client *client)
-{
-	unsigned int i;
-	struct s35390a *s35390a = i2c_get_clientdata(client);
-
-	for (i = 1; i < 8; ++i)
-		if (s35390a->client[i])
-			i2c_unregister_device(s35390a->client[i]);
-
-	return 0;
 }
 
 static struct i2c_driver s35390a_driver = {
@@ -533,7 +506,6 @@ static struct i2c_driver s35390a_driver = {
 		.of_match_table = of_match_ptr(s35390a_of_match),
 	},
 	.probe		= s35390a_probe,
-	.remove		= s35390a_remove,
 	.id_table	= s35390a_id,
 };
 
-- 
2.20.1

