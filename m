Return-Path: <linux-i2c+bounces-6501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A6973C44
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7091BB25EB6
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E4819FA77;
	Tue, 10 Sep 2024 15:37:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8642019A292;
	Tue, 10 Sep 2024 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982622; cv=none; b=NCquK9PxdTV5HI001ybz/LJa9C54erLDjiq/RIfZqonPT9ShYuIh2sPoUt48X5UJekPeEjOj4WETPIQe2pGGLWE398ipD0UYp5HOq5uFgN9L3KIRlq/m6X3jOnF3SkYmnVE/mxvgpc2hq/o5nS45Pmf9XKZQ24Mz0tOAuWK2ZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982622; c=relaxed/simple;
	bh=/FicOUxbRNycXt+JjadIdZ2FfSxJ3eNpgCU/5da5OTo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXhBl0yJi5xivyzO8XeOBT2yrymL7T4euwyjbdhTg/uYGMQwNw7et/puNOE1AeOzrb7Q0O0jjeMT/7UkN3pW0toH4LNFipd76LUiCw89AOf3hAwQ91pp+cZbclz/e1IWZZKl4R13WHQ8IETG+QnLVyEqQabPXjOpnht7Pr64onA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X378r6XKJz2Dc4k;
	Tue, 10 Sep 2024 23:36:28 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C4A71A0190;
	Tue, 10 Sep 2024 23:36:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:36:46 +0800
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
Subject: [PATCH -next v3 13/15] hwmon: (nzxt-kraken2) Use devm_hid_hw_start_and_open in kraken2_probe()
Date: Tue, 10 Sep 2024 23:45:43 +0800
Message-ID: <20240910154545.736786-14-lizetao1@huawei.com>
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

Currently, the nzxt-kraken2 module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the fail_and_close and fail_and_stop
lables, and directly return the error code when an error occurs.

Further optimization, use devm_hwmon_device_register_with_info to replace
hwmon_device_register_with_info, the remote operation can be completely
deleted, and the kraken2_priv_data no longer needs to hold hwmon device.

Acked-by: Jonas Malaco <jonas@protocubo.io>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-14-lizetao1@huawei.com/
v1 -> v2:
  1) Further optimize using devm_hwmon_device_register_with_info
and remove the .remove operation
  2) Adjust commit information
v1: https://lore.kernel.org/all/20240904123607.3407364-18-lizetao1@huawei.com/

drivers/hwmon/nzxt-kraken2.c | 45 ++++++------------------------------
 1 file changed, 7 insertions(+), 38 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
index 7caf387eb144..5b618fc2c17f 100644
--- a/drivers/hwmon/nzxt-kraken2.c
+++ b/drivers/hwmon/nzxt-kraken2.c
@@ -29,7 +29,6 @@ static const char *const kraken2_fan_label[] = {
 
 struct kraken2_priv_data {
 	struct hid_device *hid_dev;
-	struct device *hwmon_dev;
 	s32 temp_input[1];
 	u16 fan_input[2];
 	unsigned long updated; /* jiffies */
@@ -133,6 +132,7 @@ static int kraken2_probe(struct hid_device *hdev,
 			 const struct hid_device_id *id)
 {
 	struct kraken2_priv_data *priv;
+	struct device *hwmon_dev;
 	int ret;
 
 	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -158,44 +158,14 @@ static int kraken2_probe(struct hid_device *hdev,
 	/*
 	 * Enable hidraw so existing user-space tools can continue to work.
 	 */
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
-
-	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "kraken2",
-							  priv, &kraken2_chip_info,
-							  NULL);
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
-static void kraken2_remove(struct hid_device *hdev)
-{
-	struct kraken2_priv_data *priv = hid_get_drvdata(hdev);
-
-	hwmon_device_unregister(priv->hwmon_dev);
 
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
+	hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "kraken2",
+							 priv, &kraken2_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
 static const struct hid_device_id kraken2_table[] = {
@@ -209,7 +179,6 @@ static struct hid_driver kraken2_driver = {
 	.name = "nzxt-kraken2",
 	.id_table = kraken2_table,
 	.probe = kraken2_probe,
-	.remove = kraken2_remove,
 	.raw_event = kraken2_raw_event,
 };
 
-- 
2.34.1


