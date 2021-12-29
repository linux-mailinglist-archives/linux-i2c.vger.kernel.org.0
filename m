Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79C7481799
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbhL2XPF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:15:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24696 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233003AbhL2XPE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819704;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XIhdvhVtCshP9lG99pn9JFFX/4evBCpxB0Ih0vEO5mU=;
        b=dhrjUZNv3xzMJ93DdAJQykmy5Y/zSOzo9l+jHzUwWR4i2fjFlmqRnrlfWAzvK8ZDG8TG1J
        qxCoW6yBcZKDdksdf/GRhpRElpMlfRbqVspyhK2o00vNYx6gdgTcSdK9H4W8MD4FIrv3IO
        KaszFXh+Fbq0BY7/V3oy9X/lwt5ERto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-4-fL-lQzNDuj1uj9hr5zzA-1; Wed, 29 Dec 2021 18:14:58 -0500
X-MC-Unique: 4-fL-lQzNDuj1uj9hr5zzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A00D01006AA0;
        Wed, 29 Dec 2021 23:14:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C82271037F5B;
        Wed, 29 Dec 2021 23:14:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Subject: [PATCH 07/12] platform/x86: x86-android-tablets: Add support for instantiating serdevs
Date:   Thu, 30 Dec 2021 00:14:26 +0100
Message-Id: <20211229231431.437982-8-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for instantiating serdevs, this is necessary on some boards
where the serdev info in the DSDT has issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig               |   2 +-
 drivers/platform/x86/x86-android-tablets.c | 101 +++++++++++++++++++++
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 56efe336a690..8e55529f285c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1027,7 +1027,7 @@ config TOUCHSCREEN_DMI
 
 config X86_ANDROID_TABLETS
 	tristate "X86 Android tablet support"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && SERIAL_DEV_BUS && ACPI && GPIOLIB
 	help
 	  X86 tablets which ship with Android as (part of) the factory image
 	  typically have various problems with their DSDTs. The factory kernels
diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 4bcad05d4039..5267e57c4fea 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/serdev.h>
 #include <linux/string.h>
 /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
 #include "../../gpio/gpiolib.h"
@@ -127,11 +128,26 @@ struct x86_i2c_client_info {
 	struct x86_acpi_irq_data irq_data;
 };
 
+struct x86_serdev_info {
+	const char *ctrl_hid;
+	const char *ctrl_uid;
+	const char *ctrl_devname;
+	/*
+	 * ATM the serdev core only supports of or ACPI matching; and sofar all
+	 * Android x86 tablets DSDTs have usable serdev nodes, but sometimes
+	 * under the wrong controller. So we just tie the existing serdev ACPI
+	 * node to the right controller.
+	 */
+	const char *serdev_hid;
+};
+
 struct x86_dev_info {
 	const struct x86_i2c_client_info *i2c_client_info;
 	const struct platform_device_info *pdev_info;
+	const struct x86_serdev_info *serdev_info;
 	int i2c_client_count;
 	int pdev_count;
+	int serdev_count;
 };
 
 /*
@@ -273,8 +289,10 @@ MODULE_DEVICE_TABLE(dmi, x86_android_tablet_ids);
 
 static int i2c_client_count;
 static int pdev_count;
+static int serdev_count;
 static struct i2c_client **i2c_clients;
 static struct platform_device **pdevs;
+static struct serdev_device **serdevs;
 
 static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
 					     int idx)
@@ -310,10 +328,78 @@ static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info
 	return 0;
 }
 
+static __init int x86_instantiate_serdev(const struct x86_serdev_info *info, int idx)
+{
+	struct acpi_device *ctrl_adev, *serdev_adev;
+	struct serdev_device *serdev;
+	struct device *ctrl_dev;
+	int ret = -ENODEV;
+
+	ctrl_adev = acpi_dev_get_first_match_dev(info->ctrl_hid, info->ctrl_uid, -1);
+	if (!ctrl_adev) {
+		pr_err("error could not get %s/%s ctrl adev\n",
+		       info->ctrl_hid, info->ctrl_uid);
+		return -ENODEV;
+	}
+
+	serdev_adev = acpi_dev_get_first_match_dev(info->serdev_hid, NULL, -1);
+	if (!serdev_adev) {
+		pr_err("error could not get %s serdev adev\n", info->serdev_hid);
+		goto put_ctrl_adev;
+	}
+
+	/* get_first_physical_node() returns a weak ref, no need to put() it */
+	ctrl_dev = acpi_get_first_physical_node(ctrl_adev);
+	if (!ctrl_dev)	{
+		pr_err("error could not get %s/%s ctrl physical dev\n",
+		       info->ctrl_hid, info->ctrl_uid);
+		goto put_serdev_adev;
+	}
+
+	/* ctrl_dev now points to the controller's parent, get the controller */
+	ctrl_dev = device_find_child_by_name(ctrl_dev, info->ctrl_devname);
+	if (!ctrl_dev) {
+		pr_err("error could not get %s/%s %s ctrl dev\n",
+		       info->ctrl_hid, info->ctrl_uid, info->ctrl_devname);
+		goto put_serdev_adev;
+	}
+
+	serdev = serdev_device_alloc(to_serdev_controller(ctrl_dev));
+	if (!serdev) {
+		ret = -ENOMEM;
+		goto put_serdev_adev;
+	}
+
+	ACPI_COMPANION_SET(&serdev->dev, serdev_adev);
+	acpi_device_set_enumerated(serdev_adev);
+
+	ret = serdev_device_add(serdev);
+	if (ret) {
+		dev_err(&serdev->dev, "error %d adding serdev\n", ret);
+		serdev_device_put(serdev);
+		goto put_serdev_adev;
+	}
+
+	serdevs[idx] = serdev;
+
+put_serdev_adev:
+	acpi_dev_put(serdev_adev);
+put_ctrl_adev:
+	acpi_dev_put(ctrl_adev);
+	return ret;
+}
+
 static void x86_android_tablet_cleanup(void)
 {
 	int i;
 
+	for (i = 0; i < serdev_count; i++) {
+		if (serdevs[i])
+			serdev_device_remove(serdevs[i]);
+	}
+
+	kfree(serdevs);
+
 	for (i = 0; i < pdev_count; i++)
 		platform_device_unregister(pdevs[i]);
 
@@ -365,6 +451,21 @@ static __init int x86_android_tablet_init(void)
 		}
 	}
 
+	serdevs = kcalloc(dev_info->serdev_count, sizeof(*serdevs), GFP_KERNEL);
+	if (!serdevs) {
+		x86_android_tablet_cleanup();
+		return -ENOMEM;
+	}
+
+	serdev_count = dev_info->serdev_count;
+	for (i = 0; i < serdev_count; i++) {
+		ret = x86_instantiate_serdev(&dev_info->serdev_info[i], i);
+		if (ret < 0) {
+			x86_android_tablet_cleanup();
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.33.1

