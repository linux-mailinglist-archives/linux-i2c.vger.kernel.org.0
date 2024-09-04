Return-Path: <linux-i2c+bounces-6151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA23296BC1D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F4B284A32
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDD41D933F;
	Wed,  4 Sep 2024 12:27:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA991D88D7;
	Wed,  4 Sep 2024 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452858; cv=none; b=I0MjVT6tdl0uHRaYHxGZ0gj5+ZfueaH9QNYBwnwZ0oU2tK0yWNzGbFdIjdtn4V8V4hsTNDi9t9jZtf2inKU++vHVluGoVn19Q6mPCPtg+E3QZ/5uIWz/uTQbff01Bn1zbTj/MQSecyUTw4yJJp8E+XdcAv2AdCldiMwRxiQLOJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452858; c=relaxed/simple;
	bh=bnFn7uxvlpgxDIFy5TCBWsZxDa/wTSED4on3nue5zsA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMXB9IgSj/MknJg7w3FM3mW5SFvh4KGQeBTNJPfycfSRV7h5YU1SbfQcAPMxLQdTxR9+BTdYn9jF78WK0ldb2bI9P7yQN3g6s6bgBmupbsQFk4qWGcUVWvZxa4RKWRdYQsWHlmw74hlJK7t5uj0UJFR2gF1zqvM0XHfPywixFUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WzMCC3z31zgYvr;
	Wed,  4 Sep 2024 20:25:27 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id C9AB714011A;
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
Subject: [PATCH -next 07/19] HID: shield: Use devm_hid_hw_start_and_open in shield_probe()
Date: Wed, 4 Sep 2024 20:35:55 +0800
Message-ID: <20240904123607.3407364-8-lizetao1@huawei.com>
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

Currently, the shield module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_stop and err_ts_create lables, and
directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hid/hid-nvidia-shield.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-nvidia-shield.c b/drivers/hid/hid-nvidia-shield.c
index ff9078ad1961..747996a21dd9 100644
--- a/drivers/hid/hid-nvidia-shield.c
+++ b/drivers/hid/hid-nvidia-shield.c
@@ -1070,27 +1070,15 @@ static int shield_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	ts = container_of(shield_dev, struct thunderstrike, base);
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDINPUT);
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDINPUT);
 	if (ret) {
-		hid_err(hdev, "Failed to start HID device\n");
-		goto err_ts_create;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "Failed to open HID device\n");
-		goto err_stop;
+		thunderstrike_destroy(ts);
+		return ret;
 	}
 
 	thunderstrike_device_init_info(shield_dev);
 
 	return ret;
-
-err_stop:
-	hid_hw_stop(hdev);
-err_ts_create:
-	thunderstrike_destroy(ts);
-	return ret;
 }
 
 static void shield_remove(struct hid_device *hdev)
@@ -1100,11 +1088,9 @@ static void shield_remove(struct hid_device *hdev)
 
 	ts = container_of(dev, struct thunderstrike, base);
 
-	hid_hw_close(hdev);
 	thunderstrike_destroy(ts);
 	del_timer_sync(&ts->psy_stats_timer);
 	cancel_work_sync(&ts->hostcmd_req_work);
-	hid_hw_stop(hdev);
 }
 
 static const struct hid_device_id shield_devices[] = {
-- 
2.34.1


