Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB56F2E00CE
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Dec 2020 20:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgLUTOe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Dec 2020 14:14:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22244 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726504AbgLUTOe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Dec 2020 14:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608577988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mrVDB9kShOjxrbhbFLrKZcgNDJTJ7+1Yk+kpVt3L0gU=;
        b=ZdwGs3FsP0DNJ0iWMlE9KGRDM+wGyNLGC6rl9q4yY3nVmZsYehCAfSH3Jo50U4KdPMiVIq
        2l6NjKBY+iPjou26ligbSHV+6/CD1JRlwRrJCynfZG6/QLgXDVA5P1ic+w5hQlUYdY1JLa
        rgtAYR9gb0Y3rBue0XJUX1mDvCDh6h4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-o28lj1lmNiiBGvm5Qt89zw-1; Mon, 21 Dec 2020 14:13:04 -0500
X-MC-Unique: o28lj1lmNiiBGvm5Qt89zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F8BE800D53;
        Mon, 21 Dec 2020 19:13:03 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-12.ams2.redhat.com [10.36.115.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BA2781002393;
        Mon, 21 Dec 2020 19:13:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH] i2c: core: Do not print duplicate error when failing to register an i2c-client from ACPI
Date:   Mon, 21 Dec 2020 20:13:00 +0100
Message-Id: <20201221191300.244648-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_new_client_device() already prints an error when it fails. Some
ACPI tables contain 2 ACPI devices describing the same i2c-client,
leading to errors like this:

[    1.620847] i2c i2c-4: Failed to register i2c client MAGN0001:00 at 0x1d (-16)
[    1.620870] i2c i2c-4: failed to add I2C device MAGN0001:00 from ACPI

There is nothing we can do about the first -EBUSY error being logged,
but the second error does not really add any new information, so lets
drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/i2c-core-acpi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 37c510d9347a..8ceaa88dd78f 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -225,12 +225,8 @@ static void i2c_acpi_register_device(struct i2c_adapter *adapter,
 	adev->power.flags.ignore_parent = true;
 	acpi_device_set_enumerated(adev);
 
-	if (IS_ERR(i2c_new_client_device(adapter, info))) {
+	if (IS_ERR(i2c_new_client_device(adapter, info)))
 		adev->power.flags.ignore_parent = false;
-		dev_err(&adapter->dev,
-			"failed to add I2C device %s from ACPI\n",
-			dev_name(&adev->dev));
-	}
 }
 
 static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
-- 
2.28.0

