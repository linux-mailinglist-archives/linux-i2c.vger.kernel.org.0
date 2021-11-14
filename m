Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E2C44F94C
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Nov 2021 18:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236176AbhKNRHJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Nov 2021 12:07:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26543 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236184AbhKNRHH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Nov 2021 12:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636909452;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z0PtzQUpE4e+rg3mkfPABfZsN9EZ2U/8QQiDQfDb9rE=;
        b=h1gej2NAtE87Uk6FpkHgZbHr7X5nah5xMNBwOCMU2y8d7MoGTGS6WxyDE7fSi5OSCUkp2C
        MR13uGgUPYvG3H/ZGASMguJlhJ8fp4g5/pXWWo7qmrRk6TbUIBEKLCMRRnW1TVNTaHd17H
        DQ8/QWqkxJ0tFVJwjX9B6+fWi1ZA2nY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-spOxP1pDOqWTG9O659uzYg-1; Sun, 14 Nov 2021 12:04:09 -0500
X-MC-Unique: spOxP1pDOqWTG9O659uzYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DABA98005A2;
        Sun, 14 Nov 2021 17:04:06 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5723B1346F;
        Sun, 14 Nov 2021 17:04:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-efi@vger.kernel.org
Subject: [PATCH v2 07/20] power: supply: bq25890: Add support to read back the settings from the chip
Date:   Sun, 14 Nov 2021 18:03:22 +0100
Message-Id: <20211114170335.66994-8-hdegoede@redhat.com>
In-Reply-To: <20211114170335.66994-1-hdegoede@redhat.com>
References: <20211114170335.66994-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On most X86/ACPI devices there is no devicetree to supply the necessary
init-data. Instead the firmware already fully initializes the bq25890
charger at boot. To support this, add support for reading back the
settings from the chip through a new "linux,read-back-settings" boolean.

So far this new property is only used on X86/ACPI (non devicetree) devs,
IOW it is not used in actual devicetree files. The devicetree-bindings
maintainers have requested properties like these to not be added to the
devicetree-bindings, so the new property is deliberately not added
to the existing devicetree-bindings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this series, together with the "linux,skip-reset" patch
  this patch replaces the "ti,skip-init" patch from v1
---
 drivers/power/supply/bq25890_charger.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/supply/bq25890_charger.c
index 864904d7eaeb..b7c38d2c5ede 100644
--- a/drivers/power/supply/bq25890_charger.c
+++ b/drivers/power/supply/bq25890_charger.c
@@ -111,6 +111,7 @@ struct bq25890_device {
 	struct regmap_field *rmap_fields[F_MAX_FIELDS];
 
 	bool skip_reset;
+	bool read_back_init_data;
 	enum bq25890_chip_version chip_version;
 	struct bq25890_init_data init_data;
 	struct bq25890_state state;
@@ -666,7 +667,7 @@ static int bq25890_chip_reset(struct bq25890_device *bq)
 
 static int bq25890_rw_init_data(struct bq25890_device *bq)
 {
-	bool write = true;
+	bool write = !bq->read_back_init_data;
 	int ret;
 	int i;
 
@@ -950,6 +951,10 @@ static int bq25890_fw_probe(struct bq25890_device *bq)
 	struct bq25890_init_data *init = &bq->init_data;
 
 	bq->skip_reset = device_property_read_bool(bq->dev, "linux,skip-reset");
+	bq->read_back_init_data = device_property_read_bool(bq->dev,
+						"linux,read-back-settings");
+	if (bq->read_back_init_data)
+		return 0;
 
 	ret = bq25890_fw_read_u32_props(bq);
 	if (ret < 0)
-- 
2.31.1

