Return-Path: <linux-i2c+bounces-6371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3436970B19
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D31A1F216AF
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E1E1CD23;
	Mon,  9 Sep 2024 01:14:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B37BA42;
	Mon,  9 Sep 2024 01:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844470; cv=none; b=odq46zViiA021IlKx9bxBzWNlkSdavfzyjJEx1IqO0WWMWYG0jcgHU4XgYZYK/EUjOsQxjB48vY7WLOULfbixmhg2D+1f0k7q221JopWAeCF/DGC8wfJKm8yomRnmD68n9BQidgNHELdDpx1iGIdUPyafUwsekcAU6/s9QyTWFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844470; c=relaxed/simple;
	bh=/BSWCvgetkZdKoXmqL7il2Mnc8I2MOIUMx8gyU4OiwI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7Qa+1Sq8HUYbIvlxEheEIEerRI4rCKLO+1e6f+BDa6IEAMnDc9hG6B+VPLbDBHOOJMLAmKZyY/2HDIgsxK7TkiEqFpDHJxmY7xc+TgF/7bMZFwZShQ8cSY6xO+AIqrV7DH1YCpM7TdbRUa320JmfgcIDIPhlHhNz2L8uJdSKrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X280S5PFQz1HJ7d;
	Mon,  9 Sep 2024 09:10:48 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 461171400DC;
	Mon,  9 Sep 2024 09:14:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:20 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 10/15] hwmon: (corsair-cpro) Use devm_hid_hw_start_and_open in ccp_probe()
Date: Mon, 9 Sep 2024 09:23:08 +0800
Message-ID: <20240909012313.500341-11-lizetao1@huawei.com>
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

Currently, the corsair-cpro module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the out_hw_close and hid_hw_stop
lables, and directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Adjust commit information
v1:
https://lore.kernel.org/all/20240904123607.3407364-15-lizetao1@huawei.com/

 drivers/hwmon/corsair-cpro.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index e1a7f7aa7f80..7bba30840f32 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -601,14 +601,10 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		return ret;
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
 	if (ret)
 		return ret;
 
-	ret = hid_hw_open(hdev);
-	if (ret)
-		goto out_hw_stop;
-
 	ccp->hdev = hdev;
 	hid_set_drvdata(hdev, ccp);
 
@@ -621,28 +617,20 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	/* temp and fan connection status only updates when device is powered on */
 	ret = get_temp_cnct(ccp);
 	if (ret)
-		goto out_hw_close;
+		return ret;
 
 	ret = get_fan_cnct(ccp);
 	if (ret)
-		goto out_hw_close;
+		return ret;
 
 	ccp_debugfs_init(ccp);
 
 	ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
 							 ccp, &ccp_chip_info, NULL);
-	if (IS_ERR(ccp->hwmon_dev)) {
-		ret = PTR_ERR(ccp->hwmon_dev);
-		goto out_hw_close;
-	}
+	if (IS_ERR(ccp->hwmon_dev))
+		return PTR_ERR(ccp->hwmon_dev);
 
 	return 0;
-
-out_hw_close:
-	hid_hw_close(hdev);
-out_hw_stop:
-	hid_hw_stop(hdev);
-	return ret;
 }
 
 static void ccp_remove(struct hid_device *hdev)
@@ -651,8 +639,6 @@ static void ccp_remove(struct hid_device *hdev)
 
 	debugfs_remove_recursive(ccp->debugfs);
 	hwmon_device_unregister(ccp->hwmon_dev);
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static const struct hid_device_id ccp_devices[] = {
-- 
2.34.1


