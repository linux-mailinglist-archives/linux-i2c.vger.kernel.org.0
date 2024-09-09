Return-Path: <linux-i2c+bounces-6368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE2970B11
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D5C6B21245
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDE01BC49;
	Mon,  9 Sep 2024 01:14:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56D811712;
	Mon,  9 Sep 2024 01:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844468; cv=none; b=N/g+v9Xpz1xOP5fEs8Shx5g+hakXtwrqlOL9802Vjt4lSIjaJ1wCTq2a0d2sz+dLx2nv89l2PgtxRQpjSN+89gAFmU2zTXqNpqOBZ6B6mGJ5u8BS4PnhDcAFCn3m4CokztEfApUq0u5OSkpBtNbXwfyW4aNZq67dL4KZMiiK0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844468; c=relaxed/simple;
	bh=a2yNCQHSb4RsF8vhWd6Tml8oxseIm7aUqomMD6XfQDQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u0x3Rudc7bE2LxXQNbuWJu4VweeMdwc1SqJmA9NTscva3OESR33HdvCl1aCEWNm9EuyjevyHWysktAic/AZM1N10jpKNlNj//6IJvviE1Nx/P0q21ZdlvrkjkdjJi7wxY4NBtH3v6WdLJ984uJk+TKtNkEZmCz95RooFcphmG6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X283g58MRzyRf0;
	Mon,  9 Sep 2024 09:13:35 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id C9B2A1403D4;
	Mon,  9 Sep 2024 09:14:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:18 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 06/15] HID: nintendo: Use devm_hid_hw_start_and_open in nintendo_hid_probe()
Date: Mon, 9 Sep 2024 09:23:04 +0800
Message-ID: <20240909012313.500341-7-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909012313.500341-1-lizetao1@huawei.com>
References: <20240909012313.500341-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Currently, the nintendo module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_close and err_stop lables.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Adjust commit information
v1:
https://lore.kernel.org/all/20240904123607.3407364-7-lizetao1@huawei.com/

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


