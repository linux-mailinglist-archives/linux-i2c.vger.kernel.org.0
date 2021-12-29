Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8993481790
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbhL2XO7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:14:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38830 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232966AbhL2XO7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nWKufP374NhpThr/0fTXnkcGUPKHZvuRN8HwgZ8t+PU=;
        b=de9zhth/6t16BTDircD484HfFHCj1jkrjcZxnN/JCbaFvkPOt/MkDquLi01+5XKU2kk6EN
        h6r0aCPqMucCMd7QiG6Q7DidZt1LJSbi8Lp1na1fUfFDllmanhLv/tnan8gCRX4WKdjKqa
        +Pd8I6RWNkfUOAEjQo+u/D2plDOm7JI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-_D-Hae6vM6C9r5vzHt2pGg-1; Wed, 29 Dec 2021 18:14:55 -0500
X-MC-Unique: _D-Hae6vM6C9r5vzHt2pGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E8E380BCA8;
        Wed, 29 Dec 2021 23:14:53 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D4C2A1037F5B;
        Wed, 29 Dec 2021 23:14:50 +0000 (UTC)
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
Subject: [PATCH 06/12] platform/x86: x86-android-tablets: Add support for instantiating platform-devs
Date:   Thu, 30 Dec 2021 00:14:25 +0100
Message-Id: <20211229231431.437982-7-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for instantiating platform-devs, note this also makes some
small changes to the i2c_client instantiating code to make the 2 flows
identical.

Specifically for the pdevs flow pdev_count must only be set after
allocating the pdevs array, to avoid a NULL ptr deref in
x86_android_tablet_cleanup() and the i2c_clients flow is updated
to work the same way.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 36 ++++++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 44138882bc9f..4bcad05d4039 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -20,6 +20,7 @@
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
 #include <linux/string.h>
 /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
 #include "../../gpio/gpiolib.h"
@@ -128,7 +129,9 @@ struct x86_i2c_client_info {
 
 struct x86_dev_info {
 	const struct x86_i2c_client_info *i2c_client_info;
+	const struct platform_device_info *pdev_info;
 	int i2c_client_count;
+	int pdev_count;
 };
 
 /*
@@ -269,7 +272,9 @@ static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 MODULE_DEVICE_TABLE(dmi, x86_android_tablet_ids);
 
 static int i2c_client_count;
+static int pdev_count;
 static struct i2c_client **i2c_clients;
+static struct platform_device **pdevs;
 
 static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
 					     int idx)
@@ -309,6 +314,11 @@ static void x86_android_tablet_cleanup(void)
 {
 	int i;
 
+	for (i = 0; i < pdev_count; i++)
+		platform_device_unregister(pdevs[i]);
+
+	kfree(pdevs);
+
 	for (i = 0; i < i2c_client_count; i++)
 		i2c_unregister_device(i2c_clients[i]);
 
@@ -327,21 +337,35 @@ static __init int x86_android_tablet_init(void)
 
 	dev_info = id->driver_data;
 
-	i2c_client_count = dev_info->i2c_client_count;
-
-	i2c_clients = kcalloc(i2c_client_count, sizeof(*i2c_clients), GFP_KERNEL);
+	i2c_clients = kcalloc(dev_info->i2c_client_count, sizeof(*i2c_clients), GFP_KERNEL);
 	if (!i2c_clients)
 		return -ENOMEM;
 
-	for (i = 0; i < dev_info->i2c_client_count; i++) {
+	i2c_client_count = dev_info->i2c_client_count;
+	for (i = 0; i < i2c_client_count; i++) {
 		ret = x86_instantiate_i2c_client(dev_info, i);
 		if (ret < 0) {
 			x86_android_tablet_cleanup();
-			break;
+			return ret;
+		}
+	}
+
+	pdevs = kcalloc(dev_info->pdev_count, sizeof(*pdevs), GFP_KERNEL);
+	if (!pdevs) {
+		x86_android_tablet_cleanup();
+		return -ENOMEM;
+	}
+
+	pdev_count = dev_info->pdev_count;
+	for (i = 0; i < pdev_count; i++) {
+		pdevs[i] = platform_device_register_full(&dev_info->pdev_info[i]);
+		if (IS_ERR(pdevs[i])) {
+			x86_android_tablet_cleanup();
+			return PTR_ERR(pdevs[i]);
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 module_init(x86_android_tablet_init);
-- 
2.33.1

