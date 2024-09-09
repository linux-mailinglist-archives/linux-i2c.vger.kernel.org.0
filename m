Return-Path: <linux-i2c+bounces-6366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE3970B09
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5841F2171E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB3D18EAB;
	Mon,  9 Sep 2024 01:14:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4728EF;
	Mon,  9 Sep 2024 01:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844467; cv=none; b=puUSkivL9kTcoCuKsPEizX+AQ480kw4Yeke/+sMuvsG4JxwHIDhpyn0+DMdbdGs2SaIe2ZpVA7zn2wh3fozoGxUgubakPY1Q61YL+/oBhEotE+iBDazMzgcjxRcpZbqgfmik3en+IHd9DkmPbfFEWh3MDQ7NKyVPF0l/18TkYS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844467; c=relaxed/simple;
	bh=BkQcviMIXgbXjNJfvW6RUri3oYz1lp61b2gghrCznQY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9vt1+oCW2NkiMNN5xVwTFx6YmVxRKfyIvACcVGgKsLp8CSHnZe7dL4ICCtzIWVCKQ6IxulXm92NHp1sicaZRLAXqDKr6XQa1pKB780IgFRt/UG5Y40qD9+H+zB2zo44i/cjfhDXsK+AAGrakQhTstiI5aGDo6ZXFbp0d7XYCO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X283z3XsSz1j7mD;
	Mon,  9 Sep 2024 09:13:51 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 89AEE140337;
	Mon,  9 Sep 2024 09:14:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:16 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 04/15] HID: mcp2200: Use devm_hid_hw_start_and_open in mcp2200_probe()
Date: Mon, 9 Sep 2024 09:23:02 +0800
Message-ID: <20240909012313.500341-5-lizetao1@huawei.com>
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

Currently, the mcp2200 module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. So there is no need to close and
stop hid when an error occurs. At the same time, since there is no need to
do any operations in mcp2200_remove() now, so delete .remote operation.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Adjust commit information
v1:
https://lore.kernel.org/all/20240904123607.3407364-5-lizetao1@huawei.com/

 drivers/hid/hid-mcp2200.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-mcp2200.c b/drivers/hid/hid-mcp2200.c
index bf57f7f6caa0..56d72fc5623d 100644
--- a/drivers/hid/hid-mcp2200.c
+++ b/drivers/hid/hid-mcp2200.c
@@ -329,22 +329,13 @@ static int mcp2200_probe(struct hid_device *hdev, const struct hid_device_id *id
 		return ret;
 	}
 
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
@@ -356,20 +347,12 @@ static int mcp2200_probe(struct hid_device *hdev, const struct hid_device_id *id
 	ret = devm_gpiochip_add_data(&hdev->dev, &mcp->gc, mcp);
 	if (ret < 0) {
 		hid_err(hdev, "Unable to register gpiochip\n");
-		hid_hw_close(hdev);
-		hid_hw_stop(hdev);
 		return ret;
 	}
 
 	return 0;
 }
 
-static void mcp2200_remove(struct hid_device *hdev)
-{
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
-}
-
 static const struct hid_device_id mcp2200_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_MCP2200) },
 	{ }
@@ -380,7 +363,6 @@ static struct hid_driver mcp2200_driver = {
 	.name		= "mcp2200",
 	.id_table	= mcp2200_devices,
 	.probe		= mcp2200_probe,
-	.remove		= mcp2200_remove,
 	.raw_event	= mcp2200_raw_event,
 };
 
-- 
2.34.1


