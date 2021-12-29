Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1F0481787
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbhL2XOy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58252 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232950AbhL2XOt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f/KxuUwqSDgu6nKbmvYSFjyNtDRk853uLOk7lYxBAXI=;
        b=Cs043RJWHjnbm/dGvqfNfDMsJkBokW4algBAEM3BI6RhzYogoQfnRwGVrzJyRXn6vucIfZ
        gEgqo7+2qnFd9ObRpbtq2yuGsLvXw7nNthw2Xsjw7/eyNRwJkWyLSaaB1n7TBxZ54M8b13
        eAE9iXVv1emibV8/JFnnKVTUE7yNfFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-sNtRykuCONm6o_wr_h0umQ-1; Wed, 29 Dec 2021 18:14:43 -0500
X-MC-Unique: sNtRykuCONm6o_wr_h0umQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F147801ADC;
        Wed, 29 Dec 2021 23:14:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 66D131037F5B;
        Wed, 29 Dec 2021 23:14:38 +0000 (UTC)
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
Subject: [PATCH 02/12] i2c: acpi: Do not instantiate I2C-clients on boards with known bogus DSDT entries
Date:   Thu, 30 Dec 2021 00:14:21 +0100
Message-Id: <20211229231431.437982-3-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

x86 ACPI devices which ship with only Android as their factory image
usually declare a whole bunch of bogus I2C devices in their ACPI tables.

Instantiating I2C clients for these bogus devices causes various issues,
e.g. GPIO/IRQ resource conflicts because sometimes drivers do bind to them.
The Android x86 kernel fork shipped on these devices has some special code
to remove these bogus devices, instead of just fixing the DSDT <sigh>.

Use the new acpi_quirk_skip_i2c_client_enumeration() helper to
identify known boards with this issue, and on these boards ignore I2C
devices described in ACPI, with a few exceptions which are known to
always be correct (and in case of the audio-codecs where the drivers
heavily rely on the codec being enumerated through ACPI).

Note these boards typically do actually have I2C devices, just
different ones then the ones described in their DSDT. The devices
which are actually present are manually instantiated by the
drivers/platform/x86/x86-android-tablets.c kernel module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/i2c-core-acpi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index c87ce2276007..8b5b0161d3b2 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -253,10 +253,27 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 	return 0;
 }
 
+static const struct acpi_device_id i2c_acpi_known_good_ids[] = {
+	{ "10EC5640", 0 }, /* RealTek ALC5640 audio codec */
+	{ "INT33F4", 0 },  /* X-Powers AXP288 PMIC */
+	{ "INT33FD", 0 },  /* Intel Crystal Cove PMIC */
+	{ "NPCE69A", 0 },  /* Asus Transformer keyboard dock */
+	{}
+};
+
 static void i2c_acpi_register_device(struct i2c_adapter *adapter,
 				     struct acpi_device *adev,
 				     struct i2c_board_info *info)
 {
+	/*
+	 * Skip registration on boards where the ACPI tables are known
+	 * to contain bogus I2C devices, with the exception of devices
+	 * on the known good list.
+	 */
+	if (acpi_quirk_skip_i2c_client_enumeration() &&
+	    acpi_match_device_ids(adev, i2c_acpi_known_good_ids) != 0)
+		return;
+
 	adev->power.flags.ignore_parent = true;
 	acpi_device_set_enumerated(adev);
 
-- 
2.33.1

