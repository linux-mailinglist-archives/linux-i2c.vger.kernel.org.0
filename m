Return-Path: <linux-i2c+bounces-6491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36601973C22
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2A42850CD
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F64D19C54A;
	Tue, 10 Sep 2024 15:36:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326AA198E65;
	Tue, 10 Sep 2024 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982606; cv=none; b=Lwvg83kALbQznpG/A4FX71WwIEtqR0VmVrO5rc6uF6NFCut5bZzbhDBsDYjYcoGhEYmtbNKfP4HIvcgA+ktDKFnd1HeODlU54QVdMoL8tQED2vpCuHHCZjMQEWTt8pdhjU/eX3n+Uk0mZXMbd4tNfw+MLNiQx21KLEiBZDBhgQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982606; c=relaxed/simple;
	bh=82CoUIteJAh97jfHHke1JjzahJLKXLBNntKOxQM8+nA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZDzazYKyAKEQH3tPoSgJD/9tCZpFpNo7do68MOde3M9ZvtSyZxwweuldhYRbWb3VPMbjEv87qIZuOh49yKz1DmEqa60UJ70Z+g2sRjeEJg794EPOwT/VgS7wuWwOIpot5qMuihJQ0RDElHVjjzqON2AreBQxAj52U02jA4vQUL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X378X6nwXz2DbwJ;
	Tue, 10 Sep 2024 23:36:12 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 40A5C180042;
	Tue, 10 Sep 2024 23:36:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:36:40 +0800
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
Subject: [PATCH -next v3 03/15] HID: ft260: Use devm_hid_hw_start_and_open in ft260_probe()
Date: Tue, 10 Sep 2024 23:45:33 +0800
Message-ID: <20240910154545.736786-4-lizetao1@huawei.com>
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

Currently, the ft260 module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_hid_close, err_hid_stop
and err_i2c_free lables, and directly return the error code when an
error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-4-lizetao1@huawei.com/
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


