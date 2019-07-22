Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF4E70743
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731311AbfGVR0H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:07 -0400
Received: from sauhun.de ([88.99.104.3]:42124 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731301AbfGVR0G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:06 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id E3F034A148F;
        Mon, 22 Jul 2019 19:26:04 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] media: dvb-frontends: cxd2820r_core: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:25:55 +0200
Message-Id: <20190722172604.3572-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172604.3572-1-wsa+renesas@sang-engineering.com>
References: <20190722172604.3572-1-wsa+renesas@sang-engineering.com>
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

 drivers/media/dvb-frontends/cxd2820r_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index 1f006f8e8cc2..5280ba4085e4 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -632,9 +632,9 @@ static int cxd2820r_probe(struct i2c_client *client,
 	 * one dummy I2C client in in order to get own I2C client for each
 	 * register bank.
 	 */
-	priv->client[1] = i2c_new_dummy(client->adapter, client->addr | (1 << 1));
-	if (!priv->client[1]) {
-		ret = -ENODEV;
+	priv->client[1] = i2c_new_dummy_device(client->adapter, client->addr | (1 << 1));
+	if (IS_ERR(priv->client[1])) {
+		ret = PTR_ERR(priv->client[1]);
 		dev_err(&client->dev, "I2C registration failed\n");
 		if (ret)
 			goto err_regmap_0_regmap_exit;
-- 
2.20.1

