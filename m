Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFD6D7070D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729510AbfGVR2U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:28:20 -0400
Received: from sauhun.de ([88.99.104.3]:42314 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731432AbfGVR00 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:26 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id AE4F54A148F;
        Mon, 22 Jul 2019 19:26:24 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] mfd: 88pm800: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:08 +0200
Message-Id: <20190722172623.4166-2-wsa+renesas@sang-engineering.com>
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

 drivers/mfd/88pm800.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index f2d9fb4c4e8e..4e8d0d6b9b5c 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -425,10 +425,10 @@ static int pm800_pages_init(struct pm80x_chip *chip)
 		return -ENODEV;
 
 	/* PM800 block power page */
-	subchip->power_page = i2c_new_dummy(client->adapter,
+	subchip->power_page = i2c_new_dummy_device(client->adapter,
 					    subchip->power_page_addr);
-	if (subchip->power_page == NULL) {
-		ret = -ENODEV;
+	if (IS_ERR(subchip->power_page)) {
+		ret = PTR_ERR(subchip->power_page);
 		goto out;
 	}
 
@@ -444,10 +444,10 @@ static int pm800_pages_init(struct pm80x_chip *chip)
 	i2c_set_clientdata(subchip->power_page, chip);
 
 	/* PM800 block GPADC */
-	subchip->gpadc_page = i2c_new_dummy(client->adapter,
+	subchip->gpadc_page = i2c_new_dummy_device(client->adapter,
 					    subchip->gpadc_page_addr);
-	if (subchip->gpadc_page == NULL) {
-		ret = -ENODEV;
+	if (IS_ERR(subchip->gpadc_page)) {
+		ret = PTR_ERR(subchip->gpadc_page);
 		goto out;
 	}
 
-- 
2.20.1

