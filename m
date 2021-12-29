Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19CC4817A1
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbhL2XPQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:15:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20574 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233066AbhL2XPK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YaOERAhz5gEYQqKdUJtka0C6oqig4K3JsI+0f7a2Rlg=;
        b=C6+T9HZ4NH7SGmON8aXpmHPnr94Kb81fXRYNzcI6Rq7IhU9XjZ92FH9VM1MuJiDGBm5Lou
        kBZHjxyTtG21NNCVPvuMfDucyoaIfGivcipQWra2iWw9P8LgY5keofulKpX6hWHgrEnbrg
        g0NuiVqrjpmIzz1IAD/zoYQ8S6TzlDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-Wb0PuB8EPFmpdMLPRCo_iA-1; Wed, 29 Dec 2021 18:15:04 -0500
X-MC-Unique: Wb0PuB8EPFmpdMLPRCo_iA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96C5F1006AA5;
        Wed, 29 Dec 2021 23:15:02 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DC03E1037F5B;
        Wed, 29 Dec 2021 23:14:59 +0000 (UTC)
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
Subject: [PATCH 09/12] platform/x86: x86-android-tablets: Add support for preloading modules
Date:   Thu, 30 Dec 2021 00:14:28 +0100
Message-Id: <20211229231431.437982-10-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since the x86-android-tablets code does all it work from module_init() it
cannot use -EPROBE_DEFER to wait for e.g. interrupt providing GPIO-chips
or PMIC-cells to show up.

To make sure things will still work when some necessary resource providers
are build as module allow the per board info to specify a list of modules
to pre-load before instantiating the I2C clients.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 0b521e4671aa..3c01c8607c26 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -142,6 +142,7 @@ struct x86_serdev_info {
 };
 
 struct x86_dev_info {
+	const char * const *modules;
 	struct gpiod_lookup_table **gpiod_lookup_tables;
 	const struct x86_i2c_client_info *i2c_client_info;
 	const struct platform_device_info *pdev_info;
@@ -428,6 +429,13 @@ static __init int x86_android_tablet_init(void)
 
 	dev_info = id->driver_data;
 
+	/*
+	 * Since this runs from module_init() it cannot use -EPROBE_DEFER,
+	 * instead pre-load any modules which are listed as requirements.
+	 */
+	for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
+		request_module(dev_info->modules[i]);
+
 	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
 	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
 		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
-- 
2.33.1

