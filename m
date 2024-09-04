Return-Path: <linux-i2c+bounces-6150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E896BC19
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EA62284A9D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1851D9335;
	Wed,  4 Sep 2024 12:27:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90841D88AF;
	Wed,  4 Sep 2024 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452857; cv=none; b=fPfaDbfpk/BH2qNeCDXo/h4zoZcc8t84o+UszOC9D/FCyonf46oWmDhfs4D6IghHBdJOh0GCOHVmL2yV57qelfgoRn/GCU4QkWUV0IaFbe+4/gflLeZ1N4N8pkqxpp1asMNGZThik16ipm/hbvDYo59Y82uO5g0mzfqIe4SCU+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452857; c=relaxed/simple;
	bh=xD37XwYy6cgbacO2bq/1Eht3gXuobF5FecaBHuh2t5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HxTc60yTYFEwdYiSaI81mK4ZdBbdGoGR+alpgN6MLTwB+yiGOdkBsLSLuB9OG0j7GSsy0v24BXY867sxtiH6IKMfcsO0g47eP3BAaB3Lmryf6sUPn6dva69Ghg6gEnRfd0nGq3fIquRPXkCjga4ocUc7MWFaMpD1MW+bxU4C+ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WzMDt5dzXzyRNr;
	Wed,  4 Sep 2024 20:26:54 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id DDB311800D2;
	Wed,  4 Sep 2024 20:27:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:32 +0800
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
Subject: [PATCH -next 04/19] HID: mcp2200: Use devm_hid_hw_start_and_open in mcp2200_probe()
Date: Wed, 4 Sep 2024 20:35:52 +0800
Message-ID: <20240904123607.3407364-5-lizetao1@huawei.com>
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

Currently, the mcp2200 module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. So there is no need to close and
stop hid when an error occurs. At the same time, since there is no need to
do any operations in mcp2200_remove() now, so delete .remote operation.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
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


