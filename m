Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEE845DF2E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 17:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237330AbhKYRAs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 12:00:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52783 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356623AbhKYQ6p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 11:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637859333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LUrG4jqNJu6mVXKc6QsIJBUF4M5Dz78pxASMnLdBkbM=;
        b=YTCYEQEYkmCBopsi72XXHMn+1T/o70KZMgfUKhKV6neh/JpHZrmDojK5akxNFFC/gjtkKs
        r82vK6IBV0C2eOfKRgcpwisMQ1S7wuOKz24mtvehdY2JFF/oOf/LmxioWVWvdCGz6tISHN
        3RWjIegF+N/rzYgWRbIQmQqNXAbB5Ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-485-fKjlI72qOAGApb-egKqtrQ-1; Thu, 25 Nov 2021 11:55:28 -0500
X-MC-Unique: fKjlI72qOAGApb-egKqtrQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10F532F20;
        Thu, 25 Nov 2021 16:55:26 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 54B04604CC;
        Thu, 25 Nov 2021 16:55:22 +0000 (UTC)
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
Subject: [PATCH v6 13/15] media: ipu3-cio2: Defer probing until the PMIC is fully setup
Date:   Thu, 25 Nov 2021 17:54:10 +0100
Message-Id: <20211125165412.535063-14-hdegoede@redhat.com>
In-Reply-To: <20211125165412.535063-1-hdegoede@redhat.com>
References: <20211125165412.535063-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On devices where things are not fully describe in devicetree (1)
and where the code thus falls back to calling cio2_bridge_init(),
the i2c-clients for any VCMs also need to be instantiated manually.

The VCM can be probed by its driver as soon as the code instantiates
the i2c-client and this probing must not happen before the PMIC is
fully setup.

Make cio2_bridge_init() return -EPROBE_DEFER when the PMIC is not
fully-setup, deferring the probe of the ipu3-cio2 driver.

This is a preparation patch for adding VCM enumeration support to
the ipu3-cio2-bridge code.

1) Through embedding of devicetree info in the ACPI tables

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 1cbbcbf4e157..460ef7f78234 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -308,6 +308,40 @@ static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge,
 	return ret;
 }
 
+/*
+ * The VCM cannot be probed until the PMIC is completely setup. We cannot rely
+ * on -EPROBE_DEFER for this, since the consumer<->supplier relations between
+ * the VCM and regulators/clks are not described in ACPI, instead they are
+ * passed as board-data to the PMIC drivers. Since -PROBE_DEFER does not work
+ * for the clks/regulators the VCM i2c-clients must not be instantiated until
+ * the PMIC is fully setup.
+ *
+ * The sensor/VCM ACPI device has an ACPI _DEP on the PMIC, check this using the
+ * acpi_dev_ready_for_enumeration() helper, like the i2c-core-acpi code does
+ * for the sensors.
+ */
+int cio2_bridge_sensors_are_ready(void)
+{
+	struct acpi_device *adev;
+	bool ready = true;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
+		const struct cio2_sensor_config *cfg =
+			&cio2_supported_sensors[i];
+
+		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
+			if (!adev->status.enabled)
+				continue;
+
+			if (!acpi_dev_ready_for_enumeration(adev))
+				ready = false;
+		}
+	}
+
+	return ready;
+}
+
 int cio2_bridge_init(struct pci_dev *cio2)
 {
 	struct device *dev = &cio2->dev;
@@ -316,6 +350,9 @@ int cio2_bridge_init(struct pci_dev *cio2)
 	unsigned int i;
 	int ret;
 
+	if (!cio2_bridge_sensors_are_ready())
+		return -EPROBE_DEFER;
+
 	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
 	if (!bridge)
 		return -ENOMEM;
-- 
2.33.1

