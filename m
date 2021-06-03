Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3146C39AE3F
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 00:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhFCWnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 18:43:19 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:33686 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhFCWnS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 18:43:18 -0400
Received: by mail-wr1-f52.google.com with SMTP id a20so7421744wrc.0;
        Thu, 03 Jun 2021 15:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nvI/xJn+zNjZ5L1MPeKPb1oyyFE33mVgV745ZMdAF50=;
        b=k42izcCLvhCKdJnbAxoaQ032H+mdbsho5piDKxueB9Hv77hIawXJbbH4Gm8G60G8O9
         Bu+pyqIrKVeYAuNMezslTvOJvXIxukLBEBn5Z0wUt7Rfg2YZrGpvE0ptlQgYfIkoKo9C
         /F4LrjsEHVP3WzK5fCnNWB4eYeXOJlL1hU09anGpgSq+qW74CqFfDYlkiaaWEPF3UrcX
         bgtDUXW5cF7BeJec414+W8NnJYe0pITGbZ4+QePS2QzNtluG4PJwdpeSUY375t6ezWq5
         3ckTKY0IdK448jMfAuLRnS5U0T7Oaa4YnVJlvoDmfD1SHsvWB7y32SG/xbGYvTKTnmbQ
         BAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nvI/xJn+zNjZ5L1MPeKPb1oyyFE33mVgV745ZMdAF50=;
        b=YUoZNGfYzuFFeect5UoF51S4b3i7SndG4j6Xdu/4GGGtzzXoPIgHmTEhezXqF+8OqP
         Kw2SbnSS+zaVjbr7D21DcBzAYZTVoxrv+FqMmI9wsuZhsv8crXnXosxKZfhFScDvnHyp
         d4GyeyTAuxjpCGzxXu/hrrrT/sFV5gDx5EwxJlHdFxGZPuRe4V/lRxAX7H8Sk26v+/Vn
         LSkFuGHzbNi3ftfnrmPvQWfhBWk0jhx6tveuPAW0P+LZdXDAmhRn6Nzo7gaQZ/CdFRZs
         qNicZDlqnwaJbCYMZXhoWP+3AJuZlToTbWUTFT77SqEOh7u0CYwCFhXIY9LgJ5hujy2o
         N58Q==
X-Gm-Message-State: AOAM532SGVUTObj4eAiyzSxtzFgHoSveasnQpyVTuhqAZ8zTbbEIOCUY
        IsecaM9ohzuzEYMmCSwjA7A=
X-Google-Smtp-Source: ABdhPJwOxPUXTLCRJf2vNkCBOP09t5jhPt/e9brAgyLsSoZR2RYZU/OM42Fh/mUALcl17wkLZSBbfQ==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr618934wrv.319.1622760022693;
        Thu, 03 Jun 2021 15:40:22 -0700 (PDT)
Received: from valhalla.home ([91.110.88.218])
        by smtp.gmail.com with ESMTPSA id f14sm4612103wry.40.2021.06.03.15.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:40:22 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v5 2/6] ACPI: scan: Add function to fetch dependent of acpi device
Date:   Thu,  3 Jun 2021 23:40:03 +0100
Message-Id: <20210603224007.120560-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603224007.120560-1-djrscally@gmail.com>
References: <20210603224007.120560-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In some ACPI tables we encounter, devices use the _DEP method to assert
a dependence on other ACPI devices as opposed to the OpRegions that the
specification intends. We need to be able to find those devices "from"
the dependee, so add a callback and a wrapper to walk over the
acpi_dep_list and return the dependent ACPI device.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v5:

	- Functions renamed

 drivers/acpi/scan.c     | 35 +++++++++++++++++++++++++++++++++++
 include/acpi/acpi_bus.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 195635c3462b..9af64c34e286 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2105,6 +2105,20 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
 		device->handler->hotplug.notify_online(device);
 }
 
+static int acpi_dev_get_first_consumer_dev_cb(struct acpi_dep_data *dep, void *data)
+{
+	struct acpi_device *adev;
+
+	adev = acpi_bus_get_acpi_device(dep->consumer);
+	if (!adev)
+		/* If we don't find an adev then we want to continue parsing */
+		return 0;
+
+	*(struct acpi_device **)data = adev;
+
+	return 1;
+}
+
 static int acpi_scan_clear_dep(struct acpi_dep_data *dep, void *data)
 {
 	struct acpi_device *adev;
@@ -2168,6 +2182,27 @@ void acpi_dev_clear_dependencies(struct acpi_device *supplier)
 }
 EXPORT_SYMBOL_GPL(acpi_dev_clear_dependencies);
 
+/**
+ * acpi_dev_get_first_consumer_dev - Return ACPI device dependent on @supplier
+ * @supplier: Pointer to the dependee device
+ *
+ * Returns the first &struct acpi_device which declares itself dependent on
+ * @supplier via the _DEP buffer, parsed from the acpi_dep_list.
+ *
+ * The caller is responsible for putting the reference to adev when it is no
+ * longer needed.
+ */
+struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier)
+{
+	struct acpi_device *adev = NULL;
+
+	acpi_walk_dep_device_list(supplier->handle,
+				  acpi_dev_get_first_consumer_dev_cb, &adev);
+
+	return adev;
+}
+EXPORT_SYMBOL_GPL(acpi_dev_get_first_consumer_dev);
+
 /**
  * acpi_bus_scan - Add ACPI device node objects in a given namespace scope.
  * @handle: Root of the namespace scope to scan.
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 0b2c4f170f4d..4bed30e61c5b 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -692,6 +692,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
 
 void acpi_dev_clear_dependencies(struct acpi_device *supplier);
+struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier);
 struct acpi_device *
 acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
 struct acpi_device *
-- 
2.25.1

