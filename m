Return-Path: <linux-i2c+bounces-6493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 685CE973C29
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24962284F66
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B948419AD81;
	Tue, 10 Sep 2024 15:37:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D894195F22;
	Tue, 10 Sep 2024 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982620; cv=none; b=O0LL8cnNNfUEBwC+a9TpWZhNlbeF0nmkzKC8fo2hxHXWCwuzAe5nB8kiaP3e18iapL/Dva/c9rhr3csWeoVhcUvYNV/khB6SbTquIerMeb7zxyAPjJNLbLiUGGCLo0vrls5+14bEvPhw5jsnSkaOJG32Dn3j+3STtZhKDcDgSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982620; c=relaxed/simple;
	bh=WCfs992GQASkoWSrFRk//DSH3Y3151jfop8OjJGZiDw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=peb5KO95gwYuJou2wpvC8nGhA9CdMkMv3j6X5yO4Y+zgYiII2IlWirXEHGtY/9urmsuX+hqOwS65eGybhipTzSv/7up+h8ZLJqQhg8yM0mxMONdpzmYMgbGdhcu5/1cbrOn6p6+xZ8NHPj/6KtsHA2vFVvUIs6keHdDcRxadIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X378r5BcWz1j8Lp;
	Tue, 10 Sep 2024 23:36:28 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id D03211A0194;
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
Subject: [PATCH -next v3 06/15] HID: nintendo: Use devm_hid_hw_start_and_open in nintendo_hid_probe()
Date: Tue, 10 Sep 2024 23:45:36 +0800
Message-ID: <20240910154545.736786-7-lizetao1@huawei.com>
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

Currently, the nintendo module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_close and err_stop lables.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-7-lizetao1@huawei.com/
v1 -> v2: Adjust commit information
v1: https://lore.kernel.org/all/20240904123607.3407364-7-lizetao1@huawei.com/

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


