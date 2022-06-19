Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE5555095F
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jun 2022 10:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbiFSIcT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jun 2022 04:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233655AbiFSIcS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Jun 2022 04:32:18 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1461181B;
        Sun, 19 Jun 2022 01:32:16 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id u37so7717723pfg.3;
        Sun, 19 Jun 2022 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SBTUv4o8XV3U+5AHPeniUbupyDLFCaEm7X67rKDOZUI=;
        b=J5XFxhrsgGEkx8zin0vpEAl/LJ1cTtO70iW+/LBitKblSb1rT/po8hVwLE7pFHg4KG
         UsbW2TGLgThNmF2GsECc3EPc2uvDupjIf7RfJavDSRLGxdH7ayLxFHoLZ2BDgE7OpDE8
         M3s1XB73pWossWXwGfR1sAxPPsdRe5dsmmsLPxNdPVZCKhAI0kFf1iPEGmqzna3nXftr
         ZXq70wziuB2GYwH0IugqjaFFGtR9nexorOLosZ9JuUN9pRhFiK0FDgoQxYW0AVYW4C+z
         vzbJPftP5ptjXiTQWZ6ulSFmCEqcs/ISJD3hr5g3xjnDCNkJ1KwUgPwRvRJkaqBGxGOh
         vbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SBTUv4o8XV3U+5AHPeniUbupyDLFCaEm7X67rKDOZUI=;
        b=1vjhNhIMk9BbDFCHEXhv3qg6Q9baXikycLEP/c3HHVr3VFwhWrciCnmotw61GQ/GJd
         X6afnOdaskJ8tVOyrwULsR7yJDjC/gMVdHTJRY3y7WT53OmV1Bptb43pNb1/EDp8xaFA
         Mr7VHervpKcmtnGR3AnfW88PzVmvZT1jOlqP5pVoQTJD0KTCJ5di9HWA3j26cHQojzQo
         RKB26bfVWIt8fBfBthusxyzW+T4kHW5LtONTqfobBgR6olHh1UdXQWawscGvSX3ypAPw
         TW+LjHiObb8pDAQL+7ETlbDfP1zzEwq0PM9ym7rzxFpN5mX+InIQr13WQtKFrZmVO2Tc
         2mbQ==
X-Gm-Message-State: AJIora/jmMzaKv1RLZ3FMs4RF9ypE8PelsPOeQ3XXI8sLnX7qrH08me/
        4wnrnazuV0595Y0qVsrUaaM=
X-Google-Smtp-Source: AGRyM1sOWfZKJgKybRGzpExEbxpCy3FcGK8vLF0W5sannEVQsx620HnqhVvinbu31iX6TA+hJeh3Og==
X-Received: by 2002:aa7:900a:0:b0:525:1e54:e64e with SMTP id m10-20020aa7900a000000b005251e54e64emr1354797pfo.35.1655627535697;
        Sun, 19 Jun 2022 01:32:15 -0700 (PDT)
Received: from LAPTOP-706CEGJT.localdomain ([113.116.119.185])
        by smtp.gmail.com with ESMTPSA id bd15-20020a056a00278f00b0050dc7628182sm6704543pfb.92.2022.06.19.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 01:32:15 -0700 (PDT)
From:   root <lijessen2016@gmail.com>
X-Google-Original-From: root <root@LAPTOP-706CEGJT.localdomain>
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        root <root@LAPTOP-706CEGJT.localdomain>
Subject: [PATCH] Print some info into ring-buffer during loading
Date:   Sun, 19 Jun 2022 16:32:07 +0800
Message-Id: <20220619083207.749-1-root@LAPTOP-706CEGJT.localdomain>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

---
 drivers/i2c/i2c-core-base.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d43db2c3876e..8e127ff3e32e 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -469,6 +469,8 @@ static int i2c_device_probe(struct device *dev)
 	struct i2c_driver	*driver;
 	int status;
 
+	pr_info("I have changed i2c device driver\n");
+
 	if (!client)
 		return 0;
 
@@ -1829,6 +1831,7 @@ int i2c_for_each_dev(void *data, int (*fn)(struct device *dev, void *data))
 	int res;
 
 	mutex_lock(&core_lock);
+	pr_info("i2c_for_each_dev: before bus_for_each_dev\n");
 	res = bus_for_each_dev(&i2c_bus_type, NULL, data, fn);
 	mutex_unlock(&core_lock);
 
@@ -1838,8 +1841,10 @@ EXPORT_SYMBOL_GPL(i2c_for_each_dev);
 
 static int __process_new_driver(struct device *dev, void *data)
 {
+	pr_info("Enter process_new_driver\n");
 	if (dev->type != &i2c_adapter_type)
 		return 0;
+	pr_info("__process_new_driver, before i2c_do_add_adapter\n");
 	return i2c_do_add_adapter(data, to_i2c_adapter(dev));
 }
 
@@ -1860,13 +1865,16 @@ int i2c_register_driver(struct module *owner, struct i2c_driver *driver)
 	driver->driver.owner = owner;
 	driver->driver.bus = &i2c_bus_type;
 	INIT_LIST_HEAD(&driver->clients);
-
+	pr_info("i2c driver name is [%s] before driver_register\n", driver->driver.name);
 	/* When registration returns, the driver core
 	 * will have called probe() for all matching-but-unbound devices.
 	 */
 	res = driver_register(&driver->driver);
-	if (res)
+	if (res){
+		pr_info("i2c driver name is [%s], res is [%d]\n", driver->driver.name, res);
 		return res;
+	}
+	pr_info("i2c driver name is [%s], after driver_register\n", driver->driver.name);
 
 	pr_debug("driver [%s] registered\n", driver->driver.name);
 
@@ -1933,7 +1941,7 @@ EXPORT_SYMBOL(i2c_clients_command);
 static int __init i2c_init(void)
 {
 	int retval;
-
+	pr_info("Jason-Lee: Entering i2c_init\n");
 	retval = of_alias_get_highest_id("i2c");
 
 	down_write(&__i2c_board_lock);
-- 
2.25.1

