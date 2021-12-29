Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20FB1481786
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhL2XOz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36702 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232885AbhL2XOu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p84vWGCfusCe1iBvjdh7SvqtlDz1+V7XQUiWOki+y5c=;
        b=YCj9ZLN6pbMwFj7zZdUnGYKFi6f7AsegM1HIFOb5LMEdfTMYwdj0jKrdkPNJENpA/uI9c+
        rixo6hajZa4haV/51iS7Duj6N58xYlh4THiBSc+BAFaSvrQdSP88clmnNqmlIWqRKOU9ta
        6lWejjRDfdX3QXGTraON/c224iNgLUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-AGiciW92PJSbiZxVbaOcXg-1; Wed, 29 Dec 2021 18:14:46 -0500
X-MC-Unique: AGiciW92PJSbiZxVbaOcXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 250211023F4D;
        Wed, 29 Dec 2021 23:14:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 770041037F5B;
        Wed, 29 Dec 2021 23:14:41 +0000 (UTC)
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
Subject: [PATCH 03/12] serdev: Do not instantiate serdevs on boards with known bogus DSDT entries
Date:   Thu, 30 Dec 2021 00:14:22 +0100
Message-Id: <20211229231431.437982-4-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

x86 ACPI devices which ship with only Android as their factory image use
older kernels which do not yet support ACPI serdev enumeration, as such
the serdev information in their ACPI tables is not reliable.

For example on the Asus ME176C tablet the serdev describing the Bluetooth
HCI points to the serdev_controller connected to the GPS and the other way
around.

Use the new acpi_quirk_skip_serdev_enumeration() helper to identify
known boards with this issue and then either abort adding the serdev
controller (creating a tty cdev instead) or only create the controller
leaving the instantation of the serdev itself up to platform code.

In the case where only the serdev controller is created the necessary
serdevs will instead be instantiated by the
drivers/platform/x86/x86-android-tablets.c kernel module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/tty/serdev/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index f1324fe99378..92e3433276f8 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -727,10 +727,24 @@ static acpi_status acpi_serdev_add_device(acpi_handle handle, u32 level,
 static int acpi_serdev_register_devices(struct serdev_controller *ctrl)
 {
 	acpi_status status;
+	bool skip;
+	int ret;
 
 	if (!has_acpi_companion(ctrl->dev.parent))
 		return -ENODEV;
 
+	/*
+	 * Skip registration on boards where the ACPI tables are known to
+	 * contain buggy devices. Note serdev_controller_add() must still
+	 * succeed in this case, so that the proper serdev devices can be
+	 * added "manually" later.
+	 */
+	ret = acpi_quirk_skip_serdev_enumeration(ctrl->dev.parent, &skip);
+	if (ret)
+		return ret;
+	if (skip)
+		return 0;
+
 	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
 				     SERDEV_ACPI_MAX_SCAN_DEPTH,
 				     acpi_serdev_add_device, NULL, ctrl, NULL);
-- 
2.33.1

