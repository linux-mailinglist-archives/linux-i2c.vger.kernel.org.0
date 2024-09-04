Return-Path: <linux-i2c+bounces-6155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7A96BC27
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8CD1F26313
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841211D88C3;
	Wed,  4 Sep 2024 12:27:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C7E1D88BA;
	Wed,  4 Sep 2024 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452861; cv=none; b=U7rT9+yUoos731R9HxcJ2vCjTO8QKlG1Nxo85r/P/qBAkTQaKL6shsMvZUB9pKKXunrXxunJJ9BKtQlFX5nv5LSyJ1y8mrA4LirEbQeRyNBGLu77AD6LM5hwG91e+2wlR/jIAVvPNCkGXwPgcr7EGC2jbk7+ogPQSJJknHJOzE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452861; c=relaxed/simple;
	bh=E3o8zEbsfPn2OZAlNXSQVO1TSutcP7KycrZf12Ki+pY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CfD9//xvdCivDEeOw7mHUXkHevqHnmkNVHLKBh1JT/wi3LCo7suAdGfQeyJYdhmWVIeNWl/8PRFgTupsGvyiy30LxHvGKdI9v6wzhAEommln0pA17khVN7GrsH67A43lpaTGbIqNI22RmmQHlY3O+ARGubhBFbH1zth2+w50Hjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WzMFH0mn7z1S9lF;
	Wed,  4 Sep 2024 20:27:15 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B939180044;
	Wed,  4 Sep 2024 20:27:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:35 +0800
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
Subject: [PATCH -next 09/19] HID: playstation: Use devm_hid_hw_start_and_open in ps_probe()
Date: Wed, 4 Sep 2024 20:35:57 +0800
Message-ID: <20240904123607.3407364-10-lizetao1@huawei.com>
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

Currently, the playstation module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_close and err_stop lables, and
directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hid/hid-playstation.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 0d90d7ee693c..6dddb9451a37 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -2704,41 +2704,25 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
-	if (ret) {
-		hid_err(hdev, "Failed to start HID device\n");
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
+	if (ret)
 		return ret;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "Failed to open HID device\n");
-		goto err_stop;
-	}
 
 	if (id->driver_data == PS_TYPE_PS4_DUALSHOCK4) {
 		dev = dualshock4_create(hdev);
 		if (IS_ERR(dev)) {
 			hid_err(hdev, "Failed to create dualshock4.\n");
-			ret = PTR_ERR(dev);
-			goto err_close;
+			return PTR_ERR(dev);
 		}
 	} else if (id->driver_data == PS_TYPE_PS5_DUALSENSE) {
 		dev = dualsense_create(hdev);
 		if (IS_ERR(dev)) {
 			hid_err(hdev, "Failed to create dualsense.\n");
-			ret = PTR_ERR(dev);
-			goto err_close;
+			return PTR_ERR(dev);
 		}
 	}
 
 	return ret;
-
-err_close:
-	hid_hw_close(hdev);
-err_stop:
-	hid_hw_stop(hdev);
-	return ret;
 }
 
 static void ps_remove(struct hid_device *hdev)
@@ -2750,9 +2734,6 @@ static void ps_remove(struct hid_device *hdev)
 
 	if (dev->remove)
 		dev->remove(dev);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static const struct hid_device_id ps_devices[] = {
-- 
2.34.1


