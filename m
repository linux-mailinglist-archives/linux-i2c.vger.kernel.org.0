Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F32663E823
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Dec 2022 04:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiLADDJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Nov 2022 22:03:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiLADDI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Nov 2022 22:03:08 -0500
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B901C165BF;
        Wed, 30 Nov 2022 19:03:07 -0800 (PST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NN1962Zzdz8QrkZ;
        Thu,  1 Dec 2022 11:03:06 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
        by mse-fl1.zte.com.cn with SMTP id 2B132vl0040902;
        Thu, 1 Dec 2022 11:02:57 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
        by mapi (Zmail) with MAPI id mid31;
        Thu, 1 Dec 2022 11:02:58 +0800 (CST)
Date:   Thu, 1 Dec 2022 11:02:58 +0800 (CST)
X-Zmail-TransId: 2af9638819624952e6b0
X-Mailer: Zmail v1.0
Message-ID: <202212011102587309217@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <jikos@kernel.org>
Cc:     <benjamin.tissoires@redhat.com>, <michael.zaidman@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBISUQ6IHVzZSBzeXNmc19lbWl0KCkgdG8gaW5zdGVhZCBvZiBzY25wcmludGYoKQ==?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 2B132vl0040902
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID 6388196A.001 by FangMail milter!
X-FangMail-Envelope: 1669863786/4NN1962Zzdz8QrkZ/6388196A.001/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6388196A.001/4NN1962Zzdz8QrkZ
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with sysfs_emit() to simplify the code.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/hid/hid-core.c   | 2 +-
 drivers/hid/hid-cp2112.c | 2 +-
 drivers/hid/hid-ft260.c  | 4 ++--
 drivers/hid/hid-gt683r.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b973df3b825d..ae1ecb21121a 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2658,7 +2658,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *a,
 {
 	struct hid_device *hdev = container_of(dev, struct hid_device, dev);

-	return scnprintf(buf, PAGE_SIZE, "hid:b%04Xg%04Xv%08Xp%08X\n",
+	return sysfs_emit(buf, "hid:b%04Xg%04Xv%08Xp%08X\n",
 			 hdev->bus, hdev->group, hdev->vendor, hdev->product);
 }
 static DEVICE_ATTR_RO(modalias);
diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 1e16b0fa310d..810e3b4b1728 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -895,7 +895,7 @@ static ssize_t name##_show(struct device *kdev, \
 	int ret = cp2112_get_usb_config(hdev, &cfg); \
 	if (ret) \
 		return ret; \
-	return scnprintf(buf, PAGE_SIZE, format, ##__VA_ARGS__); \
+	return sysfs_emit(buf, format, ##__VA_ARGS__); \
 } \
 static DEVICE_ATTR_RW(name);

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 333341e80b0e..8677bea46bea 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -826,7 +826,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret < 0)
 		return ret;

-	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
+	return sysfs_emit(buf, "%d\n", *field);
 }

 static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
@@ -838,7 +838,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret < 0)
 		return ret;

-	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
+	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
 }

 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
diff --git a/drivers/hid/hid-gt683r.c b/drivers/hid/hid-gt683r.c
index 29ccb0accfba..fa453de406b9 100644
--- a/drivers/hid/hid-gt683r.c
+++ b/drivers/hid/hid-gt683r.c
@@ -90,7 +90,7 @@ static ssize_t mode_show(struct device *dev,
 	else
 		sysfs_mode = 2;

-	return scnprintf(buf, PAGE_SIZE, "%u\n", sysfs_mode);
+	return sysfs_emit(buf, "%u\n", sysfs_mode);
 }

 static ssize_t mode_store(struct device *dev,
-- 
2.25.1
