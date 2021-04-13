Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E7435E26C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 17:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241568AbhDMPNn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 11:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbhDMPNj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 11:13:39 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930C3C061574;
        Tue, 13 Apr 2021 08:13:18 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id m9so4100725wrx.3;
        Tue, 13 Apr 2021 08:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4sP12tnsOwGTJCFaEX43sowTzklNoHKRBUZavTEpfg=;
        b=ZUc+ltzIGqeQuA1Kx8FE8BD9ga+OEu3LKRXVh4dPguVbh5xfSL/VPT+8Q0Op4cb8LU
         HKTLh672yB4Kj1g9OY2t4EHfWDUwvP+Ki0DkaFPm6ai0Z2TbBLF5/bgR+vp6fzSppwdK
         QQj15PBxpuoKRXnwO+YXn5losSmxyHnTHhopqfow6yCQKm7aeu98VAdjAKVST9ZF5yDt
         lUryWm7oWWJUykKMNwRr/UD4/CAUlQXZPXmKawiOBGXiVdv/KiRGA3T3/sYbC1w+JE04
         xyKhF3/CnS8ZkbsYAvazdc9ZDv+fQlVHIBmi0QZBhJMbKF6DVU7IRs/H6kDwlLPz6kaZ
         5gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4sP12tnsOwGTJCFaEX43sowTzklNoHKRBUZavTEpfg=;
        b=ZwVgPj134ecmSTz88rP+gPPXDzYB9597nYiU0HJivyUhv5NK4cp38KxTpcOOhq8+eE
         5OnXNGaFLZn2jJZ6I/QDmvGm417l/ZRSsfNm5zZY6lawHM70C6A4kffWv4ItLF/46b1U
         moUlCULY71M4fYa5q94+4eG3kaq8PD9R8ROSCSLs96roc3dymxnaT1YJ1CQetRK1NHgn
         3Mht4pkk42HxqDRj546b1NPZWsdlcmkRqUrmhGB+98UvVpLYWAMj98SXk5qNqRwGhUbO
         gooAPxrvAJDOSirB1I67Bu6Ptb/B4ZSiQGkl/fyfhVF1k3Vse09P83ZRqMXroBHoTn/r
         9+TQ==
X-Gm-Message-State: AOAM531Kyu1jU7dMHyCLY/p3OYQQP3SU36GkIMsOcHCXve7CCMMBhnti
        e72iST6lRG+d0UbjhrrrT/Y=
X-Google-Smtp-Source: ABdhPJzyk79kJ+3Bb3VIsZiJhoNXnQkwDC5S+7VweCcMC95vG7M22OfoOTZ7JNOSCvvT9O6pyYL9Uw==
X-Received: by 2002:adf:8b45:: with SMTP id v5mr37006272wra.398.1618326797381;
        Tue, 13 Apr 2021 08:13:17 -0700 (PDT)
Received: from michael-VirtualBox.xsight.ent (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.googlemail.com with ESMTPSA id l4sm18214808wrx.24.2021.04.13.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:13:16 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     dan.carpenter@oracle.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, wsa@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH] HID: ft260: check data size in ft260_smbus_write()
Date:   Tue, 13 Apr 2021 18:12:00 +0300
Message-Id: <20210413151200.2174-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes: 98189a0adfa0 ("HID: ft260: add usb hid to i2c host bridge driver")

The SMbus block transaction limits the number of bytes transferred to 32,
but nothing prevents a user from specifying via ioctl a larger data size
than the ft260 can handle in a single transfer.

i2cdev_ioctl_smbus()
   --> i2c_smbus_xfer
       --> __i2c_smbus_xfer
           --> ft260_smbus_xfer
               --> ft260_smbus_write

This patch adds data size checking in the ft260_smbus_write().

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/hid-ft260.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 047aa85a7c83..080623b3abbe 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -201,7 +201,7 @@ struct ft260_i2c_write_request_report {
 	u8 address;		/* 7-bit I2C address */
 	u8 flag;		/* I2C transaction condition */
 	u8 length;		/* data payload length */
-	u8 data[60];		/* data payload */
+	u8 data[FT260_WR_DATA_MAX]; /* data payload */
 } __packed;
 
 struct ft260_i2c_read_request_report {
@@ -429,6 +429,9 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->write_buf;
 
+	if (data_len >= sizeof(rep->data))
+		return -EINVAL;
+
 	rep->address = addr;
 	rep->data[0] = cmd;
 	rep->length = data_len + 1;
-- 
2.25.1

