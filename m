Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1E8612CC7
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiJ3UfK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiJ3Ueo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:44 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88071B859;
        Sun, 30 Oct 2022 13:34:42 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id b20-20020a05600c4e1400b003cc28585e2fso6976331wmq.1;
        Sun, 30 Oct 2022 13:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8YVAuzbfJpfqbUz/i1mMiECgUpENTS2gXYifLvndPY=;
        b=nhZFx0fMnfBA/bYVNDsfLk8FSEqSmIDg+n823lgrWpAmbTaSEC4F2iW/D4zWZQ4cBB
         joKT8ZzRTMfAqtMlmpVMeuuW3hcmsqDyJ0+e5K2APeJUAoRiw3ieYSmX3dn2iIspWc9/
         umu+Om46pcrN7htlWomI/QaDG2IQEWIeDS1OX4ga+VJfiLKyPwHjjndr3hNZNSFUtkMd
         PRt32YmYunYO+eeXwP6F7zRlJmgXLVbbWdGfm90C03XG+VbptCMy3FshpkiGpCjLxTDQ
         z935YYys9fPzc1eCSM8syAw+dyknAs7eUJPv2blHPaPwlAG7E3IjJifUte2/PVr6RdZh
         +eLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8YVAuzbfJpfqbUz/i1mMiECgUpENTS2gXYifLvndPY=;
        b=PXzqhSY09TfoGTOBQv6qcq580Cp2ErqLCPypWRiwWs+AwHBmasL4lpaG/1bTsVmHM0
         wRia+kLu7sTkslRQ/s3imYZ7eD7ua3UV7RQrr3NJzzrBOQaCAB4TV1r+gt+M3Lw1xRZ5
         p4lewvfPMLxwkcWlCKSmGczi8ApTbQ0i4yGrv8HdNmbFukIG31nSpDUoYod3yhyTYJOy
         PkXRy1jhDxAUReI30noUwnibyzypQnXvsdPmluntjr5XinZpT9JawvQWun0hkSL6oPCb
         pJ93yBRhcmHMakzFzS2lVA9QFxCWgKBxsbzBqb/44zH1OyxQ2f34Q466xHPwmzj1UMTS
         fV+A==
X-Gm-Message-State: ACrzQf3J0Qu1pwV5e6g3E/230fr/Q+9J3UIF3GAmb2rYqT0CBq23CDI3
        PLaYAI3to6HfuHfCVVG/tBQ=
X-Google-Smtp-Source: AMsMyM6cbf1clV5GonDt1YvNrWhuvr0GfPS8r3IcnhhFD6UhpNUDYyg3Zbp4uXql0tRSFZ81SMOZag==
X-Received: by 2002:a05:600c:4ed2:b0:3c6:c1ff:222 with SMTP id g18-20020a05600c4ed200b003c6c1ff0222mr5769621wmq.163.1667162081112;
        Sun, 30 Oct 2022 13:34:41 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:40 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3 10/12] HID: ft260: wake up device from power saving mode
Date:   Sun, 30 Oct 2022 22:34:01 +0200
Message-Id: <20221030203403.4637-11-michael.zaidman@gmail.com>
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

The FT260 can enter a power saving mode after being idle for longer than
5 seconds.

When being woken up from power saving mode by an I2C write request, it
looks like a possible NACK will not be correctly reported back. As a
workaround, the driver will request an I2C status report before starting
the next I2C transfer if the FT260 has been idle for longer than 4800ms.

Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 40fae81386e3..00cbe7693ba0 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -31,6 +31,8 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 #define FT260_REPORT_MAX_LENGTH (64)
 #define FT260_I2C_DATA_REPORT_ID(len) (FT260_I2C_REPORT_MIN + (len - 1) / 4)
 
+#define FT260_WAKEUP_NEEDED_AFTER_MS (4800) /* 5s minus 200ms margin */
+
 /*
  * The ft260 input report format defines 62 bytes for the data payload, but
  * when requested 62 bytes, the controller returns 60 and 2 in separate input
@@ -237,6 +239,7 @@ struct ft260_device {
 	struct completion wait;
 	struct mutex lock;
 	u8 write_buf[FT260_REPORT_MAX_LENGTH];
+	unsigned long need_wakeup_at;
 	u8 *read_buf;
 	u16 read_idx;
 	u16 read_len;
@@ -392,6 +395,12 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->write_buf;
 
+
+	if (time_is_before_jiffies(dev->need_wakeup_at)) {
+		(void)ft260_xfer_status(dev);
+		ft260_dbg("device wakeup");
+	}
+
 	rep->flag = FT260_FLAG_START;
 
 	do {
@@ -441,6 +450,11 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 	if (data_len >= sizeof(rep->data))
 		return -EINVAL;
 
+	if (time_is_before_jiffies(dev->need_wakeup_at)) {
+		(void)ft260_xfer_status(dev);
+		ft260_dbg("device wakeup");
+	}
+
 	rep->address = addr;
 	rep->data[0] = cmd;
 	rep->length = data_len + 1;
@@ -607,6 +621,8 @@ static int ft260_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
 
 	ret = num;
 i2c_exit:
+	dev->need_wakeup_at =
+		jiffies + msecs_to_jiffies(FT260_WAKEUP_NEEDED_AFTER_MS);
 	hid_hw_power(hdev, PM_HINT_NORMAL);
 	mutex_unlock(&dev->lock);
 	return ret;
@@ -707,6 +723,8 @@ static int ft260_smbus_xfer(struct i2c_adapter *adapter, u16 addr, u16 flags,
 	}
 
 smbus_exit:
+	dev->need_wakeup_at =
+		jiffies + msecs_to_jiffies(FT260_WAKEUP_NEEDED_AFTER_MS);
 	hid_hw_power(hdev, PM_HINT_NORMAL);
 	mutex_unlock(&dev->lock);
 	return ret;
-- 
2.34.1

