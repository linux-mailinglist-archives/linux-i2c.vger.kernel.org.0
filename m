Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98124392CC
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 11:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbhJYJo6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 05:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29067 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232783AbhJYJoa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 05:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635154927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+/qOVV3GWWwyv36CwuqsRbEhyl0VVy51ttzWNK0tWNY=;
        b=gECE9UKgRykDuOdfXYycMRIW9LIm9At1I/20gGA6FWf0AnZt88TbeivYnlGNDFvaXIucIv
        IIElqwYZCR6BRy1Fo3qxuZZ2qto5jSJ0hdfZkCKxFFQUSMQKLNeCOeZNrNRem5muGxUe0K
        kX2DMMHByNDyJCTZp8VCyC4HtUafGmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-UrRMuLdvOPaNyFv0iNnyOw-1; Mon, 25 Oct 2021 05:42:04 -0400
X-MC-Unique: UrRMuLdvOPaNyFv0iNnyOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9433D657;
        Mon, 25 Oct 2021 09:42:01 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BAA6860BF4;
        Mon, 25 Oct 2021 09:41:56 +0000 (UTC)
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
Subject: [PATCH v4 06/11] platform/x86: int3472: Enable I2c daisy chain
Date:   Mon, 25 Oct 2021 11:41:14 +0200
Message-Id: <20211025094119.82967-7-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-1-hdegoede@redhat.com>
References: <20211025094119.82967-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

