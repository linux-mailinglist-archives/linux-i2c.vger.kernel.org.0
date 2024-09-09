Return-Path: <linux-i2c+bounces-6362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC9970AFE
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08D1E1C21656
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA9C156E4;
	Mon,  9 Sep 2024 01:14:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B93CD53C;
	Mon,  9 Sep 2024 01:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844467; cv=none; b=qHx70+OMH/i9yLL5RPXAkZekS8pdVPXl1MckCmHn0X/vgEObjbBLwXKmgxWrltC6NaksTs3n2P0lvyM5MVeHgvvC+xgrIroi8aDx5cfHs5jlRoJR8/I3jKkUfsgtmRt9rmxtDzAY7i/P5D5oH7UnWX7YO3JNGSTwnr4DdGHNMyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844467; c=relaxed/simple;
	bh=7M/2yKo1rfbU6x1pgG+lP6625uQoKwCBnoBw5wnsFAQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuxI09wFDRtMarNGr0qy8P3mHgmRCqTh1rMRUKk6MEp4QRdCY+TATG12dTUKVBJq+O48BzZMI5eCO4pkMrePp+P0b2F2NYvVTClXaftUBkHpOQ5CdrCJ83ABiNOqUHuBxXv391hOoJ8t9ft3VODW+xItrZcTuDu2GzOerqAEJqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4X28292TGdzpVCX;
	Mon,  9 Sep 2024 09:12:17 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id E8EB3180AE8;
	Mon,  9 Sep 2024 09:14:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:16 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 03/15] HID: ft260: Use devm_hid_hw_start_and_open in ft260_probe()
Date: Mon, 9 Sep 2024 09:23:01 +0800
Message-ID: <20240909012313.500341-4-lizetao1@huawei.com>
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

Currently, the ft260 module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_hid_close, err_hid_stop
and err_i2c_free lables, and directly return the error code when an
error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Adjust commit information
v1: https://lore.kernel.org/all/20240904123607.3407364-4-lizetao1@huawei.com/

 drivers/hid/hid-ft260.c | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 333341e80b0e..272165ebf46c 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -976,23 +976,15 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, 0);
-	if (ret) {
-		hid_err(hdev, "failed to start HID HW\n");
+	ret = devm_hid_hw_start_and_open(hdev, 0);
+	if (ret)
 		return ret;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "failed to open HID HW\n");
-		goto err_hid_stop;
-	}
 
 	ret = ft260_hid_feature_report_get(hdev, FT260_CHIP_VERSION,
 					   (u8 *)&version, sizeof(version));
 	if (ret < 0) {
 		hid_err(hdev, "failed to retrieve chip version\n");
-		goto err_hid_close;
+		return ret;
 	}
 
 	hid_info(hdev, "chip code: %02x%02x %02x%02x\n",
@@ -1001,7 +993,7 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	ret = ft260_is_interface_enabled(hdev);
 	if (ret <= 0)
-		goto err_hid_close;
+		return ret;
 
 	hid_info(hdev, "USB HID v%x.%02x Device [%s] on %s\n",
 		hdev->version >> 8, hdev->version & 0xff, hdev->name,
@@ -1028,24 +1020,17 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	ret = i2c_add_adapter(&dev->adap);
 	if (ret) {
 		hid_err(hdev, "failed to add i2c adapter\n");
-		goto err_hid_close;
+		return ret;
 	}
 
 	ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
 	if (ret < 0) {
 		hid_err(hdev, "failed to create sysfs attrs\n");
-		goto err_i2c_free;
+		i2c_del_adapter(&dev->adap);
+		return ret;
 	}
 
 	return 0;
-
-err_i2c_free:
-	i2c_del_adapter(&dev->adap);
-err_hid_close:
-	hid_hw_close(hdev);
-err_hid_stop:
-	hid_hw_stop(hdev);
-	return ret;
 }
 
 static void ft260_remove(struct hid_device *hdev)
@@ -1057,9 +1042,6 @@ static void ft260_remove(struct hid_device *hdev)
 
 	sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
 	i2c_del_adapter(&dev->adap);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
-- 
2.34.1


