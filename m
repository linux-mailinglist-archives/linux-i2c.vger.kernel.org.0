Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB062E068
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 17:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfE2PAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 11:00:38 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:17624 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726069AbfE2PAi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 May 2019 11:00:38 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 42974EB7D7499281D36F;
        Wed, 29 May 2019 23:00:35 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Wed, 29 May 2019
 23:00:16 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <bgolaszewski@baylibre.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] eeprom: at24: Remove set but not used variable 'addr'
Date:   Wed, 29 May 2019 22:59:54 +0800
Message-ID: <20190529145954.14500-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/misc/eeprom/at24.c: In function at24_make_dummy_client:
drivers/misc/eeprom/at24.c:514:21: warning: variable addr set but not used [-Wunused-but-set-variable]

It's not used since commit e7308628d0ae ("eeprom:
at24: use devm_i2c_new_dummy_device()")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/misc/eeprom/at24.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index ba8e73812644..fa730bb342e8 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -511,13 +511,11 @@ static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
 				  struct regmap_config *regmap_config)
 {
 	struct i2c_client *base_client, *dummy_client;
-	unsigned short int addr;
 	struct regmap *regmap;
 	struct device *dev;
 
 	base_client = at24->client[0].client;
 	dev = &base_client->dev;
-	addr = base_client->addr + index;
 
 	dummy_client = devm_i2c_new_dummy_device(dev, base_client->adapter,
 						 base_client->addr + index);
-- 
2.17.1


