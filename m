Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12908612CCB
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiJ3UfU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiJ3UfJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:35:09 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FFE7B7D1;
        Sun, 30 Oct 2022 13:34:44 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so9723798wms.0;
        Sun, 30 Oct 2022 13:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/70yde/ER3LkJXc+fZGhAb/0UY1KoaXhbuLb7z7ORbE=;
        b=RNgslzFLXcYc/7qkNDCxsyGq6dFUmnXok01RYIzUOiVlZFkGHXhuoYC9umrs8QLFDe
         tf9jXn1lXQD4tOIqOxBm1aNFzBDHKLf48HO0khZHJ1q3dI2WqW8QDXNEIsheehVuYbGM
         yiLiNnxtOYDg1HeM+mz0iq15zgCOpDsr1sQzuD09u0n+2vOWFabwZgYnT2UchWKGTXSY
         HQYR2eTHx9Z4UtxUKhcni2+4rSG3M937Wo3KER5/qNf+ZVImtopt8SLsMz0ciU4nh8mp
         7Ja4+FkXEVOqrQBOh6kByn7eU4eCsgp8ZXGkRfOG0xmt00Zl5obPsXWTpCzVE/VeDGIA
         ZPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/70yde/ER3LkJXc+fZGhAb/0UY1KoaXhbuLb7z7ORbE=;
        b=dnrWsmV0+7YTUfolftMf9IjkHFkEn1XO7iqWdypv2PNC8gBPbXKJ1t7u7CviarvxDN
         k/uZkll2RGqNR+A3dDYFHjJsGbd0YFrgnxzDzO+oAE1tfcKjzrC7tB0RE5/G8yYyy+bD
         GDQHWyxmYle1HxDEnlp/uoyPmhG7lkSxb2HGfsY+S++/6nq7rgIs9gaDRBKhuEPI7Zw3
         ybRlCglM3T+QNVVOk5tUKxDlAaEMJkg3fhXJnyC3zCuo1McAK7oRIzfMj8ykobuslkBU
         svT/Lp8SH+WPOWjhq4+fAwo8GznyQVoYYoRxqgG/Bq+3iC/x4p0zFDDnkIZSeCB5Ho+e
         p5eg==
X-Gm-Message-State: ACrzQf1/CuGbqY77SgIkeTiB41m8sBWgbxW8U3ccCkHyfYBitXV+07vH
        apNgytJ+qaLkDU8z6b45RCs=
X-Google-Smtp-Source: AMsMyM5doZuOSQ1JQWji6UVhz7Su2MPqADODQ2pHsNUYyaap8MSi3d2lE9RG8kdSHQhOWICZaC+8bA==
X-Received: by 2002:a1c:f008:0:b0:3b4:fd2e:3ede with SMTP id a8-20020a1cf008000000b003b4fd2e3edemr16281717wmb.133.1667162083882;
        Sun, 30 Oct 2022 13:34:43 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:43 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3 12/12] HID: ft260: missed NACK from busy device
Date:   Sun, 30 Oct 2022 22:34:03 +0200
Message-Id: <20221030203403.4637-13-michael.zaidman@gmail.com>
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

When writing into a slow device like an EEPROM chip, the
controller may exit the busy state before the device releases
the bus. In this case, the ft260_xfer_status returns success
before the data transfer completion.

The patch fixes it by returning from the ft260_xfer_status()
with the "-EAGAIN" on both controller and bus busy status when
appropriate.

It does not apply to the i2c combined transactions when after
the write IO, the controller keeps the bus busy until the read
IO and then between reading IOs to ensure an atomic operation.

Co-developed-by: Germain Hebert <germain.hebert@ca.abb.com>
Signed-off-by: Germain Hebert <germain.hebert@ca.abb.com>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index b3f715f6ea86..da8ea0d16059 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -303,7 +303,7 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	return ret;
 }
 
-static int ft260_xfer_status(struct ft260_device *dev)
+static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 {
 	struct hid_device *hdev = dev->hdev;
 	struct ft260_get_i2c_status_report report;
@@ -320,7 +320,7 @@ static int ft260_xfer_status(struct ft260_device *dev)
 	ft260_dbg("bus_status %#02x, clock %u\n", report.bus_status,
 		  dev->clock);
 
-	if (report.bus_status & FT260_I2C_STATUS_CTRL_BUSY)
+	if (report.bus_status & (FT260_I2C_STATUS_CTRL_BUSY | bus_busy))
 		return -EAGAIN;
 
 	/*
@@ -355,8 +355,11 @@ static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
 static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 						u8 *data, int len)
 {
+	u8 bus_busy;
 	int ret, usec, try = 100;
 	struct hid_device *hdev = dev->hdev;
+	struct ft260_i2c_write_request_report *rep =
+		(struct ft260_i2c_write_request_report *)data;
 
 	ret = ft260_hid_output_report(hdev, data, len);
 	if (ret < 0) {
@@ -374,8 +377,18 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 		ft260_dbg("wait %d usec, len %d\n", usec, len);
 	}
 
+	/*
+	 * Do not check the busy bit for combined transactions
+	 * since the controller keeps the bus busy between writing
+	 * and reading IOs to ensure an atomic operation.
+	 */
+	if (rep->flag == FT260_FLAG_START)
+		bus_busy = 0;
+	else
+		bus_busy = FT260_I2C_STATUS_BUS_BUSY;
+
 	do {
-		ret = ft260_xfer_status(dev);
+		ret = ft260_xfer_status(dev, bus_busy);
 		if (ret != -EAGAIN)
 			break;
 	} while (--try);
@@ -399,7 +412,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 		return -EINVAL;
 
 	if (time_is_before_jiffies(dev->need_wakeup_at)) {
-		(void)ft260_xfer_status(dev);
+		(void)ft260_xfer_status(dev, 0);
 		ft260_dbg("device wakeup");
 	}
 
@@ -453,7 +466,7 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 		return -EINVAL;
 
 	if (time_is_before_jiffies(dev->need_wakeup_at)) {
-		(void)ft260_xfer_status(dev);
+		(void)ft260_xfer_status(dev, 0);
 		ft260_dbg("device wakeup");
 	}
 
@@ -484,6 +497,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 	int timeout, ret = 0;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
+	u8 bus_busy = 0;
 
 	if ((flag & FT260_FLAG_START_REPEATED) == FT260_FLAG_START_REPEATED)
 		flag = FT260_FLAG_START_REPEATED;
@@ -527,7 +541,10 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 
 		dev->read_buf = NULL;
 
-		ret = ft260_xfer_status(dev);
+		if (flag & FT260_FLAG_STOP)
+			bus_busy = FT260_I2C_STATUS_BUS_BUSY;
+
+		ret = ft260_xfer_status(dev, bus_busy);
 		if (ret < 0) {
 			ret = -EIO;
 			ft260_i2c_reset(hdev);
@@ -1003,7 +1020,7 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	mutex_init(&dev->lock);
 	init_completion(&dev->wait);
 
-	ret = ft260_xfer_status(dev);
+	ret = ft260_xfer_status(dev, FT260_I2C_STATUS_BUS_BUSY);
 	if (ret)
 		ft260_i2c_reset(hdev);
 
-- 
2.34.1

