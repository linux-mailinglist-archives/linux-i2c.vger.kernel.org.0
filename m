Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D7964E2B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2019 23:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbfGJVwM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jul 2019 17:52:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40008 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727856AbfGJVwK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jul 2019 17:52:10 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0E0731C;
        Wed, 10 Jul 2019 23:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562795529;
        bh=0B5lLKSXFRO7OfOCzgAUxYlS5yKOAcCCoo3Cw6FhwFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n+SDziBe8BHm8oaLJYB5GUy9gfUYpj5hTJPOKaSzN4B11iPxap569Qyd0LypDPGNa
         rkRe739TNnyfVDTX8r7iR/LSJ/dJzWYiMzN4YVeHtIQVRofa1Sb2dGcGJCsT0rQkmq
         pKcO6VaraE6PMm4HW3pCuWhffyAaPNHC2a0po7rA=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/6] media: i2c: et8ek8: Convert to new i2c device probe()
Date:   Wed, 10 Jul 2019 22:51:48 +0100
Message-Id: <20190710215149.9208-6-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710215149.9208-1-kieran.bingham+renesas@ideasonboard.com>
References: <20190710215149.9208-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C core framework provides a simplified probe framework from commit
b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type").

This driver does not utilise the i2c_device_id table in the probe, so we can
easily convert it to utilise the simplfied i2c driver registration.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index e6c06cb75d33..256acf73d5ea 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1396,8 +1396,7 @@ static int __maybe_unused et8ek8_resume(struct device *dev)
 	return __et8ek8_set_power(sensor, true);
 }
 
-static int et8ek8_probe(struct i2c_client *client,
-			const struct i2c_device_id *devid)
+static int et8ek8_probe(struct i2c_client *client)
 {
 	struct et8ek8_sensor *sensor;
 	struct device *dev = &client->dev;
@@ -1504,7 +1503,7 @@ static struct i2c_driver et8ek8_i2c_driver = {
 		.pm	= &et8ek8_pm_ops,
 		.of_match_table	= et8ek8_of_table,
 	},
-	.probe		= et8ek8_probe,
+	.probe_new	= et8ek8_probe,
 	.remove		= __exit_p(et8ek8_remove),
 	.id_table	= et8ek8_id_table,
 };
-- 
2.20.1

