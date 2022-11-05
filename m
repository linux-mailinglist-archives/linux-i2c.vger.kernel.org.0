Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4090A61DE54
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiKEVNY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbiKEVNI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:13:08 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118E9120A3;
        Sat,  5 Nov 2022 14:13:01 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id l11so12254147edb.4;
        Sat, 05 Nov 2022 14:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/pgm5Us2Yq+S8ZFCwq+NZ3vvwHGv8IPDUFxkuklnRI=;
        b=TYmJn6OByOPMmMzF8mJvwXco5uoZteGK2huxTy/qItH3gMDh+Bt+wzerZrsE5a4GyH
         7jYDD2uLvB+Dou2btBswSM8FC1vVvf+14mfI91mxclDvtkVD3qWAfWQhdK0VjJtOxQSV
         lsO0zOCjnKaFzXKMBD1xq9LUYNJP1P57/qhcuRInsTkGbAh1IjPnP2uDd2cCo8N+aJ6A
         ouYDoBmJAeY+IDpHMe0RKW+CeExbKABeRaPj9EJeG+9fcBDwKuen6fXlnMKyolChOBZf
         1lFT9z1BjAtclzjAR/1TbasLbsw3knrbdJAnjtYCOCozYd9GoSF1J5XM8n44nislwXUo
         /grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/pgm5Us2Yq+S8ZFCwq+NZ3vvwHGv8IPDUFxkuklnRI=;
        b=vO586JEFt6x/SGXiFuMT9uGDtUENiNVHFhR9gYCEDpOOb6fEZKUQ6C3F/NfARrU6UF
         czGWLzKCfWfn+qbLsWOWTXSCoSmQN7r/KRrCMrFbVbl8Xtt865U87Z2QnXde+nHhd+fk
         vdcNDLWAivuZRdN2YylbVw7cjmZmKLQyEWp5UyqGWmLL5Vdu4dRimPM8E49bhV1zADUq
         DxYYf1a1SZgMwu5J2QHT3wAC44y13V7TYQFp1qj4wAiz6ne5l0gfMwicxZ1FM2eu4Gou
         GjG0BnfKVMlRUuwy49ymCXsyNfpaFxth5g71NuEOPIGk1BkRMlYVwvtCAkoACeYeVIV4
         kG0A==
X-Gm-Message-State: ACrzQf0Ss9lFMtA1txYHm0YSBedn4TId+OrI7VdC9JE2L2qvTaL9I0y9
        Jtn8TwTVep4EUvIMhlYQiUk=
X-Google-Smtp-Source: AMsMyM5bGF6StyBpp8NpPd9/247LoutMgEcG5G5CZZUhSO4Y2W/hGMa7A01GnaI440gq5xwDPC8UzQ==
X-Received: by 2002:a05:6402:1f84:b0:455:27b8:27aa with SMTP id c4-20020a0564021f8400b0045527b827aamr41594489edc.243.1667682779543;
        Sat, 05 Nov 2022 14:12:59 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:12:59 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 06/13] HID: ft260: do not populate /dev/hidraw device
Date:   Sat,  5 Nov 2022 23:11:44 +0200
Message-Id: <20221105211151.7094-7-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221105211151.7094-1-michael.zaidman@gmail.com>
References: <20221105211151.7094-1-michael.zaidman@gmail.com>
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

