Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE5FC125F56
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 11:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfLSKlA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 05:41:00 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53384 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfLSKlA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 05:41:00 -0500
Received: by mail-wm1-f65.google.com with SMTP id m24so4903326wmc.3
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=49qmWNja8xWso4FeogRKBed5tqhunvxH+zJEA9gDNVo=;
        b=qbFafTkFmyywvhBYciuQ3n1+/mmUkFLWR8BJphIutx7kwEgWB9lJrcRyzOIODV2w3Y
         zw8uHtLpaS5kFHEF8S2lZZzKUDY+vuv1iTR14FcgsRkP1P6YBoNHfCiDw5tWnoza0Yoc
         /5o3L9striqLhCHOUlqlznNCCbAFKrwqdqiSV265orvYlTr7odHYHosqUSdOyqo1Ooy8
         6FynyISDkFzrOm4zC5eUCgZjBKO73rnESRvs4LzNkpEiW4N2SG6eDxRfvlvuUSXCQTf4
         axsvHI4mflaKMO4Scn/tSoyWXo1TkA3LV8ZJ8LgKu4qreR57u0SYISP6fK54fh3dW8YT
         Qtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=49qmWNja8xWso4FeogRKBed5tqhunvxH+zJEA9gDNVo=;
        b=eO4hEi2yv5+H/si+JL/OzdgF+dRdIjQZ/auSFR89YL4o2aoeG5o8J7q4n24nh4BJLG
         ff8XlQVdKONpcIxFH0kegTzApt6V16tYTgCcg+8NYQZnnbpX2GmWhCPwiioMOVr+5yoh
         Y486e8GZneo4zRH+eJsZ4vnoe79NCgWTJmZjdY/T4+4ilrmiNHKSUN98z2KFO3aYub4L
         HIgNmbd4sMGed6YwAmnbWc4I+9NO6BdQVS1PUu7b3DScceAS5Hw6F6Z/8tklcHaB4cSH
         PrfNXKjsZMu3Vc81z9blvQhqN+i7gh7QGFvqhUfeUUwXCW3fdvtKjuuxTlSkQVvMLHYH
         IV4w==
X-Gm-Message-State: APjAAAWBZxuNl5LX3S4j4fzgz+RFIDqQrwJoj7tX6bWMJwvQE1TYofi4
        lV3Xo4kXFXghjmDrey6GR0tjQjk2Fjw=
X-Google-Smtp-Source: APXvYqyZugbpqDnyGJArKzPiCHxj0Wjc81Rwcv4smK9lbk6Kyz6C/SJo9vmJBreM3F6OKgwcDkXoqg==
X-Received: by 2002:a05:600c:20c7:: with SMTP id y7mr9484733wmm.21.1576752058023;
        Thu, 19 Dec 2019 02:40:58 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id l17sm5925128wro.77.2019.12.19.02.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:40:57 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     linux-i2c@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] eeprom: at24: sort headers alphabetically
Date:   Thu, 19 Dec 2019 11:40:55 +0100
Message-Id: <20191219104055.6483-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

For consistency and easier maintenance: sort the headers alphabetically.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 86de3c192c80..4ed52f94a308 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -6,24 +6,24 @@
  * Copyright (C) 2008 Wolfram Sang, Pengutronix
  */
 
-#include <linux/kernel.h>
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/mutex.h>
-#include <linux/mod_devicetable.h>
-#include <linux/bitops.h>
-#include <linux/jiffies.h>
-#include <linux/property.h>
-#include <linux/acpi.h>
-#include <linux/i2c.h>
 #include <linux/nvmem-provider.h>
-#include <linux/regmap.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-#include <linux/gpio/consumer.h>
+#include <linux/slab.h>
 
 /* Address pointer is 16 bit. */
 #define AT24_FLAG_ADDR16	BIT(7)
-- 
2.23.0

