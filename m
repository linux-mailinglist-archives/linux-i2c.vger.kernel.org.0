Return-Path: <linux-i2c+bounces-6489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E7F973C1D
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DD9E282CD4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53ED8199FDD;
	Tue, 10 Sep 2024 15:36:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC114204D;
	Tue, 10 Sep 2024 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982605; cv=none; b=aof50jgCMZYWYrBHAb2/A4QQhc5OhWiBex66AJxvPkTCTZYdmMalX/rxYgK2qRKolMyGJTZCX20LFZ9Sb3UTFzb49oz4H3VfWzyLB4Aq2doqRHFkhA/BpXtnA435zzWQEABTzE8E+ZaV4q3FZu78oz5JJ/UcrKt1toQC7IZWiWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982605; c=relaxed/simple;
	bh=JDsJ+OZ3jYZU4cKZmtna7iy8Om1JPFShPB0vE/3mBRg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L1ydY4iVdWvDi5brxRagyqJ8YeijuMPgREjaqs0089sukD6K8+4TApC4AfIEBPOjCbhom4EML6aNiChAcIGRk9Tgj/xYWrRosLaHxTZZAiKjgsvDHIqrq0SGhJfTdl3iq6tjYqp1puJCTgNU/BL86qH8zCKzqHnW+IzwO3BfD/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4X377p3ScMz13KkC;
	Tue, 10 Sep 2024 23:35:34 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 0804E140158;
	Tue, 10 Sep 2024 23:36:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:36:39 +0800
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
Subject: [PATCH -next v3 01/15] HID: core: Use devm_add_action_or_reset helper to manage hid resources
Date: Tue, 10 Sep 2024 23:45:31 +0800
Message-ID: <20240910154545.736786-2-lizetao1@huawei.com>
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

By adding a custom action to the device, it can bind the hid resource
to the hid_device life cycle. The framework automatically close and stop
the hid resources before hid_device is released, and the users do not
need to pay attention to the timing of hid resource release.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: None
v2: https://lore.kernel.org/all/20240909012313.500341-2-lizetao1@huawei.com/
v1 -> v2: Add function usage constraints in comments
v1: https://lore.kernel.org/all/20240904123607.3407364-2-lizetao1@huawei.com/

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


