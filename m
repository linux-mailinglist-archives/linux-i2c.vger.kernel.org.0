Return-Path: <linux-i2c+bounces-6158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3218496BC31
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64B5F1C22014
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCD91D9D79;
	Wed,  4 Sep 2024 12:27:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF71CCB5B;
	Wed,  4 Sep 2024 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452862; cv=none; b=EIwpPPuWJPRb1DaAvcccnPN4KVeeRpoIGpBcds6jb0atKhD8vFMY3ev/M35CgrD4EJpvBvNYqXXigpkKEIVP2YV1BZN81WwFUG4OnTykZfmroL6dRP6WQp6HmzuLPL2HuTkUpMiyZQXZiRc+ecwlX39sAQNYhlLIxXjAN7X8OiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452862; c=relaxed/simple;
	bh=fzDTCsOysi/HRBMpnsZlWv2bxJKyX9SBKLugh+3TEZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xh7+xog2IkiUg4STRIdMbMaEoDqyGhIWwEJLPyGD/WwzatpmyqBkShqa7tW+f2EkAIMvdgaBpmIgYVI2fUyiXAtMbmlb4oH6qKnf1r0P4tJkMiQU1aMpjBUba80ycaTVATZuCZcr2OhZi4c6riTj33wDqYnyL9SirY9UAHiPkyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WzMF04drYzyRRV;
	Wed,  4 Sep 2024 20:27:00 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id BD0A81400CA;
	Wed,  4 Sep 2024 20:27:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:37 +0800
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
Subject: [PATCH -next 13/19] hwmon: Use devm_hid_hw_start_and_open in rog_ryujin_probe()
Date: Wed, 4 Sep 2024 20:36:01 +0800
Message-ID: <20240904123607.3407364-14-lizetao1@huawei.com>
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

Currently, the rog_ryujin module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the fail_and_close and fail_and_stop
lables, and directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index f8b20346a995..da03ba3b4e0f 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
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
@@ -553,16 +543,10 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 	if (IS_ERR(priv->hwmon_dev)) {
 		ret = PTR_ERR(priv->hwmon_dev);
 		hid_err(hdev, "hwmon registration failed with %d\n", ret);
-		goto fail_and_close;
+		return ret;
 	}
 
 	return 0;
-
-fail_and_close:
-	hid_hw_close(hdev);
-fail_and_stop:
-	hid_hw_stop(hdev);
-	return ret;
 }
 
 static void rog_ryujin_remove(struct hid_device *hdev)
@@ -570,9 +554,6 @@ static void rog_ryujin_remove(struct hid_device *hdev)
 	struct rog_ryujin_data *priv = hid_get_drvdata(hdev);
 
 	hwmon_device_unregister(priv->hwmon_dev);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static const struct hid_device_id rog_ryujin_table[] = {
-- 
2.34.1


