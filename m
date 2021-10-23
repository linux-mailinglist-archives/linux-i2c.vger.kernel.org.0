Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CAC438509
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Oct 2021 21:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhJWTmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Oct 2021 15:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhJWTmf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Oct 2021 15:42:35 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B822C061714;
        Sat, 23 Oct 2021 12:40:16 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id e4so4447308wrc.7;
        Sat, 23 Oct 2021 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A3KVoR5VSHHkrHGCqMl/F8tYM2CNewEq3KA7fS+tHEs=;
        b=nxtPFyaBnD4bRbBsko6odkWPmRb4njZZx3zkSCMyOYj/vi0Lm/+CjtIi6QQ65aDm0P
         5A0kD7HOYJ67JVwUwRVUnHCU5O5/7wzOE4vKVckmXlHQrVB9N8jUPSbihEJpMlt6TKie
         1vynE5QKap0sO+7tcsddiLnnOFGESteOygjLtfUqIB2oWqMR89i+PRoj/cSjwN0HvLAV
         HV1ABCRqf/k9zSixQXV4YYhqW8zECWnsvDK+QPbtK6cbdYpvajKe1+9NUZ/YP3LjGcIW
         B66qmYUbM0JE9fN9iymoZFXwqBN81TifgPC6sP/CYtIhUkwv8tM9iy2K52l2Hbp4Cz1Y
         vkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A3KVoR5VSHHkrHGCqMl/F8tYM2CNewEq3KA7fS+tHEs=;
        b=NN4IqPDHXsw/a834C1QSIUPXSnYeiw0GKaS1hC7IC61suQx/eyv+kgHRzYZV8D7OR7
         oE2TO1d3IBnY2fNiggQfXjTAW9ynwJgxvCvPM2ZAEjMGNizF1JYzidf+a1e9DkpfuQ2J
         r1gi4Lr3z1whKyaO46rvXjEmzqg5ClgFS+tyNEMXK8oNypfiPRUYXCC2sqQDs+aosKJV
         ZaQlL5ELA/i39ZUzA49YRT+g2FVuVeE8Pb2AjY89sucShhoPQJ+s7F0D+8GpA0m7wOYn
         V+MFMtD7mBc1F/7kRs2BWuSizojz5Q3wB0JJfLa5J883J0WNLdvESSGX4v68ZWLmrvDS
         YQlg==
X-Gm-Message-State: AOAM5302tnYYBcPjwxkDe1tfHFw9+XQwGuEOJZCIwc2JKNTomNuvkXYT
        jM8LO8LAn8wkltEE1cXDxwrGPVucwCZR+Pvo
X-Google-Smtp-Source: ABdhPJyBCJBdstMK5rfd5IUmSqatZv6RyleLNOcZHn5IN9MMa5wfzt1QBsgvS1We+qVNMkijdeN4Ag==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr9709958wrz.280.1635018014611;
        Sat, 23 Oct 2021 12:40:14 -0700 (PDT)
Received: from localhost.localdomain (93-172-12-63.bb.netvision.net.il. [93.172.12.63])
        by smtp.googlemail.com with ESMTPSA id l2sm15129726wmi.1.2021.10.23.12.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 12:40:13 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, aaron.jones@ftdichip.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Germain Hebert <germain.hebert@ca.abb.com>
Subject: [PATCH v1] HID: ft260: fix i2c probing for hwmon devices
Date:   Sat, 23 Oct 2021 22:39:57 +0300
Message-Id: <20211023193957.5002-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The below scenario causes the kernel NULL pointer dereference failure:
1. sudo insmod hid-ft260.ko
2. sudo modprobe lm75
3. unplug USB hid-ft260
4. plug USB hid-ft260

[  +0.000006] Call Trace:
[  +0.000004]  __i2c_smbus_xfer.part.0+0xd1/0x310
[  +0.000007]  ? ft260_smbus_write+0x140/0x140 [hid_ft260]
[  +0.000005]  __i2c_smbus_xfer+0x2b/0x80
[  +0.000004]  i2c_smbus_xfer+0x61/0xf0
[  +0.000005]  i2c_default_probe+0xf9/0x130
[  +0.000004]  i2c_detect_address+0x84/0x160
[  +0.000004]  ? kmem_cache_alloc_trace+0xf6/0x200
[  +0.000009]  ? i2c_detect.isra.0+0x69/0x130
[  +0.000005]  i2c_detect.isra.0+0xbf/0x130
[  +0.000004]  ? __process_new_driver+0x30/0x30
[  +0.000004]  __process_new_adapter+0x18/0x20
[  +0.000004]  bus_for_each_drv+0x84/0xd0
[  +0.000003]  i2c_register_adapter+0x1e4/0x400
[  +0.000005]  i2c_add_adapter+0x5c/0x80
[  +0.000004]  ft260_probe.cold+0x222/0x2e2 [hid_ft260]
[  +0.000006]  hid_device_probe+0x10e/0x170 [hid]
[  +0.000009]  really_probe+0xff/0x460
[  +0.000004]  driver_probe_device+0xe9/0x160
[  +0.000003]  __device_attach_driver+0x71/0xd0
[  +0.000004]  ? driver_allows_async_probing+0x50/0x50
[  +0.000004]  bus_for_each_drv+0x84/0xd0
[  +0.000002]  __device_attach+0xde/0x1e0
[  +0.000004]  device_initial_probe+0x13/0x20
[  +0.000004]  bus_probe_device+0x8f/0xa0
[  +0.000003]  device_add+0x333/0x5f0

It happened when i2c core probed for the devices associated with the lm75
driver by invoking 2c_detect()-->..-->ft260_smbus_write() from within the
ft260_probe before setting the adapter data with i2c_set_adapdata().

Moving the i2c_set_adapdata() before i2c_add_adapter() fixed the failure.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Signed-off-by: Germain Hebert <germain.hebert@ca.abb.com>
---
 drivers/hid/hid-ft260.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 4ef1c3b8094e..8ee77f4afe9f 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -966,24 +966,23 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	mutex_init(&dev->lock);
 	init_completion(&dev->wait);
 
+	ret = ft260_xfer_status(dev);
+	if (ret)
+		ft260_i2c_reset(hdev);
+
+	i2c_set_adapdata(&dev->adap, dev);
 	ret = i2c_add_adapter(&dev->adap);
 	if (ret) {
 		hid_err(hdev, "failed to add i2c adapter\n");
 		goto err_hid_close;
 	}
 
-	i2c_set_adapdata(&dev->adap, dev);
-
 	ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
 	if (ret < 0) {
 		hid_err(hdev, "failed to create sysfs attrs\n");
 		goto err_i2c_free;
 	}
 
-	ret = ft260_xfer_status(dev);
-	if (ret)
-		ft260_i2c_reset(hdev);
-
 	return 0;
 
 err_i2c_free:
-- 
2.25.1

