Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6432481788
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbhL2XO4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:14:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28201 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233007AbhL2XOy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KCyNGTWQthftXJQbLRz2bhS7M/+WOlxSrAfwl1X13gs=;
        b=TTeYkplJBbSYBouuO5o5O0DIKJrn2xG7YiMMclSG8ZgSeECEf0qM8La89BoJL1gs89+ic+
        MrJ4dSLkCZf8oAPkcccVHe+o/7if4YKJIIJ2OFiLKj8WMCxutMRjsX4tn2MiJys+/DFDA6
        MwH38xldiAN17Hi6X4ph36q40MItDWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-tZd7ZHIDPiKbNopPIwAaCA-1; Wed, 29 Dec 2021 18:14:49 -0500
X-MC-Unique: tZd7ZHIDPiKbNopPIwAaCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FF401006AA0;
        Wed, 29 Dec 2021 23:14:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9BB1037F5B;
        Wed, 29 Dec 2021 23:14:44 +0000 (UTC)
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
Subject: [PATCH 04/12] platform/x86: x86-android-tablets: Don't return -EPROBE_DEFER from a non probe() function
Date:   Thu, 30 Dec 2021 00:14:23 +0100
Message-Id: <20211229231431.437982-5-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The x86-android-tablets code all runs from module_init, so returning
-EPROBE_DEFER is not appropriate. Instead log an error and bail.

This path should never get hit since PINCTRL_BAYTRAIL is a bool.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 4a04da27a3f4..ea033d7f4439 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -63,8 +63,10 @@ static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
 	case X86_ACPI_IRQ_TYPE_GPIOINT:
 		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
 		chip = gpiochip_find(data->chip, x86_acpi_irq_helper_gpiochip_find);
-		if (!chip)
-			return -EPROBE_DEFER;
+		if (!chip) {
+			pr_err("error cannot find GPIO chip %s\n", data->chip);
+			return -ENODEV;
+		}
 
 		gpiod = gpiochip_get_desc(chip, data->index);
 		if (IS_ERR(gpiod)) {
-- 
2.33.1

