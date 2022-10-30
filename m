Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1F6612CB9
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiJ3Uem (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiJ3Uej (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:39 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F623A1BB;
        Sun, 30 Oct 2022 13:34:38 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so9723699wms.0;
        Sun, 30 Oct 2022 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47oIaMFA8Eg3AOKmQgHp46WYx0yoJU5i2kodk4hvPko=;
        b=pilNXscJ9s6usj1pxwynivWIPr7JfKzl/Alrws79R1/YB/vgCLZeb4Y+8htmPlCFiu
         TR5nOrZEkYU7BcYZoFS6azjAatYPaCfR55USMKczXC+0WLEMxpavLnVLlPjI3UWTbdDH
         z4wXhmeqGmZjWHezIZllQ1WTNlbaYwUgQWEWqeGsxGlFvzy9rOoD+HHaUOTulGDBH9fN
         vc5RlkYwfK5F8cXrKpvvAG+tugabhbQBJln2SY2j29hNz+IM8OrGELmGxVGTOR3muba2
         AmbWITELFnQJc3KB4FXfjvuXs0SQLAtZM9UeBtsV/rpnDmmGQt/GDkjzNrstD2Wn59i3
         hl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47oIaMFA8Eg3AOKmQgHp46WYx0yoJU5i2kodk4hvPko=;
        b=uHs3YonakTc2F6PsSeU9+Kv3lzFMf35MHdwbsbEnk4onRbxluPFYukbk2H4mNAQuUr
         6oMZaJsWA8Bd9vIShN4L/V8uydjqZfUzTS9R7JH5JY/CI56NDg013QkWEH/1X47u/vYl
         WzvHYhfE71Z3EXq/15otbWh5yefvBcfqkUuEf9HWCpv+rx60DS1mGqS64Kqw8ARAFMq1
         MbFBO5X7pR5llzFghfdbHrFSW9GkCJP7ANUJm9I+qu/7GVkhIThV4YjuVA2K1vLRsHKy
         Q+CxglPuToFcYM4Ck3O02PLLKm/x+TThnevy9ejiyNXv/sbIDh1fYBjD8DhLO97FPLIC
         0FVA==
X-Gm-Message-State: ACrzQf3WqBxiouWYHnpdaUi5gBCuZaz4mYQCTzkasUQByVwOZ8CHeZJ+
        bN4XFMd3LC1gYDtoHS9obBo=
X-Google-Smtp-Source: AMsMyM7xVKy+uRshU7d09XCHKwJzC+eXYxWtE3kvvr/8W6rVgCYH9A/DBRZVkcdxIr6qvZ45rXNcWQ==
X-Received: by 2002:a05:600c:44d5:b0:3cf:6749:afe3 with SMTP id f21-20020a05600c44d500b003cf6749afe3mr4916090wmo.90.1667162076777;
        Sun, 30 Oct 2022 13:34:36 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:36 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3 07/12] HID: ft260: skip unexpected HID input reports
Date:   Sun, 30 Oct 2022 22:33:58 +0200
Message-Id: <20221030203403.4637-8-michael.zaidman@gmail.com>
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

The FT260 is not supposed to generate unexpected HID reports. However,
in theory, the unsolicited HID Input reports can be issued by a specially
crafted malicious USB device masquerading as FT260 when the attacker has
physical access to the USB port. In this case, the read_buf pointer points
to the final data portion of the previous I2C Read transfer, and the memcpy
invoked in the ft260_raw_event() will try copying the content of the
unexpected report into the wrong location.

This commit sets the Read buffer pointer to NULL on the I2C Read
transaction completion and checks it in the ft260_raw_event() to detect
and skip the unsolicited Input report.

Reported-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 8d6d2a19b9ed..8b6ebc5228eb 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -464,7 +464,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			  u16 len, u8 flag)
 {
 	u16 rd_len;
-	int timeout, ret;
+	int timeout, ret = 0;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
 
@@ -480,10 +480,6 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			rd_len = FT260_RD_DATA_MAX;
 		}
 
-		dev->read_idx = 0;
-		dev->read_buf = data;
-		dev->read_len = rd_len;
-
 		rep.report = FT260_I2C_READ_REQ;
 		rep.length = cpu_to_le16(rd_len);
 		rep.address = addr;
@@ -494,22 +490,30 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 
 		reinit_completion(&dev->wait);
 
+		dev->read_idx = 0;
+		dev->read_buf = data;
+		dev->read_len = rd_len;
+
 		ret = ft260_hid_output_report(hdev, (u8 *)&rep, sizeof(rep));
 		if (ret < 0) {
 			hid_err(hdev, "%s: failed with %d\n", __func__, ret);
-			return ret;
+			goto ft260_i2c_read_exit;
 		}
 
 		timeout = msecs_to_jiffies(5000);
 		if (!wait_for_completion_timeout(&dev->wait, timeout)) {
+			ret = -ETIMEDOUT;
 			ft260_i2c_reset(hdev);
-			return -ETIMEDOUT;
+			goto ft260_i2c_read_exit;
 		}
 
+		dev->read_buf = NULL;
+
 		ret = ft260_xfer_status(dev);
 		if (ret < 0) {
+			ret = -EIO;
 			ft260_i2c_reset(hdev);
-			return -EIO;
+			goto ft260_i2c_read_exit;
 		}
 
 		len -= rd_len;
@@ -518,7 +522,9 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 
 	} while (len > 0);
 
-	return 0;
+ft260_i2c_read_exit:
+	dev->read_buf = NULL;
+	return ret;
 }
 
 /*
@@ -1036,6 +1042,13 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
 		ft260_dbg("i2c resp: rep %#02x len %d\n", xfer->report,
 			  xfer->length);
 
+		if ((dev->read_buf == NULL) ||
+		    (xfer->length > dev->read_len - dev->read_idx)) {
+			hid_err(hdev, "unexpected report %#02x, length %d\n",
+				xfer->report, xfer->length);
+			return -1;
+		}
+
 		memcpy(&dev->read_buf[dev->read_idx], &xfer->data,
 		       xfer->length);
 		dev->read_idx += xfer->length;
@@ -1044,10 +1057,9 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
 			complete(&dev->wait);
 
 	} else {
-		hid_err(hdev, "unknown report: %#02x\n", xfer->report);
-		return 0;
+		hid_err(hdev, "unhandled report %#02x\n", xfer->report);
 	}
-	return 1;
+	return 0;
 }
 
 static struct hid_driver ft260_driver = {
-- 
2.34.1

