Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAA6664E38
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2019 23:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbfGJVwV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jul 2019 17:52:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39984 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbfGJVwE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jul 2019 17:52:04 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30FB29AF;
        Wed, 10 Jul 2019 23:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562795522;
        bh=0SwOJRCTU2AsqkMSBgvX4XVvxWl+8kQxsBvARbCej04=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ml2zs2nJucN0TCW8rKbkACRYKBo6WAI8pzMknKyPdNywA0FHVb3k947ysGGp+7o+I
         GBBUgTPAEj6yldHea3kuSt4VqwRfoT1RA0/pAYuasqPz5pHuSwLfinYXvgEOZQUfi/
         UFHR1d3rT6idpKs2PGhiXj13RiDUYFsGraNLlQvE=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/6] media: i2c: smiapp: Convert to new i2c device probe()
Date:   Wed, 10 Jul 2019 22:51:46 +0100
Message-Id: <20190710215149.9208-4-kieran.bingham+renesas@ideasonboard.com>
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
 drivers/media/i2c/smiapp/smiapp-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 2d78e846d822..9adf8e034e7d 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -2847,8 +2847,7 @@ static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
 	return NULL;
 }
 
-static int smiapp_probe(struct i2c_client *client,
-			const struct i2c_device_id *devid)
+static int smiapp_probe(struct i2c_client *client)
 {
 	struct smiapp_sensor *sensor;
 	struct smiapp_hwconfig *hwcfg = smiapp_get_hwconfig(&client->dev);
@@ -3172,7 +3171,7 @@ static struct i2c_driver smiapp_i2c_driver = {
 		.name = SMIAPP_NAME,
 		.pm = &smiapp_pm_ops,
 	},
-	.probe	= smiapp_probe,
+	.probe_new = smiapp_probe,
 	.remove	= smiapp_remove,
 	.id_table = smiapp_id_table,
 };
-- 
2.20.1

