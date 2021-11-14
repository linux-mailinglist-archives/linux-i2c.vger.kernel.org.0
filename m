Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA6A44F98E
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Nov 2021 18:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236491AbhKNRJu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Nov 2021 12:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23614 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236363AbhKNRHl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Nov 2021 12:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636909487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VkrzRyLpI/vm0BtNuQueusLpeyS5Qzu5q0EpoAb3tQo=;
        b=iUw2v1+612eLMS67+AZMyp6s+L5ev88xQo124YGVPSR+xeLS8DIplFZj7gwoTi5IHeRzn5
        W5NO3VFERxjgOHfdSVnDHGz2aH5+3qybzdIrFhVXx+KN3KrmCbQCpUmOJLdVxs6ZQgEevp
        9C9CzPbthVgtmpBGGvtzBnZYMJ3fz50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-zDr9d-1sPKOZe8rtTdVxDQ-1; Sun, 14 Nov 2021 12:04:44 -0500
X-MC-Unique: zDr9d-1sPKOZe8rtTdVxDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C5D1080865;
        Sun, 14 Nov 2021 17:04:41 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E49291346F;
        Sun, 14 Nov 2021 17:04:37 +0000 (UTC)
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
Subject: [PATCH v2 16/20] extcon: intel-cht-wc: Use new intel_cht_wc_get_model() helper
Date:   Sun, 14 Nov 2021 18:03:31 +0100
Message-Id: <20211114170335.66994-17-hdegoede@redhat.com>
In-Reply-To: <20211114170335.66994-1-hdegoede@redhat.com>
References: <20211114170335.66994-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The CHT_WC_VBUS_GPIO_CTLO GPIO actually driving an external 5V Vboost
converter for Vbus depends on the board on which the Cherry Trail -
Whiskey Cove PMIC is actually used.

Since the information about the exact PMIC setup is necessary in other
places too, the drivers/mfd/intel_soc_pmic_chtwc.c code now has a new
intel_cht_wc_get_model() helper.

Only poke the CHT_WC_VBUS_GPIO_CTLO GPIO if this new helper returns
INTEL_CHT_WC_GPD_WIN_POCKET, which indicates the Type-C (with PD and
DP-altmode) setup used on the GPD pocket and GPD win; and on which
this GPIO actually controls an external 5V Vboost converter.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/extcon/extcon-intel-cht-wc.c | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/extcon/extcon-intel-cht-wc.c b/drivers/extcon/extcon-intel-cht-wc.c
index 771f6f4cf92e..a5aeeecc44fb 100644
--- a/drivers/extcon/extcon-intel-cht-wc.c
+++ b/drivers/extcon/extcon-intel-cht-wc.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -358,20 +359,26 @@ static int cht_wc_extcon_probe(struct platform_device *pdev)
 	if (IS_ERR(ext->edev))
 		return PTR_ERR(ext->edev);
 
-	/*
-	 * When a host-cable is detected the BIOS enables an external 5v boost
-	 * converter to power connected devices there are 2 problems with this:
-	 * 1) This gets seen by the external battery charger as a valid Vbus
-	 *    supply and it then tries to feed Vsys from this creating a
-	 *    feedback loop which causes aprox. 300 mA extra battery drain
-	 *    (and unless we drive the external-charger-disable pin high it
-	 *    also tries to charge the battery causing even more feedback).
-	 * 2) This gets seen by the pwrsrc block as a SDP USB Vbus supply
-	 * Since the external battery charger has its own 5v boost converter
-	 * which does not have these issues, we simply turn the separate
-	 * external 5v boost converter off and leave it off entirely.
-	 */
-	cht_wc_extcon_set_5v_boost(ext, false);
+	switch (intel_cht_wc_get_model()) {
+	case INTEL_CHT_WC_GPD_WIN_POCKET:
+		/*
+		 * When a host-cable is detected the BIOS enables an external 5v boost
+		 * converter to power connected devices there are 2 problems with this:
+		 * 1) This gets seen by the external battery charger as a valid Vbus
+		 *    supply and it then tries to feed Vsys from this creating a
+		 *    feedback loop which causes aprox. 300 mA extra battery drain
+		 *    (and unless we drive the external-charger-disable pin high it
+		 *    also tries to charge the battery causing even more feedback).
+		 * 2) This gets seen by the pwrsrc block as a SDP USB Vbus supply
+		 * Since the external battery charger has its own 5v boost converter
+		 * which does not have these issues, we simply turn the separate
+		 * external 5v boost converter off and leave it off entirely.
+		 */
+		cht_wc_extcon_set_5v_boost(ext, false);
+		break;
+	default:
+		break;
+	}
 
 	/* Enable sw control */
 	ret = cht_wc_extcon_sw_control(ext, true);
-- 
2.31.1

