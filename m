Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24DD270B57
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Sep 2020 09:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISHC7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Sep 2020 03:02:59 -0400
Received: from www.zeus03.de ([194.117.254.33]:58954 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgISHC7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 19 Sep 2020 03:02:59 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 03:02:58 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=OaqQjMu+gJoOwxxoLd0zAbQ4t4D
        M5IXFSNzylbtZezg=; b=3cVzpc3AuMe2RxTcriJxgsnOpY6NMkqPUPM+D+3ORHa
        N9Bn4fzyk5sKaZvrmu0/9PZodDjUL+PguyGT/OF+VKN0ym/FXtVjzVhwQOut4ksf
        vO1T7nYVyPKGFh0kVQcJ/dLosIApA1NG1hTvE6+X+idGH/8H90K4xFevCJtd9/y0
        =
Received: (qmail 3619425 invoked from network); 19 Sep 2020 08:56:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2020 08:56:17 +0200
X-UD-Smtp-Session: l3s3148p1@WB8yHaWv0NtQT+F6
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] misc: eeprom: use helper to get i2c_client from kobj
Date:   Sat, 19 Sep 2020 08:56:15 +0200
Message-Id: <20200919065615.4939-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Slightly easier to read.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/misc/eeprom/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/eeprom.c b/drivers/misc/eeprom/eeprom.c
index 226b5efa6a77..34fa385dfd4b 100644
--- a/drivers/misc/eeprom/eeprom.c
+++ b/drivers/misc/eeprom/eeprom.c
@@ -76,7 +76,7 @@ static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
 			   struct bin_attribute *bin_attr,
 			   char *buf, loff_t off, size_t count)
 {
-	struct i2c_client *client = to_i2c_client(kobj_to_dev(kobj));
+	struct i2c_client *client = kobj_to_i2c_client(kobj);
 	struct eeprom_data *data = i2c_get_clientdata(client);
 	u8 slice;
 
-- 
2.28.0

