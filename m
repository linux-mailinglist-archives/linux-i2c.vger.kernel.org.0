Return-Path: <linux-i2c+bounces-6147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6407F96BC11
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19F091F26306
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3CE1D88D8;
	Wed,  4 Sep 2024 12:27:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349C11D7E23;
	Wed,  4 Sep 2024 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452857; cv=none; b=dO5aBH+++7HjlbXUaqvUMs4EKAypOLgpyh6SqXoa3+JyynP4lbrl6Uj1svEG3XYwqobUmaD/aYU9govf5M0Pxzc51ZQJRMUHh+O/4EC3VW1mGv0ittsMIUzInSYLWL1ff4NAwpVYoiYeto1LbgnLK5S1clSeIcaQ9n+XQMmnu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452857; c=relaxed/simple;
	bh=CW5GEcVRAatZr5h8ZOzMq8dC3CRsJQ04GRAxe09uDyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ntjAfCzcPqsLkLFJdDSb9N+b+tumHHmoEZxTdrx7onvQL1/98pmKij2aLOr26TwzconkcCXB2RaO44OY/8fhLXeyX7c7wEL91SUCvLETtXYOU0KIaXFwXwlKVS9hi3xy1Y33bA4inMwpATyFHy8qe/eAD5VC1ESb8dht8KotkPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WzM7s2LxGz69WG;
	Wed,  4 Sep 2024 20:22:33 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id DE09818005F;
	Wed,  4 Sep 2024 20:27:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:30 +0800
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
Subject: [PATCH -next 01/19] HID: core: Use devm_add_action_or_reset helper to manage hid resources
Date: Wed, 4 Sep 2024 20:35:49 +0800
Message-ID: <20240904123607.3407364-2-lizetao1@huawei.com>
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

By adding a custom action to the device, it can bind the hid resource
to the hid_device life cycle. The framework automatically close and stop
the hid resources before hid_device is released, and the users do not
need to pay attention to the timing of hid resource release.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hid/hid-core.c | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/hid.h    |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 30de92d0bf0f..71143c0a4a02 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2416,6 +2416,46 @@ void hid_hw_close(struct hid_device *hdev)
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


