Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D50B70703
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbfGVR2B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:28:01 -0400
Received: from sauhun.de ([88.99.104.3]:42354 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731448AbfGVR02 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:28 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id E03F84A149F;
        Mon, 22 Jul 2019 19:26:26 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 05/14] mfd: da9150-core: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:12 +0200
Message-Id: <20190722172623.4166-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
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

 drivers/mfd/da9150-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 13033068721a..7f0aa1e8db96 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -420,10 +420,10 @@ static int da9150_probe(struct i2c_client *client,
 	qif_addr = da9150_reg_read(da9150, DA9150_CORE2WIRE_CTRL_A);
 	qif_addr = (qif_addr & DA9150_CORE_BASE_ADDR_MASK) >> 1;
 	qif_addr |= DA9150_QIF_I2C_ADDR_LSB;
-	da9150->core_qif = i2c_new_dummy(client->adapter, qif_addr);
-	if (!da9150->core_qif) {
+	da9150->core_qif = i2c_new_dummy_device(client->adapter, qif_addr);
+	if (IS_ERR(da9150->core_qif)) {
 		dev_err(da9150->dev, "Failed to attach QIF client\n");
-		return -ENODEV;
+		return PTR_ERR(da9150->core_qif);
 	}
 
 	i2c_set_clientdata(da9150->core_qif, da9150);
-- 
2.20.1

