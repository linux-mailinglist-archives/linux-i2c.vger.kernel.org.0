Return-Path: <linux-i2c+bounces-6498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6A973C38
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1F41283600
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928BF19EEB4;
	Tue, 10 Sep 2024 15:37:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3819AA75;
	Tue, 10 Sep 2024 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982621; cv=none; b=QjHV3qPzQyzuUF4n2Ahhd4ZcmokdXRqp3Ht9U3srI5+sso/Q3DemmC/E+8ISWej/MgAiQOWzMKs4oOohXKUV4U45pmR+5OoIcoWaRtaWJhRF8brT40gwtGudE/pnxXq7es3/8PiJXhP4mvmLy2AWQ+8h0iYhcs1r/68EICJdims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982621; c=relaxed/simple;
	bh=fPodBcRmooQc412mo89NDHrao5EJWLAEnyMWs+S2xpE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkBV3r59Lfnijmbrad2fJglvLJlqDIBB5AXSL9iUII4Kqql4UrZglOxiOyGqvC6NYTtr4169jjZXjr8kxB3r05lP1DhRMAm6KUPbAdyOzITJt09qXmxv9YOZUTY4K5DnrFBaNyiIhP7Rxou1dk18uUcBSansKCGn6BaAsuXG6yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X378s0DjHz2Dc4l;
	Tue, 10 Sep 2024 23:36:29 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 57FB31A0188;
	Tue, 10 Sep 2024 23:36:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:36:47 +0800
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
Subject: [PATCH -next v3 15/15] hwmon: (nzxt-smart2) Use devm_hid_hw_start_and_open in nzxt_smart2_hid_probe()
Date: Tue, 10 Sep 2024 23:45:45 +0800
Message-ID: <20240910154545.736786-16-lizetao1@huawei.com>
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

Currently, the nzxt-smart2 module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the out_hw_close and out_hw_stop
lables, and directly return the error code when an error occurs.

Further optimization, use devm_hwmon_device_register_with_info to replace
hwmon_device_register_with_info, the remote operation can be completely
deleted, and the drvdata no longer needs to hold hwmon device

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-16-lizetao1@huawei.com/
v1 -> v2:
  1) Further optimize using devm_hwmon_device_register_with_info
and remove the .remove operation
  2) Adjust commit information
v1: https://lore.kernel.org/all/20240904123607.3407364-20-lizetao1@huawei.com/

 drivers/hwmon/nzxt-smart2.c | 38 +++++--------------------------------
 1 file changed, 5 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index df6fa72a6b59..9c6d020ac896 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -172,7 +172,6 @@ struct set_fan_speed_report {
 
 struct drvdata {
 	struct hid_device *hid;
-	struct device *hwmon;
 
 	u8 fan_duty_percent[FAN_CHANNELS];
 	u16 fan_rpm[FAN_CHANNELS];
@@ -730,6 +729,7 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
 				 const struct hid_device_id *id)
 {
 	struct drvdata *drvdata;
+	struct device *hwmon;
 	int ret;
 
 	drvdata = devm_kzalloc(&hdev->dev, sizeof(struct drvdata), GFP_KERNEL);
@@ -750,44 +750,17 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
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
 	hid_device_io_start(hdev);
 
 	init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
 
-	drvdata->hwmon =
-		hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", drvdata,
-						&nzxt_smart2_chip_info, NULL);
-	if (IS_ERR(drvdata->hwmon)) {
-		ret = PTR_ERR(drvdata->hwmon);
-		goto out_hw_close;
-	}
-
-	return 0;
-
-out_hw_close:
-	hid_hw_close(hdev);
-
-out_hw_stop:
-	hid_hw_stop(hdev);
-	return ret;
-}
-
-static void nzxt_smart2_hid_remove(struct hid_device *hdev)
-{
-	struct drvdata *drvdata = hid_get_drvdata(hdev);
-
-	hwmon_device_unregister(drvdata->hwmon);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
+	hwmon = devm_hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", drvdata,
+						     &nzxt_smart2_chip_info, NULL);
+	return PTR_ERR_OR_ZERO(hwmon);
 }
 
 static const struct hid_device_id nzxt_smart2_hid_id_table[] = {
@@ -807,7 +780,6 @@ static struct hid_driver nzxt_smart2_hid_driver = {
 	.name = "nzxt-smart2",
 	.id_table = nzxt_smart2_hid_id_table,
 	.probe = nzxt_smart2_hid_probe,
-	.remove = nzxt_smart2_hid_remove,
 	.raw_event = nzxt_smart2_hid_raw_event,
 #ifdef CONFIG_PM
 	.reset_resume = nzxt_smart2_hid_reset_resume,
-- 
2.34.1


