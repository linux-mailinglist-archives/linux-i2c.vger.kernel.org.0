Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99BA370746
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfGVR3q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:29:46 -0400
Received: from sauhun.de ([88.99.104.3]:42128 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731304AbfGVR0H (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:07 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 7CF514A1491;
        Mon, 22 Jul 2019 19:26:05 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] media: dvb-frontends: mn88443x: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:25:56 +0200
Message-Id: <20190722172604.3572-3-wsa+renesas@sang-engineering.com>
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

 drivers/media/dvb-frontends/mn88443x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-frontends/mn88443x.c
index 9ec1aeef03d5..e4528784f847 100644
--- a/drivers/media/dvb-frontends/mn88443x.c
+++ b/drivers/media/dvb-frontends/mn88443x.c
@@ -722,9 +722,9 @@ static int mn88443x_probe(struct i2c_client *client,
 	 * Chip has two I2C addresses for each satellite/terrestrial system.
 	 * ISDB-T uses address ISDB-S + 4, so we register a dummy client.
 	 */
-	chip->client_t = i2c_new_dummy(client->adapter, client->addr + 4);
-	if (!chip->client_t)
-		return -ENODEV;
+	chip->client_t = i2c_new_dummy_device(client->adapter, client->addr + 4);
+	if (IS_ERR(chip->client_t))
+		return PTR_ERR(chip->client_t);
 
 	chip->regmap_t = devm_regmap_init_i2c(chip->client_t, &regmap_config);
 	if (IS_ERR(chip->regmap_t)) {
-- 
2.20.1

