Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6613DF1FA
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Aug 2021 18:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhHCQBG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Aug 2021 12:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41727 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229716AbhHCQBG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Aug 2021 12:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628006454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w+ZbjeQ+nj2MN9GQ4vAN7nTPNWMFQzcQOlTIQOz2s8Y=;
        b=IbhYTa+g1Sa/Ax50apixf43tGAdapmr9Br5uG0Bu1EFsTPRySmEe1GdNM94FLSC2B1qEk2
        QClxOHm+BN0UhCXRaxF+mSrP45apYjPtVmEZpDq4odrBx5mQvzVrwZ/kmuKp45p+BoMMOA
        wqoyMgflCl+k8FbFJFZkKkdC0g/vkSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-fOP6rkVdPte4zgM839A_0A-1; Tue, 03 Aug 2021 12:00:50 -0400
X-MC-Unique: fOP6rkVdPte4zgM839A_0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71EC6363A0;
        Tue,  3 Aug 2021 16:00:49 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.193.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CE83660C0F;
        Tue,  3 Aug 2021 16:00:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH 1/4] i2c: acpi: Add an i2c_acpi_client_count() helper function
Date:   Tue,  3 Aug 2021 18:00:41 +0200
Message-Id: <20210803160044.158802-2-hdegoede@redhat.com>
In-Reply-To: <20210803160044.158802-1-hdegoede@redhat.com>
References: <20210803160044.158802-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have 3 files now which have the need to count the number of
I2cSerialBus resources in an ACPI-device's resource-list.

Currently all implement their own helper function for this,
add a generic helper function to replace the 3 implementations.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/i2c-core-acpi.c | 32 ++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  5 +++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 6f0aa0ed3241..aaeeacc12121 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -69,6 +69,38 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_get_i2c_resource);
 
+static int i2c_acpi_resource_count(struct acpi_resource *ares, void *data)
+{
+	struct acpi_resource_i2c_serialbus *sb;
+	int *count = data;
+
+	if (i2c_acpi_get_i2c_resource(ares, &sb))
+		*count = *count + 1;
+
+	return 1;
+}
+
+/**
+ * i2c_acpi_client_count - Count the number of I2cSerialBus resources
+ * @adev:	ACPI device
+ *
+ * Returns the number of I2cSerialBus resources in the ACPI-device's
+ * resource-list; or a negative error code.
+ */
+int i2c_acpi_client_count(struct acpi_device *adev)
+{
+	int ret, count = 0;
+	LIST_HEAD(r);
+
+	ret = acpi_dev_get_resources(adev, &r, i2c_acpi_resource_count, &count);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&r);
+	return count;
+}
+EXPORT_SYMBOL_GPL(i2c_acpi_client_count);
+
 static int i2c_acpi_fill_info(struct acpi_resource *ares, void *data)
 {
 	struct i2c_acpi_lookup *lookup = data;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3eb60a2e9e61..2ce3efbe9198 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1010,6 +1010,7 @@ struct acpi_resource_i2c_serialbus;
 #if IS_ENABLED(CONFIG_ACPI)
 bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 			       struct acpi_resource_i2c_serialbus **i2c);
+int i2c_acpi_client_count(struct acpi_device *adev);
 u32 i2c_acpi_find_bus_speed(struct device *dev);
 struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 				       struct i2c_board_info *info);
@@ -1020,6 +1021,10 @@ static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 {
 	return false;
 }
+static inline int i2c_acpi_client_count(struct acpi_device *adev)
+{
+	return 0;
+}
 static inline u32 i2c_acpi_find_bus_speed(struct device *dev)
 {
 	return 0;
-- 
2.31.1

