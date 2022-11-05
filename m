Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F26D61DE76
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbiKEVOP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbiKEVN4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:13:56 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1292A11812;
        Sat,  5 Nov 2022 14:13:55 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id v17so12242450edc.8;
        Sat, 05 Nov 2022 14:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQsmdApmFfLSOhvFZKZk9s/wKfo/oplrqMZ6WuKFAxM=;
        b=qHV+i9ppycFF19PrlgqXEzYpHXjowxqFainZsFDues9Piz5mGJ5/JluCulEB4UnPLf
         a5hpPxochXoCZhpyJ3Y+Jp6QxJ30nxAa8Ff4HuE9yG0TxxtTXOYpd0toNTfxY/ZTzICM
         CX8YkCpwUUmETtgkqAKYvQzaGlAOA2Spp42GyvQPE+wPBUIqOTdu3ZGrHaBB7W6jXOVD
         7WOGs1BNuYSGAQ7gmz8nKomHFPHbQwf6iLXpxl0QbBzuAhx87PL4PdRzz/2eMty2s3fx
         P6pdCgvx58owxpVebpLboJ8UhFsrR5aNPKPVkFcCCvOGXwzwG7KFpsP14N2lJEulxn2g
         dOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQsmdApmFfLSOhvFZKZk9s/wKfo/oplrqMZ6WuKFAxM=;
        b=bi4xlFDbWzUwKlZBI3PIqeij6hZlPzw9xz3elkwjqtwT18DqKNRl05CvRY50/y++RN
         OyxIAxKlc//fXX7DglDI3YbJHNal6OVsm2ZdK1v2W0Y+ou85b+sB7I0oAo2CBX55kD99
         ZLOS0PiQXuixwSEwAfVGk6UsPm/eHPEisB12VGNbYwcQBce6GkpEfMZlabAPiaGgu5P6
         SgXSbBpjE0vaTmyxFCznxhKhQpNwZDnHebQPpkduDqsHpR6HmP7Bi7oKsIo6zcygZbqo
         G3xFijH0Da8mTSXLLOkE1jSdubaqXi1eL19NEts4HqVB4SSLfMW9HszjC3a6lT0CqDXP
         3v2g==
X-Gm-Message-State: ACrzQf3EPdJdiv4JvV7t4PmfdAic7rjvfz1uYkWgcc9Yam0WtnmpJkVq
        9cJdCtgzIj2jJaltRAn3CKc=
X-Google-Smtp-Source: AMsMyM4eXv50yEdjZrMsJ80HF6rYXQVEiu55y1+8Uv9nafkP3gIdol/r7Rc7zflN7yEE71WP5T6KlQ==
X-Received: by 2002:a05:6402:174f:b0:463:12ed:3f8f with SMTP id v15-20020a056402174f00b0046312ed3f8fmr40338429edx.67.1667682833558;
        Sat, 05 Nov 2022 14:13:53 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:13:53 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v4 13/13] HID: ft260: fix 'cast to restricted' kernel CI bot warnings
Date:   Sat,  5 Nov 2022 23:11:51 +0200
Message-Id: <20221105211151.7094-14-michael.zaidman@gmail.com>
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

Fix 'cast to restricted' sparse warnings reported by kernel test robot
in https://lore.kernel.org/all/202211021607.ssjymlKi-lkp@intel.com/

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index d5b092b85d7f..333341e80b0e 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -588,7 +588,7 @@ static int ft260_i2c_write_read(struct ft260_device *dev, struct i2c_msg *msgs)
 
 	if (ft260_debug) {
 		if (wr_len == 2)
-			read_off = be16_to_cpu(*(u16 *)msgs[0].buf);
+			read_off = be16_to_cpu(*(__be16 *)msgs[0].buf);
 		else
 			read_off = *msgs[0].buf;
 
@@ -830,7 +830,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 }
 
 static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
-			   u16 *field, u8 *buf)
+			   __le16 *field, u8 *buf)
 {
 	int ret;
 
@@ -859,9 +859,9 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 
 #define FT260_I2CST_ATTR_SHOW(name)					       \
 		FT260_ATTR_SHOW(name, ft260_get_i2c_status_report,	       \
-				FT260_I2C_STATUS, u16, ft260_word_show)
+				FT260_I2C_STATUS, __le16, ft260_word_show)
 
-#define FT260_ATTR_STORE(name, reptype, id, req, type, func)		       \
+#define FT260_ATTR_STORE(name, reptype, id, req, type, ctype, func)	       \
 	static ssize_t name##_store(struct device *kdev,		       \
 				    struct device_attribute *attr,	       \
 				    const char *buf, size_t count)	       \
@@ -871,7 +871,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 		type name;						       \
 		int ret;						       \
 									       \
-		if (!func(buf, 10, &name)) {				       \
+		if (!func(buf, 10, (ctype *)&name)) {			       \
 			rep.name = name;				       \
 			rep.report = id;				       \
 			rep.request = req;				       \
@@ -887,11 +887,11 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 
 #define FT260_BYTE_ATTR_STORE(name, reptype, req)			       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 u8, kstrtou8)
+				 u8, u8, kstrtou8)
 
 #define FT260_WORD_ATTR_STORE(name, reptype, req)			       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 u16, kstrtou16)
+				 __le16, u16, kstrtou16)
 
 FT260_SSTAT_ATTR_SHOW(chip_mode);
 static DEVICE_ATTR_RO(chip_mode);
-- 
2.34.1

