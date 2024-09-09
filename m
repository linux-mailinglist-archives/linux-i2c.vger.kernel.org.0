Return-Path: <linux-i2c+bounces-6372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9E970B1C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678CC281ECC
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7541CFBE;
	Mon,  9 Sep 2024 01:14:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F5628EF;
	Mon,  9 Sep 2024 01:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844470; cv=none; b=b1w6MgkWvH4FCgV/r8Fqi6kDeDHXrAG3Qdl2qhKFwC5TM0ikWUIFdXjFIXTtWlAXVoeZRUSOcjtGO23zcPaPSV/2XEgy/HJqgG6IdWQKmHVUAEgqMR14SwIYb2EJ0SWkHcxJwE+Fz1jNlJ+Y8ksAgngU+CLdCjlBq1tdKPAMR/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844470; c=relaxed/simple;
	bh=n/G9/HCtpxKVqJWE2xfY4dF56kXGKgNNGxG7Jq+LkWA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOn/X4sTaFo4vzCNmRJ1blWebe7OUpsAhpyJx7cuQv00HixP1h5u6AMVYaAaQzQCx+qwcnXsBxhf3eR5dYteMHt2721yh4T8HoqrxKEthc3R4nIzxXFxRhU4bp2awsp8cafmoSGjBOXyuDb/60oFSw95rczsSQlzBXCJRg5Leno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4X282F0CsRzpVVW;
	Mon,  9 Sep 2024 09:12:21 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id A0B2914037D;
	Mon,  9 Sep 2024 09:14:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:19 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 09/15] hwmon: Use devm_hid_hw_start_and_open in rog_ryujin_probe()
Date: Mon, 9 Sep 2024 09:23:07 +0800
Message-ID: <20240909012313.500341-10-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909012313.500341-1-lizetao1@huawei.com>
References: <20240909012313.500341-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Currently, the rog_ryujin module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the fail_and_close and fail_and_stop
lables, and directly return the error code when an error occurs.

Further optimization, use devm_hwmon_device_register_with_info to replace
hwmon_device_register_with_info, the remote operation can be completely
deleted, and the rog_ryujin_data structure no longer needs to hold
hwmon device.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2:
  1) Further optimize using devm_hwmon_device_register_with_info
and remove the .remove operation
  2) Adjust commit information
v1:
https://lore.kernel.org/all/20240904123607.3407364-14-lizetao1@huawei.com/

 drivers/hwmon/asus_rog_ryujin.c | 47 +++++----------------------------
 1 file changed, 7 insertions(+), 40 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index f8b20346a995..ef0d9b72a824 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -80,7 +80,6 @@ static const char *const rog_ryujin_speed_label[] = {
 
 struct rog_ryujin_data {
 	struct hid_device *hdev;
-	struct device *hwmon_dev;
 	/* For locking access to buffer */
 	struct mutex buffer_lock;
 	/* For queueing multiple readers */
@@ -497,6 +496,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct rog_ryujin_data *priv;
+	struct device *hwmon_dev;
 	int ret;
 
 	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -520,23 +520,13 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
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
 
 	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
-	if (!priv->buffer) {
-		ret = -ENOMEM;
-		goto fail_and_close;
-	}
+	if (!priv->buffer)
+		return -ENOMEM;
 
 	mutex_init(&priv->status_report_request_mutex);
 	mutex_init(&priv->buffer_lock);
@@ -548,31 +538,9 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 	init_completion(&priv->cooler_duty_set);
 	init_completion(&priv->controller_duty_set);
 
-	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "rog_ryujin",
+	hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "rog_ryujin",
 							  priv, &rog_ryujin_chip_info, NULL);
-	if (IS_ERR(priv->hwmon_dev)) {
-		ret = PTR_ERR(priv->hwmon_dev);
-		hid_err(hdev, "hwmon registration failed with %d\n", ret);
-		goto fail_and_close;
-	}
-
-	return 0;
-
-fail_and_close:
-	hid_hw_close(hdev);
-fail_and_stop:
-	hid_hw_stop(hdev);
-	return ret;
-}
-
-static void rog_ryujin_remove(struct hid_device *hdev)
-{
-	struct rog_ryujin_data *priv = hid_get_drvdata(hdev);
-
-	hwmon_device_unregister(priv->hwmon_dev);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
 static const struct hid_device_id rog_ryujin_table[] = {
@@ -586,7 +554,6 @@ static struct hid_driver rog_ryujin_driver = {
 	.name = "rog_ryujin",
 	.id_table = rog_ryujin_table,
 	.probe = rog_ryujin_probe,
-	.remove = rog_ryujin_remove,
 	.raw_event = rog_ryujin_raw_event,
 };
 
-- 
2.34.1


