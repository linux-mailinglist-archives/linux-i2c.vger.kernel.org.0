Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D7944F958
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Nov 2021 18:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbhKNRHl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Nov 2021 12:07:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53713 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236220AbhKNRHC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Nov 2021 12:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636909448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fmkSKT7i6NigRzb1gtGRMw1mBsx212ar52Z2zF7M4mE=;
        b=YuvfkLwQp4pmFjng4EKcg7LtGPIr+V3UYW7czeNZSyBCN2W+HxlnL1ZMTmHrjZ8DGSMqjL
        W4qKHbSGoP/2sJ2tKBYaR5jfve5+ORGUm/YdXQMD5Enkz1+tW8u3urStTSX+oy6Zi13mU9
        3gQpBQ2NanNU35GIRT2aZ9zONWNmVjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-LnszWwGHNFW0URkrqpH3Yg-1; Sun, 14 Nov 2021 12:04:05 -0500
X-MC-Unique: LnszWwGHNFW0URkrqpH3Yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F8401808324;
        Sun, 14 Nov 2021 17:04:03 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 837FC19EF9;
        Sun, 14 Nov 2021 17:03:59 +0000 (UTC)
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
Subject: [PATCH v2 06/20] power: supply: bq25890: Add support to skip reset at probe() / remove()
Date:   Sun, 14 Nov 2021 18:03:21 +0100
Message-Id: <20211114170335.66994-7-hdegoede@redhat.com>
In-Reply-To: <20211114170335.66994-1-hdegoede@redhat.com>
References: <20211114170335.66994-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On most X86/ACPI devices the firmware already fully initializes
the bq25890 charger at boot, in this case it is best to not reset
it at probe() time.

At support for a new "linux,skip-reset" boolean property to support this.
So far this new property is only used on X86/ACPI (non devicetree) devs,
IOW it is not used in actual devicetree files. The devicetree-bindings
maintainers have requested properties like these to not be added to the
devicetree-bindings, so the new property is deliberately not added
to the existing devicetree-bindings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this series, together with the "linux,read-back-settings"
  patch, this patch replaces the "ti,skip-init" patch from v1
---
 drivers/power/supply/bq25890_charger.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/supply/bq25890_charger.c
index 704cc15b4403..864904d7eaeb 100644
--- a/drivers/power/supply/bq25890_charger.c
+++ b/drivers/power/supply/bq25890_charger.c
@@ -110,6 +110,7 @@ struct bq25890_device {
 	struct regmap *rmap;
 	struct regmap_field *rmap_fields[F_MAX_FIELDS];
 
+	bool skip_reset;
 	enum bq25890_chip_version chip_version;
 	struct bq25890_init_data init_data;
 	struct bq25890_state state;
@@ -709,10 +710,12 @@ static int bq25890_hw_init(struct bq25890_device *bq)
 {
 	int ret;
 
-	ret = bq25890_chip_reset(bq);
-	if (ret < 0) {
-		dev_dbg(bq->dev, "Reset failed %d\n", ret);
-		return ret;
+	if (!bq->skip_reset) {
+		ret = bq25890_chip_reset(bq);
+		if (ret < 0) {
+			dev_dbg(bq->dev, "Reset failed %d\n", ret);
+			return ret;
+		}
 	}
 
 	/* disable watchdog */
@@ -946,6 +949,8 @@ static int bq25890_fw_probe(struct bq25890_device *bq)
 	int ret;
 	struct bq25890_init_data *init = &bq->init_data;
 
+	bq->skip_reset = device_property_read_bool(bq->dev, "linux,skip-reset");
+
 	ret = bq25890_fw_read_u32_props(bq);
 	if (ret < 0)
 		return ret;
@@ -1058,8 +1063,10 @@ static int bq25890_remove(struct i2c_client *client)
 	if (!IS_ERR_OR_NULL(bq->usb_phy))
 		usb_unregister_notifier(bq->usb_phy, &bq->usb_nb);
 
-	/* reset all registers to default values */
-	bq25890_chip_reset(bq);
+	if (!bq->skip_reset) {
+		/* reset all registers to default values */
+		bq25890_chip_reset(bq);
+	}
 
 	return 0;
 }
-- 
2.31.1

