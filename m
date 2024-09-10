Return-Path: <linux-i2c+bounces-6500-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B487973C3D
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44FB8284EB3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982F719F47E;
	Tue, 10 Sep 2024 15:37:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701EF19A28B;
	Tue, 10 Sep 2024 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982622; cv=none; b=A0n2R04CvR6WN4d99FzcV+QNQdx6sENXOmvKHUQl4PAXrCtQgjsdP71kIl5gmu6u6eOwukZtsbHdW7h+9Dc2jnaOSchgqnR9ZLyjp1hXIyQACorZRYzDsztZJtZi6geqauLbxYbp3MF57FhDCtl56YUEAHJAyHlNMyE3KCiKoyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982622; c=relaxed/simple;
	bh=uc7u5wB4LeMQ5k5CzWuYbkW0/7xI8rraHHxJe0euFvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nO/Sy78z4dozMmgtj+ZnlSiPgpy6qPJPGtmImLr7z9T5cx/KfHkf3eMhNxY1jrJNM2COZk+qcWnNU6cXISxeNlIWzvAaT4SxO0uPx9RcaqFu5OXLNTNTD4HY6bhX5nCclCAmcAoUZkIgiojN63ULKpL9Sf4WIBt2gmV+QPzxkM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X378r5kzLz2Dc4j;
	Tue, 10 Sep 2024 23:36:28 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 20FE71A0191;
	Tue, 10 Sep 2024 23:36:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:36:45 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<djogorchock@gmail.com>, <rrameshbabu@nvidia.com>,
	<bonbons@linux-vserver.org>, <roderick.colenbrander@sony.com>,
	<david@readahead.eu>, <savicaleksa83@gmail.com>, <me@jackdoan.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <mail@mariuszachmann.de>,
	<wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v3 11/15] hwmon: (corsair-psu) Use devm_hid_hw_start_and_open in corsairpsu_probe()
Date: Tue, 10 Sep 2024 23:45:41 +0800
Message-ID: <20240910154545.736786-12-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910154545.736786-1-lizetao1@huawei.com>
References: <20240910154545.736786-1-lizetao1@huawei.com>
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

Currently, the corsair-psu module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the fail_and_close and fail_and_stop
lables, and directly return the error code when an error occurs.

Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-12-lizetao1@huawei.com/
v1 -> v2: Adjust commit information
v1: https://lore.kernel.org/all/20240904123607.3407364-15-lizetao1@huawei.com/

 drivers/hwmon/corsair-psu.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index f8f22b8a67cd..b574ec9cd00f 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -787,14 +787,10 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
 	if (ret)
 		return ret;
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
 	if (ret)
 		return ret;
 
-	ret = hid_hw_open(hdev);
-	if (ret)
-		goto fail_and_stop;
-
 	priv->hdev = hdev;
 	hid_set_drvdata(hdev, priv);
 	mutex_init(&priv->lock);
@@ -805,13 +801,13 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
 	ret = corsairpsu_init(priv);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "unable to initialize device (%d)\n", ret);
-		goto fail_and_stop;
+		return ret;
 	}
 
 	ret = corsairpsu_fwinfo(priv);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "unable to query firmware (%d)\n", ret);
-		goto fail_and_stop;
+		return ret;
 	}
 
 	corsairpsu_get_criticals(priv);
@@ -820,20 +816,12 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
 	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsairpsu", priv,
 							  &corsairpsu_chip_info, NULL);
 
-	if (IS_ERR(priv->hwmon_dev)) {
-		ret = PTR_ERR(priv->hwmon_dev);
-		goto fail_and_close;
-	}
+	if (IS_ERR(priv->hwmon_dev))
+		return PTR_ERR(priv->hwmon_dev);
 
 	corsairpsu_debugfs_init(priv);
 
 	return 0;
-
-fail_and_close:
-	hid_hw_close(hdev);
-fail_and_stop:
-	hid_hw_stop(hdev);
-	return ret;
 }
 
 static void corsairpsu_remove(struct hid_device *hdev)
@@ -842,8 +830,6 @@ static void corsairpsu_remove(struct hid_device *hdev)
 
 	debugfs_remove_recursive(priv->debugfs);
 	hwmon_device_unregister(priv->hwmon_dev);
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static int corsairpsu_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data,
-- 
2.34.1


