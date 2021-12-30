Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7210B481CF9
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 15:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239941AbhL3ORn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 09:17:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58991 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239932AbhL3ORm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 09:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640873862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jeUWaD4C7Xw8YxAJztXWyrmTBsLFjXBdOena7jeTCnc=;
        b=acltDCCdkGEtJZPuHxTug12EcXf/PZPc5veDveprVuxSqqcrp93RaAKDM5wXEfPT/Jgo18
        DboOhoqEahqwBlek3VC1y0a+jqsI7amH68/zrIeCW4nPIs3Lnyos52LtZBHzXAEvPZGwnm
        m3vMfR7EkLjAJYPTJJWWau65IXG5XSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-vS7jIZ4TP62lkGcM93uqow-1; Thu, 30 Dec 2021 09:17:37 -0500
X-MC-Unique: vS7jIZ4TP62lkGcM93uqow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A642102C886;
        Thu, 30 Dec 2021 14:17:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.254])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2627BB69;
        Thu, 30 Dec 2021 14:17:32 +0000 (UTC)
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
Subject: [PATCH v2 2/3] i2c: acpi: Do not instantiate I2C-clients on boards with known bogus DSDT entries
Date:   Thu, 30 Dec 2021 15:17:21 +0100
Message-Id: <20211230141722.512395-3-hdegoede@redhat.com>
In-Reply-To: <20211230141722.512395-1-hdegoede@redhat.com>
References: <20211230141722.512395-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

x86 ACPI devices which ship with only Android as their factory image
usually declare a whole bunch of bogus I2C devices in their ACPI tables.

Instantiating I2C clients for these bogus devices causes various issues,
e.g. GPIO/IRQ resource conflicts because sometimes drivers do bind to them.
The Android x86 kernel fork shipped on these devices has some special code
to remove these bogus devices, instead of just fixing the DSDT <sigh>.

Use the new acpi_quirk_skip_i2c_client_enumeration() helper to identify
known boards / acpi devices with this issue, and skip enumerating these.

Note these boards typically do actually have I2C devices, just
different ones then the ones described in their DSDT. The devices
which are actually present are manually instantiated by the
drivers/platform/x86/x86-android-tablets.c kernel module.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Drop the i2c_acpi_known_good_ids[] list, this is now checked by
  acpi_quirk_skip_i2c_client_enumeration()
---
 drivers/i2c/i2c-core-acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index c87ce2276007..85ed4c1d4924 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -257,6 +257,13 @@ static void i2c_acpi_register_device(struct i2c_adapter *adapter,
 				     struct acpi_device *adev,
 				     struct i2c_board_info *info)
 {
+	/*
+	 * Skip registration on boards where the ACPI tables are
+	 * known to contain bogus I2C devices.
+	 */
+	if (acpi_quirk_skip_i2c_client_enumeration(adev))
+		return;
+
 	adev->power.flags.ignore_parent = true;
 	acpi_device_set_enumerated(adev);
 
-- 
2.33.1

