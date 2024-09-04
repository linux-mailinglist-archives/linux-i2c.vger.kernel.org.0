Return-Path: <linux-i2c+bounces-6164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 479BB96BC43
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C47FB2468E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A551DA0F3;
	Wed,  4 Sep 2024 12:27:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A831D9D99;
	Wed,  4 Sep 2024 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452866; cv=none; b=q6zAszjv7AG49GGrv2ld4pUTnDeJxgSGXuLKD3b+8Sr+0Gd8+Hp4ZTV8Fmwrr/uQNNccg9+lT797uai+DP1fllrxQ0bhYhB3HW0cK6TXpqryL2HRnsGLiOxgdx/T1iTd3rUCB1ybj93qqMo5oU4wBrbwK6rz3gGptLvOOFRP8SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452866; c=relaxed/simple;
	bh=DTGh/1q2Odz1hSV0DApGpB4BaW6tTQi2v8++uFKMFq8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZSdfDc+EgkrFl0JocBKdV1fuJ+5pHJZ7AzS3II3qDIhZVRytMMXdVnhxefyBzwlA8ViFqYfCPYrSIysKGpYB3F8bpMsAqaPEcK0AjbV/HoSP2V2jjnItycvu9MCoJogJmsBGsvZkFpF9SIMES693jxohxMu27OeWgSPtXVxH5Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WzMDh6j4CzyR68;
	Wed,  4 Sep 2024 20:26:44 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id AE795140137;
	Wed,  4 Sep 2024 20:27:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:41 +0800
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
Subject: [PATCH -next 19/19] hwmon: (nzxt-smart2) Use devm_hid_hw_start_and_open in nzxt_smart2_hid_probe()
Date: Wed, 4 Sep 2024 20:36:07 +0800
Message-ID: <20240904123607.3407364-20-lizetao1@huawei.com>
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

Currently, the nzxt-smart2 module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the out_hw_close and out_hw_stop
lables, and directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hwmon/nzxt-smart2.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index df6fa72a6b59..b5721a42c0d3 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -750,14 +750,10 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
 	if (ret)
 		return ret;
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
 	if (ret)
 		return ret;
 
-	ret = hid_hw_open(hdev);
-	if (ret)
-		goto out_hw_stop;
-
 	hid_device_io_start(hdev);
 
 	init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
@@ -765,19 +761,10 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
 	drvdata->hwmon =
 		hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", drvdata,
 						&nzxt_smart2_chip_info, NULL);
-	if (IS_ERR(drvdata->hwmon)) {
-		ret = PTR_ERR(drvdata->hwmon);
-		goto out_hw_close;
-	}
+	if (IS_ERR(drvdata->hwmon))
+		return PTR_ERR(drvdata->hwmon);
 
 	return 0;
-
-out_hw_close:
-	hid_hw_close(hdev);
-
-out_hw_stop:
-	hid_hw_stop(hdev);
-	return ret;
 }
 
 static void nzxt_smart2_hid_remove(struct hid_device *hdev)
@@ -785,9 +772,6 @@ static void nzxt_smart2_hid_remove(struct hid_device *hdev)
 	struct drvdata *drvdata = hid_get_drvdata(hdev);
 
 	hwmon_device_unregister(drvdata->hwmon);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static const struct hid_device_id nzxt_smart2_hid_id_table[] = {
-- 
2.34.1


