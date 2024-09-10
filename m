Return-Path: <linux-i2c+bounces-6495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17808973C2F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE65281CBE
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF5D19D8A4;
	Tue, 10 Sep 2024 15:37:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22311199FB9;
	Tue, 10 Sep 2024 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982620; cv=none; b=C7uHQvNiNYv2tEYQUrHXxdsu9KfLr7gZd5joT1M30XisSHvMrRY7oJOEFCX5jL+Or1ocIwZ6VJfnCES57gr/f2gZJdz/do3pmw1mn8wIt9lMCF4IRZqfHh4sX7Pge9KQSrV7JuFgBN3UoVNgewSo7eMtd4EHyeAhfLDeh2kqJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982620; c=relaxed/simple;
	bh=Aj8Sn/pHGc8KNUlr2pTm0MMQLApMOSFBlbN6zQm70NU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQspsk3dcILXyqos6A8v/wKTyzQIB4Jk159Z98sDkW797srfUXZ6JPZ/+K+2nW3S90G0MTX++CQkSfYlQNjIbZcfAam0gCpGSyAcDAmRPTPj1B/HarlSOkQuoEsc1M70eu6g+QMBSA6HOfMvxW2rkP5yj6xyiZ6t9t8wiyucP5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X378r4FjQz2DbyL;
	Tue, 10 Sep 2024 23:36:28 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id DEB471A0190;
	Tue, 10 Sep 2024 23:36:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:36:42 +0800
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
Subject: [PATCH -next v3 07/15] HID: playstation: Use devm_hid_hw_start_and_open in ps_probe()
Date: Tue, 10 Sep 2024 23:45:37 +0800
Message-ID: <20240910154545.736786-8-lizetao1@huawei.com>
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

Currently, the playstation module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_close and err_stop lables, and
directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-8-lizetao1@huawei.com/
v1 -> v2: Adjust commit information
v1: https://lore.kernel.org/all/20240904123607.3407364-10-lizetao1@huawei.com/

drivers/hid/hid-playstation.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 0d90d7ee693c..6dddb9451a37 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -2704,41 +2704,25 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
-	if (ret) {
-		hid_err(hdev, "Failed to start HID device\n");
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
+	if (ret)
 		return ret;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "Failed to open HID device\n");
-		goto err_stop;
-	}
 
 	if (id->driver_data == PS_TYPE_PS4_DUALSHOCK4) {
 		dev = dualshock4_create(hdev);
 		if (IS_ERR(dev)) {
 			hid_err(hdev, "Failed to create dualshock4.\n");
-			ret = PTR_ERR(dev);
-			goto err_close;
+			return PTR_ERR(dev);
 		}
 	} else if (id->driver_data == PS_TYPE_PS5_DUALSENSE) {
 		dev = dualsense_create(hdev);
 		if (IS_ERR(dev)) {
 			hid_err(hdev, "Failed to create dualsense.\n");
-			ret = PTR_ERR(dev);
-			goto err_close;
+			return PTR_ERR(dev);
 		}
 	}
 
 	return ret;
-
-err_close:
-	hid_hw_close(hdev);
-err_stop:
-	hid_hw_stop(hdev);
-	return ret;
 }
 
 static void ps_remove(struct hid_device *hdev)
@@ -2750,9 +2734,6 @@ static void ps_remove(struct hid_device *hdev)
 
 	if (dev->remove)
 		dev->remove(dev);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static const struct hid_device_id ps_devices[] = {
-- 
2.34.1


