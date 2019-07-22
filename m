Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACB1706CC
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731469AbfGVR0a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:30 -0400
Received: from sauhun.de ([88.99.104.3]:42386 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731460AbfGVR03 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:29 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 923A94A14A2;
        Mon, 22 Jul 2019 19:26:28 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] mfd: max77843: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:15 +0200
Message-Id: <20190722172623.4166-9-wsa+renesas@sang-engineering.com>
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

 drivers/mfd/max77843.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index 25cbb2242b26..209ee24d9ce1 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -70,11 +70,11 @@ static int max77843_chg_init(struct max77693_dev *max77843)
 {
 	int ret;
 
-	max77843->i2c_chg = i2c_new_dummy(max77843->i2c->adapter, I2C_ADDR_CHG);
-	if (!max77843->i2c_chg) {
+	max77843->i2c_chg = i2c_new_dummy_device(max77843->i2c->adapter, I2C_ADDR_CHG);
+	if (IS_ERR(max77843->i2c_chg)) {
 		dev_err(&max77843->i2c->dev,
 				"Cannot allocate I2C device for Charger\n");
-		return -ENODEV;
+		return PTR_ERR(max77843->i2c_chg);
 	}
 	i2c_set_clientdata(max77843->i2c_chg, max77843);
 
-- 
2.20.1

