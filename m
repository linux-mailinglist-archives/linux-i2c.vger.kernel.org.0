Return-Path: <linux-i2c+bounces-6369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E35970B12
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 858FD1F213CA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290771C68F;
	Mon,  9 Sep 2024 01:14:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20F14267;
	Mon,  9 Sep 2024 01:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844469; cv=none; b=ohpwjnNs1eaNGbaYVWEsSVRG/oyYWvRyQjzM+DOKWNOX9gqGuuRIQnEf+LHEFq+E8SjFh4LEWb6spNLe5iVgLOM70tgRlHReXBcVbWyEgUiOArUicHHREGphPZG3poQCnKtjet12MPYLpuy0CvlYbqapqbPeYSVc2NTNSq24pjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844469; c=relaxed/simple;
	bh=ZxV7IU+t3xrOnhI7UELrdVwgRxKcp3ky69pUqWvXBqE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LSxMfzXBlUZHKKq0gFht6G5mmfcCI2l6fmjO5xbtzwtHymPz1Furo91EG0sNEJGlfcqSInZFd55IC0jb6qUzyOKKL2GMPSlhXBWmghzuFXTAKvIs/vb/Bd7seGYGhjXFkkx4YvmKjYZOKjVOKMu8YaIMFJtcU/QlCvEqCc5Xrd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4X284Q4SQMz69N3;
	Mon,  9 Sep 2024 09:14:14 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 2CA5B1400D1;
	Mon,  9 Sep 2024 09:14:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:17 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 05/15] HID: mcp2221: Use devm_hid_hw_start_and_open in mcp2221_probe()
Date: Mon, 9 Sep 2024 09:23:03 +0800
Message-ID: <20240909012313.500341-6-lizetao1@huawei.com>
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

Currently, the mcp2221 module use devm_add_action_or_reset() to manage
device resource for HID unregistration, now that a universal interface
has been provided, use a universal interface to replace it.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: None
v1:
https://lore.kernel.org/all/20240904123607.3407364-6-lizetao1@huawei.com/

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


