Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D188B777F7F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 19:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjHJRql (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 13:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjHJRqk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 13:46:40 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C881A2702;
        Thu, 10 Aug 2023 10:46:39 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe1f70a139so2412445e9.0;
        Thu, 10 Aug 2023 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691689598; x=1692294398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEY0l2hGsYfEvo3xdPe/a1UqZtKuGMfO/1XoHriktLk=;
        b=f7+77h6leWAsCCaQSRB/TP3b6cMSzmbUAAVQS2DPELn5DI+WaqWpwB1IrwKZR/fLDL
         PXyD8Mu6wZqtL+Ga1IztR3z+u/FSayr5rPk+VcGkL0uac3xHy4w4S564Yxh/QFAbb8+0
         IIVD1hVpdWgkaaf2hlsSZ2Yf13rRxM1MsToO80JW92rAiyy+dpxezzE3HNmllAf3nUvS
         yXk5nY1blV08sQIoOjS3SqwTACLQzTRUbaWiv08VdmdnV5WlZZ91k9YtkzszQTP3HOQO
         UHQt/xh66h4emFzbJCL6gtePFkyM5iwoOPhAfyX2IIm5qZgWVXOyEugu8K+KmCql6+4U
         klyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691689598; x=1692294398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEY0l2hGsYfEvo3xdPe/a1UqZtKuGMfO/1XoHriktLk=;
        b=OrtE4gDxbYgNwmCnKhNxb74lugIj7xI0Wf8Xb1cWZsgBhIIjgCKay7q/RpVk1j6SNg
         ow7oefH8zdvzB+d/D9KaOTlq692iHYn4Hz6G/MTht9MrpqlG/MPanF/fHi7bz5sQ5vWi
         ++ihD83LXJ8p41nwDNpXqt/T3fRxKG9MKkiIgXdMQENYZ4UBOeGK7P+pqG89R5Z3l4k0
         JOqfvettM0T8a5r7/y1GwItYsMAVGf82qYNkRFNfoleHPL2/PhswOJY/qBa4cZ1+Bsjz
         7OG43Tum0+iVVXrElM4IgtHMtyylXjYdASdELeQoOFl6AbXFpQpoc8yQHCVmaZloekfH
         Npog==
X-Gm-Message-State: AOJu0Yz85FMWpVQBY4PMqgFCaKFQKxDAg8ukXn5eyqQCnNjoyeVfVuw5
        0aG3NdnhpXO5oc5EwF7jBrw=
X-Google-Smtp-Source: AGHT+IGv/UkrSCjSpoGmKpHZebJTXDjsxabGuEcNjJvfr7NZlaqscb+X5HwcRknVm5y5fmy/TrM2kg==
X-Received: by 2002:a05:600c:5101:b0:3fb:dde9:1de8 with SMTP id o1-20020a05600c510100b003fbdde91de8mr2787958wms.2.1691689598014;
        Thu, 10 Aug 2023 10:46:38 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([141.136.93.153])
        by smtp.gmail.com with ESMTPSA id h16-20020a5d6e10000000b003176bd661fasm2793424wrz.116.2023.08.10.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 10:46:37 -0700 (PDT)
From:   Ivan Orlov <ivan.orlov0322@gmail.com>
To:     wsa@kernel.org
Cc:     Ivan Orlov <ivan.orlov0322@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH] i2c: dev: make i2c_dev_class a static const structure
Date:   Thu, 10 Aug 2023 21:46:18 +0400
Message-Id: <20230810174618.7844-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now that the driver core allows for struct class to be in read-only
memory, move the i2c_dev_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 drivers/i2c/i2c-dev.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index a01b59e3599b..a91201509bc1 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -636,7 +636,10 @@ static const struct file_operations i2cdev_fops = {
 
 /* ------------------------------------------------------------------------- */
 
-static struct class *i2c_dev_class;
+static const struct class i2c_dev_class = {
+	.name = "i2c-dev",
+	.dev_groups = i2c_groups,
+};
 
 static void i2cdev_dev_release(struct device *dev)
 {
@@ -665,7 +668,7 @@ static int i2cdev_attach_adapter(struct device *dev)
 
 	device_initialize(&i2c_dev->dev);
 	i2c_dev->dev.devt = MKDEV(I2C_MAJOR, adap->nr);
-	i2c_dev->dev.class = i2c_dev_class;
+	i2c_dev->dev.class = &i2c_dev_class;
 	i2c_dev->dev.parent = &adap->dev;
 	i2c_dev->dev.release = i2cdev_dev_release;
 
@@ -751,12 +754,9 @@ static int __init i2c_dev_init(void)
 	if (res)
 		goto out;
 
-	i2c_dev_class = class_create("i2c-dev");
-	if (IS_ERR(i2c_dev_class)) {
-		res = PTR_ERR(i2c_dev_class);
+	res = class_register(&i2c_dev_class);
+	if (res)
 		goto out_unreg_chrdev;
-	}
-	i2c_dev_class->dev_groups = i2c_groups;
 
 	/* Keep track of adapters which will be added or removed later */
 	res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);
@@ -769,7 +769,7 @@ static int __init i2c_dev_init(void)
 	return 0;
 
 out_unreg_class:
-	class_destroy(i2c_dev_class);
+	class_unregister(&i2c_dev_class);
 out_unreg_chrdev:
 	unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
 out:
@@ -781,7 +781,7 @@ static void __exit i2c_dev_exit(void)
 {
 	bus_unregister_notifier(&i2c_bus_type, &i2cdev_notifier);
 	i2c_for_each_dev(NULL, i2c_dev_detach_adapter);
-	class_destroy(i2c_dev_class);
+	class_unregister(&i2c_dev_class);
 	unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
 }
 
-- 
2.34.1

