Return-Path: <linux-i2c+bounces-6163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153396BC3E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4FD81C220DC
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A8E1DA0E9;
	Wed,  4 Sep 2024 12:27:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3D1D935E;
	Wed,  4 Sep 2024 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452865; cv=none; b=kPFJvh9KeYgMfCBmqeUMPMIi4TbhfZjI+WqiITUoiDh3UlsHXyx1k7lGapnthtZ6pP2SVFtcO7blzcXV+2er7VWGfYTtX2qkKrvvKXqBvehW5sIwcNryFWfhLwser9VkUwNEIJXkUVbQLY6omNCRdPdLhMGPV8G+nb6faLbqve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452865; c=relaxed/simple;
	bh=uw4j/zlyC5vrAadl/KXV1Qt0z1isEAELIAL+OodPpws=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LKxjJHiIrbDX6yeLraXuvJ9CJadG0kEd8xoANv3lB1y8pyoHLfykABCJeWm3o7QvxEt96bV8Q2m+Dxhe8xLicpyhZGI0kDnDn7SKIll3MfQBVYRVlM9vivL1RJ3vhWPYkLCJJ5w4HtNVoud8YTj6pokOJ6Y4fR+8cDoMt9Jxh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WzM843VH9z69WC;
	Wed,  4 Sep 2024 20:22:44 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 1193714011A;
	Wed,  4 Sep 2024 20:27:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:41 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>, <rrameshbabu@nvidia.com>,
	<bonbons@linux-vserver.org>, <roderick.colenbrander@sony.com>,
	<david@readahead.eu>, <savicaleksa83@gmail.com>, <me@jackdoan.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <mail@mariuszachmann.de>,
	<wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next 18/19] hwmon: (nzxt-kraken3) Use devm_hid_hw_start_and_open in kraken3_probe()
Date: Wed, 4 Sep 2024 20:36:06 +0800
Message-ID: <20240904123607.3407364-19-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904123607.3407364-1-lizetao1@huawei.com>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Currently, the nzxt-kraken2 module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the fail_and_close and fail_and_stop
lables, and directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hwmon/nzxt-kraken3.c | 34 +++++++---------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
index 00f3ac90a290..71b8c21cfe1b 100644
--- a/drivers/hwmon/nzxt-kraken3.c
+++ b/drivers/hwmon/nzxt-kraken3.c
@@ -897,17 +897,9 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 	}
 
 	/* Enable hidraw so existing user-space tools can continue to work */
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
-	if (ret) {
-		hid_err(hdev, "hid hw start failed with %d\n", ret);
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
+	if (ret)
 		return ret;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "hid hw open failed with %d\n", ret);
-		goto fail_and_stop;
-	}
 
 	switch (hdev->product) {
 	case USB_PRODUCT_ID_X53:
@@ -928,15 +920,12 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 		device_name = "kraken2023elite";
 		break;
 	default:
-		ret = -ENODEV;
-		goto fail_and_close;
+		return -ENODEV;
 	}
 
 	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
-	if (!priv->buffer) {
-		ret = -ENOMEM;
-		goto fail_and_close;
-	}
+	if (!priv->buffer)
+		return -ENOMEM;
 
 	mutex_init(&priv->buffer_lock);
 	mutex_init(&priv->z53_status_request_lock);
@@ -948,7 +937,7 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 	ret = kraken3_init_device(hdev);
 	if (ret < 0) {
 		hid_err(hdev, "device init failed with %d\n", ret);
-		goto fail_and_close;
+		return ret;
 	}
 
 	ret = kraken3_get_fw_ver(hdev);
@@ -960,18 +949,12 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 	if (IS_ERR(priv->hwmon_dev)) {
 		ret = PTR_ERR(priv->hwmon_dev);
 		hid_err(hdev, "hwmon registration failed with %d\n", ret);
-		goto fail_and_close;
+		return ret;
 	}
 
 	kraken3_debugfs_init(priv, device_name);
 
 	return 0;
-
-fail_and_close:
-	hid_hw_close(hdev);
-fail_and_stop:
-	hid_hw_stop(hdev);
-	return ret;
 }
 
 static void kraken3_remove(struct hid_device *hdev)
@@ -980,9 +963,6 @@ static void kraken3_remove(struct hid_device *hdev)
 
 	debugfs_remove_recursive(priv->debugfs);
 	hwmon_device_unregister(priv->hwmon_dev);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static const struct hid_device_id kraken3_table[] = {
-- 
2.34.1


