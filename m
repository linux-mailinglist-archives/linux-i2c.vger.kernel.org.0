Return-Path: <linux-i2c+bounces-6152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2B196BC2E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 374FDB22EC3
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877E51D9345;
	Wed,  4 Sep 2024 12:27:39 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84411D88AF;
	Wed,  4 Sep 2024 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452859; cv=none; b=MTGg8RqgNGwK1sZT+EFm9u7mVWI9bIR7G0Y2aYrXMhMdMX9I96jgQXNM74Jv6SvLCJ+fWjInY0z7iqGWVTEzChmYDVpVYzhK3KMLwP1YUBOxIi8iuUNRF4ZsvkBzhS3t9Qb5ngZkzUoGdQuxJtJgZRSdlvQpmVwVtQK7qTTatYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452859; c=relaxed/simple;
	bh=vQvPqAP0diQOLRiYXQiwLcyt/I7kkEFal1101rSZJoM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OnA3AZynhCLyGouqSN+1zUcwfNV0kOA6OkCc01VEps+L0dsBCwNT5vhdUZKNxk8YqTlyHuGDAGF6COmdFdKdZdlSoQ/Z2WHrm3Sd3XC6TSJXULvNKZOCVtgk4nQVo8C1VDTgCj1s+iHhxkbsxtKJcBQA5HYeiwPhYDb3ZDHU/iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WzMCV540qzpSwV;
	Wed,  4 Sep 2024 20:25:42 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 711DD1400CA;
	Wed,  4 Sep 2024 20:27:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:34 +0800
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
Subject: [PATCH -next 08/19] HID: hid-picolcd: Use devm_hid_hw_start_and_open in picolcd_probe()
Date: Wed, 4 Sep 2024 20:35:56 +0800
Message-ID: <20240904123607.3407364-9-lizetao1@huawei.com>
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

Currently, the hid-picolcd module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_cleanup_hid_ll and
err_cleanup_hid_hw lables.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hid/hid-picolcd_core.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
index 297103be3381..973822d1b2db 100644
--- a/drivers/hid/hid-picolcd_core.c
+++ b/drivers/hid/hid-picolcd_core.c
@@ -551,23 +551,15 @@ static int picolcd_probe(struct hid_device *hdev,
 		goto err_cleanup_data;
 	}
 
-	error = hid_hw_start(hdev, 0);
+	error = devm_hid_hw_start_and_open(hdev, 0);
 	if (error) {
-		hid_err(hdev, "hardware start failed\n");
+		hid_err(hdev, "hardware start and open failed\n");
 		goto err_cleanup_data;
 	}
 
-	error = hid_hw_open(hdev);
-	if (error) {
-		hid_err(hdev, "failed to open input interrupt pipe for key and IR events\n");
-		goto err_cleanup_hid_hw;
-	}
-
 	error = device_create_file(&hdev->dev, &dev_attr_operation_mode_delay);
-	if (error) {
-		hid_err(hdev, "failed to create sysfs attributes\n");
-		goto err_cleanup_hid_ll;
-	}
+	if (error)
+		goto err_cleanup_data;
 
 	error = device_create_file(&hdev->dev, &dev_attr_operation_mode);
 	if (error) {
@@ -589,10 +581,6 @@ static int picolcd_probe(struct hid_device *hdev,
 	device_remove_file(&hdev->dev, &dev_attr_operation_mode);
 err_cleanup_sysfs1:
 	device_remove_file(&hdev->dev, &dev_attr_operation_mode_delay);
-err_cleanup_hid_ll:
-	hid_hw_close(hdev);
-err_cleanup_hid_hw:
-	hid_hw_stop(hdev);
 err_cleanup_data:
 	kfree(data);
 	return error;
@@ -611,8 +599,6 @@ static void picolcd_remove(struct hid_device *hdev)
 	picolcd_exit_devfs(data);
 	device_remove_file(&hdev->dev, &dev_attr_operation_mode);
 	device_remove_file(&hdev->dev, &dev_attr_operation_mode_delay);
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 
 	/* Shortcut potential pending reply that will never arrive */
 	spin_lock_irqsave(&data->lock, flags);
-- 
2.34.1


