Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29CA864E29
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2019 23:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbfGJVwJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jul 2019 17:52:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39998 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfGJVwG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jul 2019 17:52:06 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E9C61031;
        Wed, 10 Jul 2019 23:52:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562795523;
        bh=ynOWdlGpPUjEVj8ncm9RdYGaEipRCuvXbH+WF5QWdao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K5bWlwn6kP4Asuco+wGWtFba9RJoHyQHUxfG21ucRPlXfzcwOpHTJEuKTZi2oko9E
         NViYl3ydokvamQc8mG09D80AecXhQFC4bGa5GpRD5UYf1gN5prPLs/6LO84StEKojG
         wjFeG/mEZWXyxtAHcEzMBkNXKoV5idpugxU3AxDs=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/6] media: i2c: s5c73m3: Convert to new i2c device probe()
Date:   Wed, 10 Jul 2019 22:51:47 +0100
Message-Id: <20190710215149.9208-5-kieran.bingham+renesas@ideasonboard.com>
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
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index 7633aebd8c06..5b4c4a3547c9 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1650,8 +1650,7 @@ static int s5c73m3_get_platform_data(struct s5c73m3 *state)
 	return 0;
 }
 
-static int s5c73m3_probe(struct i2c_client *client,
-				const struct i2c_device_id *id)
+static int s5c73m3_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct v4l2_subdev *sd;
@@ -1806,7 +1805,7 @@ static struct i2c_driver s5c73m3_i2c_driver = {
 		.of_match_table = of_match_ptr(s5c73m3_of_match),
 		.name	= DRIVER_NAME,
 	},
-	.probe		= s5c73m3_probe,
+	.probe_new	= s5c73m3_probe,
 	.remove		= s5c73m3_remove,
 	.id_table	= s5c73m3_id,
 };
-- 
2.20.1

