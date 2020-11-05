Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E629F2A7875
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 09:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbgKEIA1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 03:00:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29594 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729417AbgKEIA0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 03:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604563225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cSCL9O0sLp/tw6Tt9q5kxfE0ulUwEY7xVodcysoHvLQ=;
        b=ggVccrXfSPaVZUNLC5BHhXvRiim2iRXgguIGBzLJl0u6+/GC4kGASWDIThGbkHx/Cnj395
        VCVB6mDcmums/DYWpjHgutxeetoX6/JwrieQvty1p8tYNeLzK7tllqdkJaFcqzL0YTgNnq
        slvW4KPz74xq89dOxw9wekRrn1jWSlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-4_1wsY_CMy-4x2OLGkP7XA-1; Thu, 05 Nov 2020 03:00:24 -0500
X-MC-Unique: 4_1wsY_CMy-4x2OLGkP7XA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A15486414C;
        Thu,  5 Nov 2020 08:00:22 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-73.ams2.redhat.com [10.36.113.73])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 37CF75DA76;
        Thu,  5 Nov 2020 08:00:21 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [RFC 3/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode to instantiated I2C-clients
Date:   Thu,  5 Nov 2020 09:00:13 +0100
Message-Id: <20201105080014.45410-4-hdegoede@redhat.com>
In-Reply-To: <20201105080014.45410-1-hdegoede@redhat.com>
References: <20201105080014.45410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The ACPI fwnode may contain additional info which is useful for the
I2C-driver. E.g. some accelerometer ACPI fwnode's contain an ACPI method
providing rotation/mount matrix info.

Pass the ACPI-fwnode to the instantiated I2C-clients by setting
i2c_board_info.fwnode, so that the I2C-drivers can access this info.

Now that we set i2c_board_info.irq to -ENOENT if there is no IRQ,
avoiding the I2C-core assigning the first IRQ described in the ACPI
resources to the client, this is safe to do.

Setting the fwnode also influences acpi_device_[uevent_]modalias and
acpi_dev_pm_attach, but these both call acpi_device_is_first_physical_node
and are a no-op if this returns false.

The first physical node for the ACPI fwnode is actually the ACPI core
instantiated platform-device to which the I2C-multi-instantiate driver
binds, so acpi_device_is_first_physical_node always returns false for
the instantiated I2C-clients and thus we can safely pass the fwnode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index cb4688bdd6b6..cbccfcbed44c 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -93,6 +93,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
 			 inst_data[i].type, i);
 		board_info.dev_name = name;
+		board_info.fwnode = dev->fwnode;
 		switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
 		case IRQ_RESOURCE_GPIO:
 			ret = acpi_dev_gpio_irq_get(adev, inst_data[i].irq_idx);
-- 
2.28.0

