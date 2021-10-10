Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D14D428304
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Oct 2021 20:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbhJJS7h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 Oct 2021 14:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52149 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232864AbhJJS70 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 Oct 2021 14:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633892247;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d9hXqE4PfEHC2XE9pWk7nPrDBu6IgElVFbyBeNUwwcI=;
        b=G5hWe+QVporfccFTV/35Ico1SPvtAxE4xm2Y8ZLxyWwz6D+thbFlp5C4odUS3k4NeSyCjS
        D0hWsRIjxsAdD9TxdXhACf68ua8vXJf8vLQK3paTI0EvWExX90YN+1MJmMV/LGfxJdI/S6
        zZ3UYNYshq1zMAZeNQWT6cu9a1ATRE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-mxAbbdePNGqmKNziFxOabg-1; Sun, 10 Oct 2021 14:57:24 -0400
X-MC-Unique: mxAbbdePNGqmKNziFxOabg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 895FA8145F5;
        Sun, 10 Oct 2021 18:57:21 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.6])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EBFB85F4E1;
        Sun, 10 Oct 2021 18:57:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 02/11] i2c: acpi: Use acpi_dev_ready_for_enumeration() helper
Date:   Sun, 10 Oct 2021 20:56:58 +0200
Message-Id: <20211010185707.195883-3-hdegoede@redhat.com>
In-Reply-To: <20211010185707.195883-1-hdegoede@redhat.com>
References: <20211010185707.195883-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The clk and regulator frameworks expect clk/regulator consumer-devices
to have info about the consumed clks/regulators described in the device's
fw_node.

To work around cases where this info is not present in the firmware tables,
which is often the case on x86/ACPI devices, both frameworks allow the
provider-driver to attach info about consumers to the clks/regulators
when registering these.

This causes problems with the probe ordering wrt drivers for consumers
of these clks/regulators. Since the lookups are only registered when the
provider-driver binds, trying to get these clks/regulators before then
results in a -ENOENT error for clks and a dummy regulator for regulators.

To ensure the correct probe-ordering the ACPI core has code to defer the
enumeration of consumers affected by this until the providers are ready.

Call the new acpi_dev_ready_for_enumeration() helper to avoid
enumerating / instantiating i2c-clients too early.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/i2c-core-acpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index aaeeacc12121..688cc71d650d 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -144,9 +144,12 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 	struct list_head resource_list;
 	int ret;
 
-	if (acpi_bus_get_status(adev) || !adev->status.present)
+	if (acpi_bus_get_status(adev))
 		return -EINVAL;
 
+	if (!acpi_dev_ready_for_enumeration(adev))
+		return -ENODEV;
+
 	if (acpi_match_device_ids(adev, i2c_acpi_ignored_device_ids) == 0)
 		return -ENODEV;
 
-- 
2.31.1

