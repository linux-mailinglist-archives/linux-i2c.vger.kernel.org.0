Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46488252646
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 06:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgHZE3w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 00:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgHZE3v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 00:29:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0500AC061574;
        Tue, 25 Aug 2020 21:29:51 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y6so293108plt.3;
        Tue, 25 Aug 2020 21:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCZ8S70q/brUfDJj63/s3T6IAKyQyHfuEnfukx9cOtU=;
        b=HrFlsGiZTha9U1y+3TC36VL/w9WVsJhdU6NuY/Ica1FvVWcLiXcSrzMQm6cM5Se/sI
         zff58XEgoztoWCNnfro2sMgwkjGxxevhWXgzNvBVJPvbTCM481QdORzMLEh+PMo0d/Ec
         uxsbLmYQsZNG47TU9X+0JkONopLangHoiSRSaQfWAYRikwSlWYQFhq6nZxeH9LCkT0Nl
         rVKrZarGhuTJ/MLrhy4Vyldxf54/VRePc69xKRpphNpN4H7a0AcooYRLvr1EaQs4qMGB
         hVZj2b9jtnp1a+tI7iifeR+WuQzIa9Luk7NDhB93n/P8WLIGsz/wUGg/kuywOad8XcvT
         g3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCZ8S70q/brUfDJj63/s3T6IAKyQyHfuEnfukx9cOtU=;
        b=ZLG17tZU7BM0XYb+QnKO7EHulcM4yAwJLjnFiC1TB3WhQ2Uht5R4DvUyuLhPZFHHBv
         XpxbEbUVVWRMEHAD0itqQqQeKnghEacBTrlH6rVBHPr/fbSOX/W8FFLF30ZdpGfe8pB9
         eCCDZwZdaYlLrVPeSaOILTQYbP/1QOSsUZDBUlU2mecR7CiP8mDqk2TSa7VP6SdxchWq
         P21iljVv6Fdgk/btXVxlQRifRYxhYaImndKzVWGlMD8NrD5SGU1W71FcVNVNzEcYIQ6U
         0ZhdYVbEZqnQMlZV78NX6vDKO3V8CTQIa9xMTThG3RXCHxsDN1tlSMXGy4GL/QaGT8Fx
         fJHQ==
X-Gm-Message-State: AOAM531VAvKipj8w51Rf5uvBhXf57mWtHU1KSLJ9w1xFfNQ00+Lq2OMK
        pEcOdAvG3JV41nt3BsthZ80=
X-Google-Smtp-Source: ABdhPJx2ltNFYF938dSpCBrZsWTvAvj5c/hdI2zRM+Pp8Hl43ycpBJJRrGKDVM9XCl99xOhQVp7Qrw==
X-Received: by 2002:a17:90a:f3ce:: with SMTP id ha14mr4157773pjb.149.1598416189918;
        Tue, 25 Aug 2020 21:29:49 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id a25sm885761pfk.151.2020.08.25.21.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 21:29:49 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH 1/2] i2c: consider devices with of_match_table during i2c device probing
Date:   Wed, 26 Aug 2020 13:29:37 +0900
Message-Id: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Unlike acpi_match_device(), acpi_driver_match_device() does
consider devices that provide of_match_table and performs
of_compatible() matching for such devices. The key point here is
that ACPI of_compatible() matching - acpi_of_match_device() - is
part of ACPI and does not depend on CONFIG_OF.

Consider the following case:
o !CONFIG_OF system
o probing of i2c device that provides .of_match_table, but no .id_table

 i2c_device_probe()
 ...
   if (!driver->id_table &&
       !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
       !i2c_of_match_device(dev->driver->of_match_table, client)) {
       status = -ENODEV;
       goto put_sync_adapter;
   }

i2c_of_match_device() depends on CONFIG_OF and, thus, is always false.
i2c_acpi_match_device() does ACPI match only, no of_comtatible() matching
takes place, even though the device provides .of_match_table and ACPI,
technically, is capable of matching such device. The result is -ENODEV.
Probing will succeed, however, if we'd use .of_match_table aware ACPI
matching.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 drivers/i2c/i2c-core-acpi.c | 10 ++++------
 drivers/i2c/i2c-core-base.c |  2 +-
 drivers/i2c/i2c-core.h      | 10 +++-------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 2ade99b105b9..1dd152ae75e5 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -276,14 +276,12 @@ void i2c_acpi_register_devices(struct i2c_adapter *adap)
 		dev_warn(&adap->dev, "failed to enumerate I2C slaves\n");
 }
 
-const struct acpi_device_id *
-i2c_acpi_match_device(const struct acpi_device_id *matches,
-		      struct i2c_client *client)
+bool i2c_acpi_match_device(struct device *dev, struct i2c_client *client)
 {
-	if (!(client && matches))
-		return NULL;
+	if (!client)
+		return false;
 
-	return acpi_match_device(matches, &client->dev);
+	return acpi_driver_match_device(&client->dev, dev->driver);
 }
 
 static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 34a9609f256d..35ec6335852b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -480,7 +480,7 @@ static int i2c_device_probe(struct device *dev)
 	 * or ACPI ID table is supplied for the probing device.
 	 */
 	if (!driver->id_table &&
-	    !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
+	    !i2c_acpi_match_device(dev, client) &&
 	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
 		status = -ENODEV;
 		goto put_sync_adapter;
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 94ff1693b391..7ee6a6e3fb8d 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -59,19 +59,15 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
 }
 
 #ifdef CONFIG_ACPI
-const struct acpi_device_id *
-i2c_acpi_match_device(const struct acpi_device_id *matches,
-		      struct i2c_client *client);
+bool i2c_acpi_match_device(struct device *dev, struct i2c_client *client);
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
 
 int i2c_acpi_get_irq(struct i2c_client *client);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
-static inline const struct acpi_device_id *
-i2c_acpi_match_device(const struct acpi_device_id *matches,
-		      struct i2c_client *client)
+bool i2c_acpi_match_device(struct device *dev, struct i2c_client *client)
 {
-	return NULL;
+	return false;
 }
 
 static inline int i2c_acpi_get_irq(struct i2c_client *client)
-- 
2.28.0

