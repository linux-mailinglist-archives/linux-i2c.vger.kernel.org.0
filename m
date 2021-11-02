Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409DB442AE4
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 10:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbhKBJwo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 05:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32276 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231694AbhKBJwU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 05:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635846585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+/qOVV3GWWwyv36CwuqsRbEhyl0VVy51ttzWNK0tWNY=;
        b=g8aoMrl2LNzWquRya//nfIbEZBGjvxsu4TeGN8/kjSPmt/xApzGjw28HX0pqdIUbYJnhIf
        n8Xf+dKzVsS80GmnVHFkvQopDrIX/9Acmd/L3yAmDZulezpEwSC9YTyz7HeEIKDO1TeZfo
        asXb+fn5pP4LFxLp6212+Lk1BF9+7EU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-xVMiX3E0M3C8XLhGNGKwGA-1; Tue, 02 Nov 2021 05:49:40 -0400
X-MC-Unique: xVMiX3E0M3C8XLhGNGKwGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C6779F92B;
        Tue,  2 Nov 2021 09:49:37 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.91])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D97615D9DC;
        Tue,  2 Nov 2021 09:49:33 +0000 (UTC)
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
Subject: [PATCH v5 06/11] platform/x86: int3472: Enable I2c daisy chain
Date:   Tue,  2 Nov 2021 10:49:02 +0100
Message-Id: <20211102094907.31271-7-hdegoede@redhat.com>
In-Reply-To: <20211102094907.31271-1-hdegoede@redhat.com>
References: <20211102094907.31271-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Daniel Scally <djrscally@gmail.com>

The TPS68470 PMIC has an I2C passthrough mode through which I2C traffic
can be forwarded to a device connected to the PMIC as though it were
connected directly to the system bus. Enable this mode when the chip
is initialised.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 .../x86/intel/int3472/intel_skl_int3472_tps68470.c         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
index c05b4cf502fe..42e688f4cad4 100644
--- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
+++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
@@ -45,6 +45,13 @@ static int tps68470_chip_init(struct device *dev, struct regmap *regmap)
 		return ret;
 	}
 
+	/* Enable I2C daisy chain */
+	ret = regmap_write(regmap, TPS68470_REG_S_I2C_CTL, 0x03);
+	if (ret) {
+		dev_err(dev, "Failed to enable i2c daisy chain\n");
+		return ret;
+	}
+
 	dev_info(dev, "TPS68470 REVID: 0x%02x\n", version);
 
 	return 0;
-- 
2.31.1

