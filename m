Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14FE064E32
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2019 23:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbfGJVwF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jul 2019 17:52:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39976 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbfGJVwE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jul 2019 17:52:04 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A34F31C;
        Wed, 10 Jul 2019 23:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562795521;
        bh=1ViAwmntyEFjf2y6O088ww3Zj3YwtPrX0lSOLg0/11Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SlJBN11pV0zXcDXzrQx+YV0qhPRt+Ufhlj2IcF5LkvSnmbLV/hLgtCSD4EQspGao9
         JHCdaFd/zaymd6Qrd/L8YewB4ZSa65RY2cz4PfIFCvvSA4HaprwhLTgsY8Nm4EtvvO
         ExxD+jDSeHFdoLdKB/TCLeiKaUqUwn3vkwWRappI=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Pawe? Chmiel" <pawel.mikolaj.chmiel@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/6] media: radio: si470x: Convert to new i2c device probe()
Date:   Wed, 10 Jul 2019 22:51:45 +0100
Message-Id: <20190710215149.9208-3-kieran.bingham+renesas@ideasonboard.com>
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
 drivers/media/radio/si470x/radio-si470x-i2c.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index 7d53422b3b56..7541698a0be1 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -330,8 +330,7 @@ static irqreturn_t si470x_i2c_interrupt(int irq, void *dev_id)
 /*
  * si470x_i2c_probe - probe for the device
  */
-static int si470x_i2c_probe(struct i2c_client *client,
-			    const struct i2c_device_id *id)
+static int si470x_i2c_probe(struct i2c_client *client)
 {
 	struct si470x_device *radio;
 	int retval = 0;
@@ -544,7 +543,7 @@ static struct i2c_driver si470x_i2c_driver = {
 		.pm		= &si470x_i2c_pm,
 #endif
 	},
-	.probe			= si470x_i2c_probe,
+	.probe_new		= si470x_i2c_probe,
 	.remove			= si470x_i2c_remove,
 	.id_table		= si470x_i2c_id,
 };
-- 
2.20.1

