Return-Path: <linux-i2c+bounces-6156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E360F96BC2B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F3062848CB
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D541D9D65;
	Wed,  4 Sep 2024 12:27:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FD91D934A;
	Wed,  4 Sep 2024 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452862; cv=none; b=FWNecOcLK4/OxpbSJPKMMjhl1mzmmp9F9xpklx+XVOpbwom4mrt1m50FN6jdMpTwBIKtpXVsxPEVOuERsBFfoh4ML90fwu20eUQjzuFYBRqPej3GRk4J1BeGKbtenbJ6L8ZhTa6qPpc5WL3uSnNMi0qQcZDscDZQMqnvELiCbw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452862; c=relaxed/simple;
	bh=Mt25IMtsKBHe3bcD5PB6r/GfTzzV6IPilXtjCw35K74=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mW2LJmyxPbIBp4NXSE63CMAX/YP2OGluo9rAXc+cK4YEd6cF5H++lvDue+y8tx4z5F4hgM4n6eRDP5lWwUQeiaWQHQBXK+oiym6IH2PPYlUSL5caEqwf7USe79pvr6KUHOfECW2U2qu1LLNoMzQdNPYvb24uRZ/LYbZ8jzTSbj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WzM9j6CVBz1HJ9c;
	Wed,  4 Sep 2024 20:24:09 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 67EDA1402CC;
	Wed,  4 Sep 2024 20:27:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:36 +0800
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
Subject: [PATCH -next 11/19] HID: wiimote: Use devm_hid_hw_start_and_open in wiimote_hid_probe()
Date: Wed, 4 Sep 2024 20:35:59 +0800
Message-ID: <20240904123607.3407364-12-lizetao1@huawei.com>
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

Currently, the wiimote module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_close and err_stop lables.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hid/hid-wiimote-core.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 26167cfb696f..28cd9ccbb617 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -1780,8 +1780,6 @@ static void wiimote_destroy(struct wiimote_data *wdata)
 	wiimote_ext_unload(wdata);
 	wiimote_modules_unload(wdata);
 	cancel_work_sync(&wdata->queue.worker);
-	hid_hw_close(wdata->hdev);
-	hid_hw_stop(wdata->hdev);
 
 	kfree(wdata);
 }
@@ -1806,22 +1804,14 @@ static int wiimote_hid_probe(struct hid_device *hdev,
 		goto err;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
-	if (ret) {
-		hid_err(hdev, "HW start failed\n");
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
+	if (ret)
 		goto err;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "cannot start hardware I/O\n");
-		goto err_stop;
-	}
 
 	ret = device_create_file(&hdev->dev, &dev_attr_extension);
 	if (ret) {
 		hid_err(hdev, "cannot create sysfs attribute\n");
-		goto err_close;
+		goto err;
 	}
 
 	ret = device_create_file(&hdev->dev, &dev_attr_devtype);
@@ -1847,10 +1837,6 @@ static int wiimote_hid_probe(struct hid_device *hdev,
 
 err_ext:
 	device_remove_file(&wdata->hdev->dev, &dev_attr_extension);
-err_close:
-	hid_hw_close(hdev);
-err_stop:
-	hid_hw_stop(hdev);
 err:
 	input_free_device(wdata->ir);
 	input_free_device(wdata->accel);
-- 
2.34.1


