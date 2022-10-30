Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37046612CB6
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiJ3Uek (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiJ3Uei (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:38 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA0EB7CF;
        Sun, 30 Oct 2022 13:34:36 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id g12so13430987wrs.10;
        Sun, 30 Oct 2022 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/pgm5Us2Yq+S8ZFCwq+NZ3vvwHGv8IPDUFxkuklnRI=;
        b=iW9FK1s7jeYS8FugmovRAodcRRrFtv6uJZOAKP8ZobyyvpnbTmg8lqdrVbkZ9je5i8
         biqVeGVOseZwJuFgTide2IE67TulaYq6JTFc9YZt/DyLHaB65zhyMaIfXOFfWMJWz28U
         yE7MelMUVBrnFNBcxPeFt9706lWuXexFLn5kk5kMAWF+4hPjnbIFmDmv0lp0o4BtaC08
         ZgoucQG0dYA9wSVVlUjl8qPQxTNLGw6GMjePJOZBleFJyUI6loTkSwInQvFItLc6codI
         /p8wbifXhlWQTYwtsvOihkVCpQolqPfH/CiXqDwHwD0i/oT+iLGp99niK+Bzd96/717H
         Oytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/pgm5Us2Yq+S8ZFCwq+NZ3vvwHGv8IPDUFxkuklnRI=;
        b=JYDYGijt9mM5c78pqiz+98CSr1W+4Isauc9SRyMrgV0xhCMhxHNq7OxnQm/CUDjvJm
         MyWc4E2xwWf77bqqmTiDdXKkrOmdHH/r9+CUVMj3fd4OZ6We40IC+S0gTviFXD9E9DMy
         tlLMWsVta5BAV4+pj77YGW2Uu5j1b57b5ryjHeLMPN0651o5p3seLYHEq8+rNXV578QM
         pSrdFZ9KTvtmS03xb7LiDRhoVV/4k4ESMoMUD5RSvHbx2YPQqgD7U4MNlerYS1OMZITI
         H1Q6aJtRB8X0+hiOgnNHpkfr940n+o+xRY66P/jK8tSmNOhriJP58272J8Y5OSFhCC09
         /xiQ==
X-Gm-Message-State: ACrzQf2zDgwsutzPB4HR+7RwkPzYKgnpDRKZ9vuGC0GfsROC2lMNqDyV
        KTeaWgpcD3YOAKeU9utqKW4=
X-Google-Smtp-Source: AMsMyM5xBmH9rpx2lt8kPqHmeJ3xhg6PE9aOYB2zutgKiILKug3qf76RstBfVmbCoM7DRY5U24cErQ==
X-Received: by 2002:adf:e54a:0:b0:236:bf8a:4782 with SMTP id z10-20020adfe54a000000b00236bf8a4782mr2733716wrm.442.1667162075367;
        Sun, 30 Oct 2022 13:34:35 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:34 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3 06/12] HID: ft260: do not populate /dev/hidraw device
Date:   Sun, 30 Oct 2022 22:33:57 +0200
Message-Id: <20221030203403.4637-7-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221030203403.4637-1-michael.zaidman@gmail.com>
References: <20221030203403.4637-1-michael.zaidman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Do not populate the /dev/hidraw on ft260 interfaces when the hid-ft260
driver is loaded.

$ sudo insmod hid-ft260.ko
$ ls /dev/hidraw*
/dev/hidraw0

$ sudo rmmod hid-ft260.ko
$ ls /dev/hidraw*
/dev/hidraw0  /dev/hidraw1  /dev/hidraw2

Reported-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 91f9087e49dc..8d6d2a19b9ed 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -939,7 +939,7 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	ret = hid_hw_start(hdev, 0);
 	if (ret) {
 		hid_err(hdev, "failed to start HID HW\n");
 		return ret;
@@ -966,6 +966,10 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret <= 0)
 		goto err_hid_close;
 
+	hid_info(hdev, "USB HID v%x.%02x Device [%s] on %s\n",
+		hdev->version >> 8, hdev->version & 0xff, hdev->name,
+		hdev->phys);
+
 	hid_set_drvdata(hdev, dev);
 	dev->hdev = hdev;
 	dev->adap.owner = THIS_MODULE;
@@ -974,8 +978,7 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->adap.quirks = &ft260_i2c_quirks;
 	dev->adap.dev.parent = &hdev->dev;
 	snprintf(dev->adap.name, sizeof(dev->adap.name),
-		 "FT260 usb-i2c bridge on hidraw%d",
-		 ((struct hidraw *)hdev->hidraw)->minor);
+		 "FT260 usb-i2c bridge");
 
 	mutex_init(&dev->lock);
 	init_completion(&dev->wait);
-- 
2.34.1

