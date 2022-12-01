Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59AF463E848
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Dec 2022 04:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiLADUb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Nov 2022 22:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiLADUa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Nov 2022 22:20:30 -0500
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7397B4F9;
        Wed, 30 Nov 2022 19:20:29 -0800 (PST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxct.zte.com.cn (FangMail) with ESMTPS id 4NN1Y74tYQz4y0w3;
        Thu,  1 Dec 2022 11:20:27 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
        by mse-fl2.zte.com.cn with SMTP id 2B13KI4r071679;
        Thu, 1 Dec 2022 11:20:18 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
        by mapi (Zmail) with MAPI id mid31;
        Thu, 1 Dec 2022 11:20:19 +0800 (CST)
Date:   Thu, 1 Dec 2022 11:20:19 +0800 (CST)
X-Zmail-TransId: 2af963881d73ffffffffcdc58ecd
X-Mailer: Zmail v1.0
Message-ID: <202212011120195859736@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <jikos@kernel.org>
Cc:     <benjamin.tissoires@redhat.com>, <michael.zaidman@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYzXSBISUQ6IHVzZSBzeXNmc19lbWl0KCkgdG8gaW5zdGVhZCBvZiBzY25wcmludGYoKQ==?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2B13KI4r071679
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.13.novalocal with ID 63881D7B.001 by FangMail milter!
X-FangMail-Envelope: 1669864827/4NN1Y74tYQz4y0w3/63881D7B.001/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63881D7B.001/4NN1Y74tYQz4y0w3
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with sysfs_emit() to simplify the code.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
v2 -> v3
Fix the mistakes in v2.
 drivers/hid/hid-core.c           | 2 +-
 drivers/hid/hid-cp2112.c         | 2 +-
 drivers/hid/hid-ft260.c          | 4 ++--
 drivers/hid/hid-gt683r.c         | 2 +-
 drivers/hid/hid-lg4ff.c          | 6 +++---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 drivers/hid/wacom_sys.c          | 4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)

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
diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index e3fcf1353fb3..07f3cf175060 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -956,7 +956,7 @@ static ssize_t lg4ff_combine_show(struct device *dev, struct device_attribute *a
 		return 0;
 	}

-	count = scnprintf(buf, PAGE_SIZE, "%u\n", entry->wdata.combine);
+	count = sysfs_emit(buf, "%u\n", entry->wdata.combine);
 	return count;
 }

@@ -1009,7 +1009,7 @@ static ssize_t lg4ff_range_show(struct device *dev, struct device_attribute *att
 		return 0;
 	}

-	count = scnprintf(buf, PAGE_SIZE, "%u\n", entry->wdata.range);
+	count = sysfs_emit(buf, "%u\n", entry->wdata.range);
 	return count;
 }

@@ -1073,7 +1073,7 @@ static ssize_t lg4ff_real_id_show(struct device *dev, struct device_attribute *a
 		return 0;
 	}

-	count = scnprintf(buf, PAGE_SIZE, "%s: %s\n", entry->wdata.real_tag, entry->wdata.real_name);
+	count = sysfs_emit(buf, "%s: %s\n", entry->wdata.real_tag, entry->wdata.real_name);
 	return count;
 }

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 9afbc68bf063..38ba30f72c8c 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2506,7 +2506,7 @@ static ssize_t hidpp_ff_range_show(struct device *dev, struct device_attribute *
 	struct input_dev *idev = hidinput->input;
 	struct hidpp_ff_private_data *data = idev->ff->private;

-	return scnprintf(buf, PAGE_SIZE, "%u\n", data->range);
+	return sysfs_emit(buf, "%u\n", data->range);
 }

 static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 634263e4556b..00556a045e51 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1058,7 +1058,7 @@ static ssize_t wacom_led##SET_ID##_select_show(struct device *dev,	\
 {									\
 	struct hid_device *hdev = to_hid_device(dev);\
 	struct wacom *wacom = hid_get_drvdata(hdev);			\
-	return scnprintf(buf, PAGE_SIZE, "%d\n",			\
+	return sysfs_emit(buf, "%d\n",			\
 			 wacom->led.groups[SET_ID].select);		\
 }									\
 static DEVICE_ATTR(status_led##SET_ID##_select, DEV_ATTR_RW_PERM,	\
@@ -1102,7 +1102,7 @@ static ssize_t wacom_##name##_luminance_show(struct device *dev,	\
 	struct device_attribute *attr, char *buf)			\
 {									\
 	struct wacom *wacom = dev_get_drvdata(dev);			\
-	return scnprintf(buf, PAGE_SIZE, "%d\n", wacom->led.field);	\
+	return sysfs_emit(buf, "%d\n", wacom->led.field);	\
 }									\
 static DEVICE_ATTR(name##_luminance, DEV_ATTR_RW_PERM,			\
 		   wacom_##name##_luminance_show,			\
-- 
2.25.1
