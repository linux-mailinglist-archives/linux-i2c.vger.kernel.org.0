Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E822A7871
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 09:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbgKEIAY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 03:00:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58292 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729417AbgKEIAX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 03:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604563222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ppIkeNqrQXwJdt2qFiq6mkdhN5t6W9eweFCWsL70/gw=;
        b=MX2WGECcB9ppMD4Xbl+Bq0DPUfbVYgKqBB0BhVruLECW+iuTAnc2jnd2VMaI/MZnnq/d1i
        Yfq4qQ58F1u1GQURzBAfXDldWjYyT0+F3x5Q9+RQCZANe/n4a+z2RnI4Qf29JYkanEwWks
        4zvWPBRrDSHRTT0pdCrp8Ak4EHIm2/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-BYT2nQZDMJ2OwZmL9xbmrQ-1; Thu, 05 Nov 2020 03:00:20 -0500
X-MC-Unique: BYT2nQZDMJ2OwZmL9xbmrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2989364149;
        Thu,  5 Nov 2020 08:00:19 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-73.ams2.redhat.com [10.36.113.73])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B1C2F5DA79;
        Thu,  5 Nov 2020 08:00:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [RFC 1/4] i2c: core: Allow i2c_board_info to specify that the core should not try to find an IRQ
Date:   Thu,  5 Nov 2020 09:00:11 +0100
Message-Id: <20201105080014.45410-2-hdegoede@redhat.com>
In-Reply-To: <20201105080014.45410-1-hdegoede@redhat.com>
References: <20201105080014.45410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When I2C devices are enumerated/instantiated through ACPI tables then
a single ACPI device may describe multiple separate I2C connected ICs.

This is handled by the drivers/platform/x86/i2c-multi-instantiate.c
code which contains a table which maps the ACPI-device-id to the
information necessary to instantiate the i2c-clients (type and IRQ
routing for each described IC).

In some cases the i2c-driver may need access to the ACPI-fwnode as
that may contain ACPI-methods supplying e.g. orientation-matrix info
for accelerometers.

Currently setting i2c_board_info.fwnode to point to the ACPI-fwnode
will cause the i2c-core to call i2c_acpi_get_irq() for any i2c-clients
for which i2c-multi-instantiate.c has not passed an IRQ in
i2c_board_info.irq, messing up the IRQ routing done by
i2c-multi-instantiate.c.

Make i2c_device_probe() accept a client->init_irq value < 0 to skip
the i2c-core IRQ handling, while still setting client->irq to 0
after checking for this, since most i2c-drivers expect client->irq == 0
for clients without an IRQ.

This allows i2c-multi-instantiate.c to set i2c_board_info.irq = -ENOENT
for clients without an IRQ and pass the ACPI-fwnode without issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/i2c-core-base.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 573b5da145d1..1887e2267031 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -467,11 +467,10 @@ static int i2c_device_probe(struct device *dev)
 			goto put_sync_adapter;
 		}
 
-		if (irq < 0)
-			irq = 0;
-
 		client->irq = irq;
 	}
+	if (client->irq < 0)
+		client->irq = 0;
 
 	driver = to_i2c_driver(dev->driver);
 
-- 
2.28.0

