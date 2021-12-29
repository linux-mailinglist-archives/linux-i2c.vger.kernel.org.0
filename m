Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE0E48179B
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbhL2XPI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27126 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233046AbhL2XPF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819705;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=78qbKzSRlBLezZMe+jjN1+dBw0kbIqzQU58dLMQHOIE=;
        b=dm77NlzTKQCEE6WW/nTH4X3wqi6yRSRp56fWlNsKj6qEzHfUEeAwM/cWUR9nqWvWwH+xTh
        Yu5GCtWVm1UW985OecwK8v9+hUy3oMfqmaF5Vz7kx9gRlhS3l9cjN2XPH4ACl701BvL+Xg
        p653YItip4CECL7qjFaKd211hlL5Ty4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-h54cFfG7MKGw6_2FSLq9uQ-1; Wed, 29 Dec 2021 18:15:01 -0500
X-MC-Unique: h54cFfG7MKGw6_2FSLq9uQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9460980BCA8;
        Wed, 29 Dec 2021 23:14:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EACAE1037F5B;
        Wed, 29 Dec 2021 23:14:56 +0000 (UTC)
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
Subject: [PATCH 08/12] platform/x86: x86-android-tablets: Add support for registering GPIO lookup tables
Date:   Thu, 30 Dec 2021 00:14:27 +0100
Message-Id: <20211229231431.437982-9-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for registering GPIO lookup tables.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 5267e57c4fea..0b521e4671aa 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -142,6 +142,7 @@ struct x86_serdev_info {
 };
 
 struct x86_dev_info {
+	struct gpiod_lookup_table **gpiod_lookup_tables;
 	const struct x86_i2c_client_info *i2c_client_info;
 	const struct platform_device_info *pdev_info;
 	const struct x86_serdev_info *serdev_info;
@@ -293,6 +294,7 @@ static int serdev_count;
 static struct i2c_client **i2c_clients;
 static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
+static struct gpiod_lookup_table **gpiod_lookup_tables;
 
 static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
 					     int idx)
@@ -409,6 +411,9 @@ static void x86_android_tablet_cleanup(void)
 		i2c_unregister_device(i2c_clients[i]);
 
 	kfree(i2c_clients);
+
+	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
+		gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
 }
 
 static __init int x86_android_tablet_init(void)
@@ -423,6 +428,10 @@ static __init int x86_android_tablet_init(void)
 
 	dev_info = id->driver_data;
 
+	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
+	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
+		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
+
 	i2c_clients = kcalloc(dev_info->i2c_client_count, sizeof(*i2c_clients), GFP_KERNEL);
 	if (!i2c_clients)
 		return -ENOMEM;
-- 
2.33.1

