Return-Path: <linux-i2c+bounces-6503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3A973C49
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16BBAB25E6E
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9A719B595;
	Tue, 10 Sep 2024 15:37:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03BB199FDB;
	Tue, 10 Sep 2024 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982626; cv=none; b=a0u7zCJS0EJv1Wret5tbouFmExFFI5wJqsEWMFI3xOTR8FLEK5ma9ipXFMOfJ5860O5Qy4WLPKkJB/+i4cAYWP+WhswiLy0Nnm/BtcZ3+dK08GBZ1aNGfep/862WflbURNoEkByGuNjhj9kj2/2Me/VtTrfDs84PlpH5RoNXyQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982626; c=relaxed/simple;
	bh=ini3owQEdr1AG+MD9QCkp98/2njfkgaf0iJhkpStzEY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/Ywv87R83u9463JAXWkUq+gyCbf+UVWOKvnHV2qXi+6LU6SYYsvhjghG2l42rxAIbJnKFh36R8iW5zNvmAspN62YTwWlDhuqgf2vsMTe+N65YyD0kObCD+rbjUCRAwCOKekg5Bm3MwYFxJyzR1HC+25BEYLIqe3nhUbGL7GxfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4X379M2TlVz1xx9t;
	Tue, 10 Sep 2024 23:36:55 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id B3E581A0190;
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
Subject: [PATCH -next v3 04/15] HID: mcp2200: Use devm_hid_hw_start_and_open in mcp2200_probe()
Date: Tue, 10 Sep 2024 23:45:34 +0800
Message-ID: <20240910154545.736786-5-lizetao1@huawei.com>
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

Currently, the mcp2200 module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. So there is no need to close and
stop hid when an error occurs. At the same time, since there is no need to
do any operations in mcp2200_remove() now, so delete .remote operation.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-5-lizetao1@huawei.com/
v1 -> v2: Adjust commit information
v1: https://lore.kernel.org/all/20240904123607.3407364-5-lizetao1@huawei.com/

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


