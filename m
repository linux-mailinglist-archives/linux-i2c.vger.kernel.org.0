Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFAA74392DA
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 11:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbhJYJpQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 05:45:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48121 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232733AbhJYJor (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 05:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635154945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8TG/m1xy5lKMYRof/wOjRdTXYFvHVanzhuJoPsi2H+4=;
        b=EKp1erala8wonBmvO9xdv9PIjg9QssVyG23RVbmOJdDDFBgWBYaF7TgAai7f/3nkNnUkFF
        UQqg47RWWccRed6YfZTx8Cg4YpU2MhPn2jRpAyjrrEH7zZICpGtHpyElubz9GhndmLn03h
        hfRNMKiI4VVIWpyV0dUg+mMCZC3lBnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-jjM1UFkrPJKl8QL3JYNEkQ-1; Mon, 25 Oct 2021 05:42:20 -0400
X-MC-Unique: jjM1UFkrPJKl8QL3JYNEkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF7028066F5;
        Mon, 25 Oct 2021 09:42:17 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CD70360BF4;
        Mon, 25 Oct 2021 09:42:12 +0000 (UTC)
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
Subject: [PATCH v4 09/11] platform/x86: int3472: Pass tps68470_clk_platform_data to the tps68470-regulator MFD-cell
Date:   Mon, 25 Oct 2021 11:41:17 +0200
Message-Id: <20211025094119.82967-10-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-1-hdegoede@redhat.com>
References: <20211025094119.82967-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Pass tps68470_clk_platform_data to the tps68470-clk MFD-cell,
so that sensors which use the TPS68470 can find their clock.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Update the comment about the cell ordering

Changes in v2:
- Put the GPIO cell last because acpi_gpiochip_add() calls
  acpi_dev_clear_dependencies() and the clk + regulators must
  be ready when this happens.
---
 drivers/platform/x86/intel/int3472/tps68470.c | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index e95b0f50b384..9c683faefb2e 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -5,6 +5,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps68470.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/tps68470.h>
 #include <linux/regmap.h>
 
 #include "common.h"
@@ -17,12 +18,6 @@ static const struct mfd_cell tps68470_cros[] = {
 	{ .name = "tps68470_pmic_opregion" },
 };
 
-static const struct mfd_cell tps68470_win[] = {
-	{ .name = "tps68470-gpio" },
-	{ .name = "tps68470-clk" },
-	{ .name = "tps68470-regulator" },
-};
-
 static const struct regmap_config tps68470_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -105,10 +100,17 @@ static int skl_int3472_tps68470_calc_type(struct acpi_device *adev)
 static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
+	struct tps68470_clk_platform_data clk_pdata = {};
+	struct mfd_cell *cells;
 	struct regmap *regmap;
 	int device_type;
 	int ret;
 
+	ret = skl_int3472_get_sensor_adev_and_name(&client->dev, NULL,
+						   &clk_pdata.consumer_dev_name);
+	if (ret)
+		return ret;
+
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
 		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
@@ -126,9 +128,25 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	device_type = skl_int3472_tps68470_calc_type(adev);
 	switch (device_type) {
 	case DESIGNED_FOR_WINDOWS:
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   tps68470_win, ARRAY_SIZE(tps68470_win),
+		cells = kcalloc(3, sizeof(*cells), GFP_KERNEL);
+		if (!cells)
+			return -ENOMEM;
+
+		/*
+		 * The order of the cells matters here! The clk must be first
+		 * because the regulator depends on it. The gpios must be last,
+		 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
+		 * the clk + regulators must be ready when this happens.
+		 */
+		cells[0].name = "tps68470-clk";
+		cells[0].platform_data = &clk_pdata;
+		cells[0].pdata_size = sizeof(clk_pdata);
+		cells[1].name = "tps68470-regulator";
+		cells[2].name = "tps68470-gpio";
+
+		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE, cells, 3,
 					   NULL, 0, NULL);
+		kfree(cells);
 		break;
 	case DESIGNED_FOR_CHROMEOS:
 		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-- 
2.31.1

