Return-Path: <linux-i2c+bounces-6162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358CB96BC47
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72117B2381E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCE41DA0E1;
	Wed,  4 Sep 2024 12:27:44 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B9C1CCB5B;
	Wed,  4 Sep 2024 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452864; cv=none; b=tlInGZ7uqyLCyFleeyu7efA0HIYL9BOh5x08lpE+ym+M4nkTTKApw1aPUSDPpx4qwFt+HHveKUW8pm+Q4kiJAeBbU6x9q+YNAqQM+VkaSyqE0VKbhjy0eHfluAA3G5LBrFmEj4YvmrwycxRDgj6jfZX5+m51lSwe+NFzJdhiZ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452864; c=relaxed/simple;
	bh=7eFiUlPXZy+z3uiHQspc8FCh+JdGKLbcFBD2h2oakkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihNKTo8lb6EEE7bhYHxq53HAqilW/5n36VK1bc0Nd7B68McVjSAoZOyAyoTisz8+0wOTZ5BF/COLJndszOxiy5cd8Y0MDi3ThrsZODk7gD++hD8gKG1vFZ+KTvBSv0vRUoo3UGYUBQ4GK+5aU1j10i/GbdybNhkIefKmGfX97Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WzMDg4lZCzyR5g;
	Wed,  4 Sep 2024 20:26:43 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 6BB5C1800FE;
	Wed,  4 Sep 2024 20:27:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:40 +0800
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
Subject: [PATCH -next 17/19] hwmon: (nzxt-kraken2) Use devm_hid_hw_start_and_open in kraken2_probe()
Date: Wed, 4 Sep 2024 20:36:05 +0800
Message-ID: <20240904123607.3407364-18-lizetao1@huawei.com>
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

Currently, the nzxt-kraken2 module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the fail_and_close and fail_and_stop
lables, and directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hwmon/nzxt-kraken2.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
index 7caf387eb144..aaaf857b42ed 100644
--- a/drivers/hwmon/nzxt-kraken2.c
+++ b/drivers/hwmon/nzxt-kraken2.c
@@ -158,17 +158,9 @@ static int kraken2_probe(struct hid_device *hdev,
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
 
 	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "kraken2",
 							  priv, &kraken2_chip_info,
@@ -176,16 +168,10 @@ static int kraken2_probe(struct hid_device *hdev,
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
 
 static void kraken2_remove(struct hid_device *hdev)
@@ -193,9 +179,6 @@ static void kraken2_remove(struct hid_device *hdev)
 	struct kraken2_priv_data *priv = hid_get_drvdata(hdev);
 
 	hwmon_device_unregister(priv->hwmon_dev);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static const struct hid_device_id kraken2_table[] = {
-- 
2.34.1


