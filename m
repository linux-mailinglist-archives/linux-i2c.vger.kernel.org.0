Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A068144F968
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Nov 2021 18:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236274AbhKNRIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Nov 2021 12:08:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33762 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233073AbhKNRHO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Nov 2021 12:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636909460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nS6oXu9q+npj9BQ/P9zA52LX0msdRKmILAqmJy+h9e8=;
        b=NvKdtLlnkrBuB2xKDUvteBViUyflKfTGHn9M4H8ujM807xVJsPMo8PfUYmyTwyEMf9f7f+
        o+Da0r+SVj4po+Dgc7LlJpEG6a+Q0gHzHwN/7uMwnySwkAY9Cpsdhonc9ACphGQa4/6Nbd
        C5FB8kSJvDr4MywXPt0vlHOVU0Kw6Dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-A3Prny0RMyCo6pBpU9DoeA-1; Sun, 14 Nov 2021 12:04:17 -0500
X-MC-Unique: A3Prny0RMyCo6pBpU9DoeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D4A1080865;
        Sun, 14 Nov 2021 17:04:14 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0449219EF9;
        Sun, 14 Nov 2021 17:04:10 +0000 (UTC)
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
Subject: [PATCH v2 09/20] power: supply: bq25890: Drop dev->platform_data == NULL check
Date:   Sun, 14 Nov 2021 18:03:24 +0100
Message-Id: <20211114170335.66994-10-hdegoede@redhat.com>
In-Reply-To: <20211114170335.66994-1-hdegoede@redhat.com>
References: <20211114170335.66994-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Drop the "if (!dev->platform_data)" check, this seems to be an attempt
for allowing loading the driver on devices without devicetree stemming
from the initial commit of the driver (with the presumed intention being
the "return -ENODEV" else branch getting replaced with something else).

With the new "linux,skip-init" and "linux,read-back-settings" properties
the driver can actually supports devices without devicetree and this
check no longer makes sense.

While at it also switch to dev_err_probe(), which is already used in
various other places in the driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/power/supply/bq25890_charger.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/supply/bq25890_charger.c
index a69a2173e31a..2bdfb58cda75 100644
--- a/drivers/power/supply/bq25890_charger.c
+++ b/drivers/power/supply/bq25890_charger.c
@@ -1017,16 +1017,9 @@ static int bq25890_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	if (!dev->platform_data) {
-		ret = bq25890_fw_probe(bq);
-		if (ret < 0) {
-			dev_err(dev, "Cannot read device properties: %d\n",
-				ret);
-			return ret;
-		}
-	} else {
-		return -ENODEV;
-	}
+	ret = bq25890_fw_probe(bq);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "reading device properties\n");
 
 	ret = bq25890_hw_init(bq);
 	if (ret < 0) {
-- 
2.31.1

