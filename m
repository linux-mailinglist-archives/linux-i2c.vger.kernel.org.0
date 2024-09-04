Return-Path: <linux-i2c+bounces-6154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E696BC24
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F87B1C21C90
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0101B1D9356;
	Wed,  4 Sep 2024 12:27:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D521D9339;
	Wed,  4 Sep 2024 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452860; cv=none; b=dvuLQliPpysjQlZnOhGBBWkkGMajB2c23HbffdKySs+dAfqDYYIQfDvS5dp1myVUCZmD4ptktQmTHU/w1V+hzMUJ84HPzB5jRyVsUzl7nHLFQa761C5Z+I2jjTC+LPPtty2VK1nRqZZ77MTAkisNcM8AQpVLLt+nfLEz+eXuxGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452860; c=relaxed/simple;
	bh=op25NKclmh5WszqVK31MArbkM2pkNrfc6LJ1tfFAAhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QWqus4uvpnIdqC2Q+UyAqoRitkVS+4tLL/XnyqfKMXSubisswxRgGrNwNLvq3xT9yW5l+/deHfQTyBw1kuYyfQ1DJk7Ed8Qa/oAP2TRa0M/mcZ1eXlKtsfSgHPdqeH3MGLUK6AZ9BCf2hcozg8BmGzWFMqL22JjIr4nWMz7fFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WzMDb077lzyR5f;
	Wed,  4 Sep 2024 20:26:39 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id C0C461800FE;
	Wed,  4 Sep 2024 20:27:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:35 +0800
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
Subject: [PATCH -next 10/19] HID: hid-steam: Use devm_hid_hw_start_and_open in steam_probe()
Date: Wed, 4 Sep 2024 20:35:58 +0800
Message-ID: <20240904123607.3407364-11-lizetao1@huawei.com>
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

Currently, the hid-steam module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_hw_close and err_hw_stop lables.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hid/hid-steam.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index bf8b633114be..d393762bf52f 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -1236,18 +1236,10 @@ static int steam_probe(struct hid_device *hdev,
 	 * With the real steam controller interface, do not connect hidraw.
 	 * Instead, create the client_hid and connect that.
 	 */
-	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_HIDRAW);
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_HIDRAW);
 	if (ret)
 		goto err_cancel_work;
 
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev,
-			"%s:hid_hw_open\n",
-			__func__);
-		goto err_hw_stop;
-	}
-
 	if (steam->quirks & STEAM_QUIRK_WIRELESS) {
 		hid_info(hdev, "Steam wireless receiver connected");
 		/* If using a wireless adaptor ask for connection status */
@@ -1261,7 +1253,7 @@ static int steam_probe(struct hid_device *hdev,
 			hid_err(hdev,
 				"%s:steam_register failed with error %d\n",
 				__func__, ret);
-			goto err_hw_close;
+			goto err_cancel_work;
 		}
 	}
 
@@ -1283,10 +1275,6 @@ static int steam_probe(struct hid_device *hdev,
 err_steam_unregister:
 	if (steam->connected)
 		steam_unregister(steam);
-err_hw_close:
-	hid_hw_close(hdev);
-err_hw_stop:
-	hid_hw_stop(hdev);
 err_cancel_work:
 	cancel_work_sync(&steam->work_connect);
 	cancel_delayed_work_sync(&steam->mode_switch);
@@ -1312,8 +1300,6 @@ static void steam_remove(struct hid_device *hdev)
 	if (steam->quirks & STEAM_QUIRK_WIRELESS) {
 		hid_info(hdev, "Steam wireless receiver disconnected");
 	}
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 	steam_unregister(steam);
 }
 
-- 
2.34.1


