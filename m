Return-Path: <linux-i2c+bounces-6504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9E973C4A
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE8061F26C0C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493CB1A01BD;
	Tue, 10 Sep 2024 15:37:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA09B1A00F4;
	Tue, 10 Sep 2024 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982627; cv=none; b=cpGAHTEFWBVUtojNdqBCijdhUgfnzO34ZFBSOlhMZRlC0VvpojezN6XE3rIlEbPCFF1azAVlkniIlSYNUxM5Wv3nn4cwk7ER6h/R/bB9Uc8kyiVItYrvPW+x6zIkTkcHBu82KcgHBoiRydZVQ46cx+EPcIrDniYO8ACGWxxzL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982627; c=relaxed/simple;
	bh=7qi4mBYuK0ZnEPIUgHeNiz19kDlMvrLoPLzh2Iqhiy0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTdeX6kkeKqdmR0HHUMFpORUeDo/wcmwH9o+cUgHSBLGJ6wkF8PccrlEiNOuGYuuRCapHkXr0dtYpenECinlnUEakFc5bDdoCunEvFxltVteDbMLrYV1S6E8TGOrp2YNAukWjbO5yAk9Wy2tV9VJzA3vmYr8xDS6QEAfCAlEeDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4X379M2z5Cz1xxDH;
	Tue, 10 Sep 2024 23:36:55 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id C28E01A0191;
	Tue, 10 Sep 2024 23:36:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:36:41 +0800
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
Subject: [PATCH -next v3 05/15] HID: mcp2221: Use devm_hid_hw_start_and_open in mcp2221_probe()
Date: Tue, 10 Sep 2024 23:45:35 +0800
Message-ID: <20240910154545.736786-6-lizetao1@huawei.com>
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

Currently, the mcp2221 module use devm_add_action_or_reset() to manage
device resource for HID unregistration, now that a universal interface
has been provided, use a universal interface to replace it.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-6-lizetao1@huawei.com/
v1 -> v2: None
v1: https://lore.kernel.org/all/20240904123607.3407364-6-lizetao1@huawei.com/

 drivers/hid/hid-mcp2221.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 0f93c22a479f..3b8269f7e923 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -932,15 +932,6 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 	return 1;
 }
 
-/* Device resource managed function for HID unregistration */
-static void mcp2221_hid_unregister(void *ptr)
-{
-	struct hid_device *hdev = ptr;
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
-}
-
 /* This is needed to be sure hid_hw_stop() isn't called twice by the subsystem */
 static void mcp2221_remove(struct hid_device *hdev)
 {
@@ -1141,31 +1132,18 @@ static int mcp2221_probe(struct hid_device *hdev,
 	 * This driver uses the .raw_event callback and therefore does not need any
 	 * HID_CONNECT_xxx flags.
 	 */
-	ret = hid_hw_start(hdev, 0);
-	if (ret) {
-		hid_err(hdev, "can't start hardware\n");
+	ret = devm_hid_hw_start_and_open(hdev, 0);
+	if (ret)
 		return ret;
-	}
 
 	hid_info(hdev, "USB HID v%x.%02x Device [%s] on %s\n", hdev->version >> 8,
 			hdev->version & 0xff, hdev->name, hdev->phys);
 
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "can't open device\n");
-		hid_hw_stop(hdev);
-		return ret;
-	}
-
 	mutex_init(&mcp->lock);
 	init_completion(&mcp->wait_in_report);
 	hid_set_drvdata(hdev, mcp);
 	mcp->hdev = hdev;
 
-	ret = devm_add_action_or_reset(&hdev->dev, mcp2221_hid_unregister, hdev);
-	if (ret)
-		return ret;
-
 	hid_device_io_start(hdev);
 
 	/* Set I2C bus clock diviser */
-- 
2.34.1


