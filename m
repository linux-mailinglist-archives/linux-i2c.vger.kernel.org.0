Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5942420FEC
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 23:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfEPVNX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 17:13:23 -0400
Received: from sauhun.de ([88.99.104.3]:45628 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbfEPVNW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 May 2019 17:13:22 -0400
Received: from localhost (p54B334EA.dip0.t-ipconnect.de [84.179.52.234])
        by pokefinder.org (Postfix) with ESMTPSA id 1C0C72C0507;
        Thu, 16 May 2019 23:13:20 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v8 3/3] mfd: da9063: occupy second I2C address, too
Date:   Thu, 16 May 2019 23:13:10 +0200
Message-Id: <20190516211310.22277-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Even though we don't use it yet, we should mark the second I2C address
this device is listening to as used.

Not yet for upstream until all dependencies are merged!

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mfd/da9063-i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index 455de74c0dd2..2133b09f6e7a 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -221,6 +221,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter, i2c->addr + 1);
+
 	return da9063_device_init(da9063, i2c->irq);
 }
 
-- 
2.19.1

