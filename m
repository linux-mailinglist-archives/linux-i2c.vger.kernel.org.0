Return-Path: <linux-i2c+bounces-6148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 015A196BC15
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B1C1C21DCD
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734881D9328;
	Wed,  4 Sep 2024 12:27:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBC51D54DC;
	Wed,  4 Sep 2024 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452857; cv=none; b=nfzqLKWOYiCwInNwYZVpEMOWi8I9RdLp2qmufPDuibRqCfGQO76XMRkUuJpz3EnyDyUB1M8WkxtngOnTrIy2Nvctba7C87/fv7XXzBiU/BkPHzULZtTkZF6dXnh+qgOz0PYIGSIcn61K2X6tZI8zO0wdrTs2U1BOMsNg3urw3Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452857; c=relaxed/simple;
	bh=qSgrN06x9hDxRaTMql1PfTsxtnAVoc2I43BMIVKDs+E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MTgRiZnbbCSLeG+ldWAwj91bnpOio+Llzct+QRj/TOBXwsIbWB8BOmh35zJef3pt7pykymnx9X9UMaQ6Hm8Zvi8ejHkH6rC8H7/hJaLPP+mDgJUk1zloF3scw6MD+YIsarb/LRboD/GA+zbQ5tHqbzRrnbTHkwFeIZDNF075Ua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WzM7s6wDMz69WR;
	Wed,  4 Sep 2024 20:22:33 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 865201400CA;
	Wed,  4 Sep 2024 20:27:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:30 +0800
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
Subject: [PATCH -next 02/19] HID: cp2112: Use devm_hid_hw_start_and_open in cp2112_probe()
Date: Wed, 4 Sep 2024 20:35:50 +0800
Message-ID: <20240904123607.3407364-3-lizetao1@huawei.com>
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

Currently, the cp2112 module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_hid_close and err_hid_stop
lables.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hid/hid-cp2112.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 20a0d1315d90..6d65c65f1b83 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1215,22 +1215,14 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
-	if (ret) {
-		hid_err(hdev, "hw start failed\n");
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
+	if (ret)
 		return ret;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "hw open failed\n");
-		goto err_hid_stop;
-	}
 
 	ret = hid_hw_power(hdev, PM_HINT_FULLON);
 	if (ret < 0) {
 		hid_err(hdev, "power management error: %d\n", ret);
-		goto err_hid_close;
+		return ret;
 	}
 
 	ret = cp2112_hid_get(hdev, CP2112_GET_VERSION_INFO, buf, sizeof(buf),
@@ -1334,10 +1326,6 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	i2c_del_adapter(&dev->adap);
 err_power_normal:
 	hid_hw_power(hdev, PM_HINT_NORMAL);
-err_hid_close:
-	hid_hw_close(hdev);
-err_hid_stop:
-	hid_hw_stop(hdev);
 	return ret;
 }
 
@@ -1354,14 +1342,6 @@ static void cp2112_remove(struct hid_device *hdev)
 	}
 
 	gpiochip_remove(&dev->gc);
-	/* i2c_del_adapter has finished removing all i2c devices from our
-	 * adapter. Well behaved devices should no longer call our cp2112_xfer
-	 * and should have waited for any pending calls to finish. It has also
-	 * waited for device_unregister(&adap->dev) to complete. Therefore we
-	 * can safely free our struct cp2112_device.
-	 */
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static int cp2112_raw_event(struct hid_device *hdev, struct hid_report *report,
-- 
2.34.1


