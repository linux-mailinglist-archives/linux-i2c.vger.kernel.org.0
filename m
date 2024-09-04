Return-Path: <linux-i2c+bounces-6153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B165396BC2D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A9F2B21664
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFF91D934B;
	Wed,  4 Sep 2024 12:27:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA351CCB5B;
	Wed,  4 Sep 2024 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452860; cv=none; b=JCpRvqBBxwkjFOcSSRAZyaYVNf6uHMiNqOXa2PJjLchunoxlclPAUb3PUHrr1pkk+hZV2MLop+CyJCb3dI6haXNrc/c81+3HP4di8SVT3YQvgqvZg71uExsaDq6YNpeikB/9NkjLpU57Yr8DubHUKbzDduNPYjEQNM4Ua/Y9WAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452860; c=relaxed/simple;
	bh=f9uFQrzNSg5VkANf3YwBhU0Mjk2DALfu+37rTc/529U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r9IYVPel5DeR5V1NUb/bLWgUL88JB9i3G10PbqtLJTEuUDNP64pkrmdMQg9uNvr9pAHTHDe93hNWbL0wZJ2VSRF3UUXLQKBIIvOD1ande/ZlXf+lSIOvewTI+eOXEvt8gPY/0GzexdUPSpsGbvsNTA+t7yckIjtxAdJA8JTUVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WzMCB6Xz7zgYvn;
	Wed,  4 Sep 2024 20:25:26 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 2BA401800D2;
	Wed,  4 Sep 2024 20:27:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:33 +0800
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
Subject: [PATCH -next 06/19] HID: nintendo: Use devm_hid_hw_start_and_open in nintendo_hid_probe()
Date: Wed, 4 Sep 2024 20:35:54 +0800
Message-ID: <20240904123607.3407364-7-lizetao1@huawei.com>
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

Currently, the nintendo module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_close and err_stop lables.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hid/hid-nintendo.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 58cd0506e431..45ac4fd3c7ea 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2673,31 +2673,23 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	 */
 	hdev->version |= 0x8000;
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
-	if (ret) {
-		hid_err(hdev, "HW start failed\n");
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
+	if (ret)
 		goto err_wq;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "cannot start hardware I/O\n");
-		goto err_stop;
-	}
 
 	hid_device_io_start(hdev);
 
 	ret = joycon_init(hdev);
 	if (ret) {
 		hid_err(hdev, "Failed to initialize controller; ret=%d\n", ret);
-		goto err_close;
+		goto err_wq;
 	}
 
 	/* Initialize the leds */
 	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
-		goto err_close;
+		goto err_wq;
 	}
 
 	/* Initialize the battery power supply */
@@ -2720,10 +2712,6 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 
 err_ida:
 	ida_free(&nintendo_player_id_allocator, ctlr->player_id);
-err_close:
-	hid_hw_close(hdev);
-err_stop:
-	hid_hw_stop(hdev);
 err_wq:
 	destroy_workqueue(ctlr->rumble_queue);
 err:
@@ -2745,9 +2733,6 @@ static void nintendo_hid_remove(struct hid_device *hdev)
 
 	destroy_workqueue(ctlr->rumble_queue);
 	ida_free(&nintendo_player_id_allocator, ctlr->player_id);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 #ifdef CONFIG_PM
-- 
2.34.1


