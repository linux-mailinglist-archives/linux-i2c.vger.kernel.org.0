Return-Path: <linux-i2c+bounces-6496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9BC973C36
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A47CBB25DFE
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC4419E808;
	Tue, 10 Sep 2024 15:37:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D48199FD7;
	Tue, 10 Sep 2024 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982621; cv=none; b=nhkGec81OsVdjbPirkOKitIVZyuZDO7NbBGTOZFJpJ3KQ3qnjNC595Tk4OD5QIg7AACPPSLnGvRM3OUneLUROwmOLKjcdFD9nxXfoi24TdoisPD2WhUzib78umRw/8V0FdX4DaqHwhgHp9wHW/kMPTbCOHeJ6XH0/fkUIoC3YEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982621; c=relaxed/simple;
	bh=/3SfGZur229jt8c6RIivd+a0zOHoE6Aq9wRdyxlUDxw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h0XPs2XkH76wglZopfoDVzWonvUMNk7FMWUlWHI81Nq2xypSd7McX6Gwp4YkqXfKHU5lAgs5RUNoteIGQRR9KCzhbSQVjXhzzR8qgfAjbb4blqOCH90AyeD+wE1Wc7noowDW6I31pNzExqdaFgdiOnLWQ6cEoqA2SayLZ8XWWcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X378r6g4Hz1j8Ms;
	Tue, 10 Sep 2024 23:36:28 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 138A91A0190;
	Tue, 10 Sep 2024 23:36:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:36:44 +0800
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
Subject: [PATCH -next v3 10/15] hwmon: (corsair-cpro) Use devm_hid_hw_start_and_open in ccp_probe()
Date: Tue, 10 Sep 2024 23:45:40 +0800
Message-ID: <20240910154545.736786-11-lizetao1@huawei.com>
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

Currently, the corsair-cpro module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the out_hw_close and hid_hw_stop
lables, and directly return the error code when an error occurs.

Acked-by: Marius Zachmann <mail@mariuszachmann.de>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-11-lizetao1@huawei.com/
v1 -> v2: Adjust commit information
v1: https://lore.kernel.org/all/20240904123607.3407364-15-lizetao1@huawei.com/

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


