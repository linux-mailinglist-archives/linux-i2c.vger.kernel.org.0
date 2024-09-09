Return-Path: <linux-i2c+bounces-6365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ADE970B08
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADFD61C21621
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7B018E1E;
	Mon,  9 Sep 2024 01:14:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B849BBA42;
	Mon,  9 Sep 2024 01:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844467; cv=none; b=uYpVj4CUJJ4l7UC3+QD9Z4BmYwJaQwrRo366LAQt57Kr343ZbgCAdiNHiaP/vPY/+vIj97SeHPBpEGUAvePiLxbJV4KmPBer4WUqgmxwpOjH3absdueZz8sLTw0DGg6m3csoxtZayzd0umWNZWuwPAfSWVml54hyG8KiFzQFyv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844467; c=relaxed/simple;
	bh=wK0YNdrtg68ij9JLDEKdfQf95eHGfo+KduP/pbWdKlk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0hagKugiTtIH/zX3Wir+d5Z7m1AnLrjHCvp3lsSEm5GvBrMDWnNoOuUII4BZodqcu4HhAOi3AujJ2aQEYcLaRGmkazQOgYdsjhE9+BJbWbHlgs2FpIHlZJk92mlodOV4wxpA1SXJ6vDyLvhW1nw5zFUjXX4WYHGk6TlOyOFpfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X283x3LYyz2DbxK;
	Mon,  9 Sep 2024 09:13:49 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id B12F01A016C;
	Mon,  9 Sep 2024 09:14:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:14 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 01/15] HID: core: Use devm_add_action_or_reset helper to manage hid resources
Date: Mon, 9 Sep 2024 09:22:59 +0800
Message-ID: <20240909012313.500341-2-lizetao1@huawei.com>
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

By adding a custom action to the device, it can bind the hid resource
to the hid_device life cycle. The framework automatically close and stop
the hid resources before hid_device is released, and the users do not
need to pay attention to the timing of hid resource release.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Add function usage constraints in comments
v1:
https://lore.kernel.org/all/cyils23bh4xaiw7bydlpapz4ngqpya3c4kesifrdpnme2t4bib@6elk7u3wvhh2/

 drivers/hid/hid-core.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/hid.h    |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 30de92d0bf0f..132c81639753 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2416,6 +2416,50 @@ void hid_hw_close(struct hid_device *hdev)
 }
 EXPORT_SYMBOL_GPL(hid_hw_close);
 
+static void hid_hw_close_and_stop(void *data)
+{
+	struct hid_device *hdev = data;
+
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+/**
+ * devm_hid_hw_start_and_open - manage hid resources through custom action
+ *
+ * @hdev: hid device
+ * @connect_mask: which outputs to connect, see HID_CONNECT_*
+ *
+ * Bind the hid resource to the hid_device life cycle and register
+ * an action to release the hid resource. The users do not need to
+ * pay attention to the release of hid.
+ *
+ * Some usage constraints of this function: hid_device also needs to be
+ * allocated through the Devres API, such as devm_kzalloc; hid_hw_stop should
+ * be followed immediately by hid_hw_close in the remove operation.
+ */
+
+int devm_hid_hw_start_and_open(struct hid_device *hdev, unsigned int connect_mask)
+{
+	int ret;
+
+	ret = hid_hw_start(hdev, connect_mask);
+	if (ret) {
+		hid_err(hdev, "hw start failed with %d\n", ret);
+		return ret;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "hw open failed with %d\n", ret);
+		hid_hw_stop(hdev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(&hdev->dev, hid_hw_close_and_stop, hdev);
+}
+EXPORT_SYMBOL_GPL(devm_hid_hw_start_and_open);
+
 /**
  * hid_hw_request - send report request to device
  *
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 121d5b8bc867..0ce217aa5f62 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1125,6 +1125,8 @@ int __must_check hid_hw_start(struct hid_device *hdev,
 void hid_hw_stop(struct hid_device *hdev);
 int __must_check hid_hw_open(struct hid_device *hdev);
 void hid_hw_close(struct hid_device *hdev);
+int __must_check devm_hid_hw_start_and_open(struct hid_device *hdev,
+					    unsigned int connect_mask);
 void hid_hw_request(struct hid_device *hdev,
 		    struct hid_report *report, enum hid_class_request reqtype);
 int __hid_hw_raw_request(struct hid_device *hdev,
-- 
2.34.1


