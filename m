Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E33739CB0
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 12:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfFHK44 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 06:56:56 -0400
Received: from sauhun.de ([88.99.104.3]:51934 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727134AbfFHK44 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 8 Jun 2019 06:56:56 -0400
Received: from localhost (p5486CBCC.dip0.t-ipconnect.de [84.134.203.204])
        by pokefinder.org (Postfix) with ESMTPSA id AD80A3E4788;
        Sat,  8 Jun 2019 12:56:54 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 26/34] rtc: fm3130: simplify getting the adapter of a client
Date:   Sat,  8 Jun 2019 12:56:05 +0200
Message-Id: <20190608105619.593-27-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
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

Please apply to your subsystem tree.

 drivers/rtc/rtc-fm3130.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-fm3130.c b/drivers/rtc/rtc-fm3130.c
index e1137670d4d2..015cf639166e 100644
--- a/drivers/rtc/rtc-fm3130.c
+++ b/drivers/rtc/rtc-fm3130.c
@@ -107,8 +107,7 @@ static int fm3130_get_time(struct device *dev, struct rtc_time *t)
 	fm3130_rtc_mode(dev, FM3130_MODE_READ);
 
 	/* read the RTC date and time registers all at once */
-	tmp = i2c_transfer(to_i2c_adapter(fm3130->client->dev.parent),
-			fm3130->msg, 2);
+	tmp = i2c_transfer(fm3130->client->adapter, fm3130->msg, 2);
 	if (tmp != 2) {
 		dev_err(dev, "%s error %d\n", "read", tmp);
 		return -EIO;
@@ -200,8 +199,7 @@ static int fm3130_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	}
 
 	/* read the RTC alarm registers all at once */
-	tmp = i2c_transfer(to_i2c_adapter(fm3130->client->dev.parent),
-			&fm3130->msg[2], 2);
+	tmp = i2c_transfer(fm3130->client->adapter, &fm3130->msg[2], 2);
 	if (tmp != 2) {
 		dev_err(dev, "%s error %d\n", "read", tmp);
 		return -EIO;
@@ -351,7 +349,7 @@ static int fm3130_probe(struct i2c_client *client,
 	struct fm3130		*fm3130;
 	int			err = -ENODEV;
 	int			tmp;
-	struct i2c_adapter	*adapter = to_i2c_adapter(client->dev.parent);
+	struct i2c_adapter	*adapter = client->adapter;
 
 	if (!i2c_check_functionality(adapter,
 			I2C_FUNC_I2C | I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
-- 
2.19.1

