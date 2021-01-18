Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EF82F96B8
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 01:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730753AbhARAhb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 19:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730494AbhARAfX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jan 2021 19:35:23 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA06C061574;
        Sun, 17 Jan 2021 16:34:43 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id i63so12122218wma.4;
        Sun, 17 Jan 2021 16:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RJZvDTx1XXuRYdw+x5NTve2jp5kyClRdRV3Lu9KCjgs=;
        b=oQUa3mMcz+3upwqceaYIYRZIPID3stOz5WpURqI035bd8f2KVT+dpBhLzXD1SbKt6Q
         qyMdu2e/DQD1FdM3y7glCrF3aMJ+5NVw8j4UBjpp0L7MJZt1SWvkcyk/GFf1FUxWZqxO
         VYpidYR8r3YgjnBp338CY+TV5RHYukzEy0VQFgR/SZh4iBFT9060FePLHePwR34mmgjX
         lJc21ic5z5fIEv7Um5yk7hfcZPL4YajPxr+sz39Rc0D7cQVpGMZZo1HyJReL+n9LHUxW
         sd7M2hUxWmdKcM9tRFH2iZt5rcBWOVsoPqIegyi1lVAVLxSZsEni4xBQzFnWnCqwEIAb
         Id6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RJZvDTx1XXuRYdw+x5NTve2jp5kyClRdRV3Lu9KCjgs=;
        b=e/E0e9dsplSJlTdc0o4jVTSVUOH+iliHFKkRENxOkBykIpepryGBbrFJgNfasWIuBF
         6XntzpHB+8N0upaXJnsIvyp1ts+Z7gg2CXhglnVKs5sNa+87r45Bg4oelcYECloufM8y
         GB49nG12FCQq5Ezb6KAcz6Upmzj7/tDYuoNJHi0ECwXInX4y4VsGEZQsO77fkBJEzos6
         5CxttUDA+VzC4r/0+1vnCec3Gnjm3RVWP3vr7k4qBbJ1SLKrtiuuwyMR3cV7JtP5pBtq
         K4j7ZQ+Dd9DcFoEHtDCfEeEB6LdItPc9itAcBYAjDrBrJ06LxgGDDMeL/dwgYKNt7Kna
         xlQA==
X-Gm-Message-State: AOAM531w3H6uXEIZxJ3YIMO/623/T0hqpwZY/WwbIO/70EW9MlI07Lti
        L2HgJwlAHvEyxeDhv8rqegiHf326mo/mhw==
X-Google-Smtp-Source: ABdhPJyrmuivtQjmF+XMSkLSEA6I51KLLylqniCHheFrZI1/FrzwXPkC+Th8A3ZsNVw8ZM7E+RbEXg==
X-Received: by 2002:a7b:ca4d:: with SMTP id m13mr15551546wml.28.1610930081761;
        Sun, 17 Jan 2021 16:34:41 -0800 (PST)
Received: from valhalla.home ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id o124sm23642040wmb.5.2021.01.17.16.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 16:34:41 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 1/7] acpi: utils: move acpi_lpss_dep() to utils
Date:   Mon, 18 Jan 2021 00:34:22 +0000
Message-Id: <20210118003428.568892-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118003428.568892-1-djrscally@gmail.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I need to be able to identify devices which declare themselves to be
dependent on other devices through _DEP; add this function to utils.c
and export it to the rest of the ACPI layer.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:
	- Introduced

 drivers/acpi/acpi_lpss.c | 24 ------------------------
 drivers/acpi/internal.h  |  1 +
 drivers/acpi/utils.c     | 24 ++++++++++++++++++++++++
 3 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
index be73974ce449..70c7d9a3f715 100644
--- a/drivers/acpi/acpi_lpss.c
+++ b/drivers/acpi/acpi_lpss.c
@@ -543,30 +543,6 @@ static struct device *acpi_lpss_find_device(const char *hid, const char *uid)
 	return bus_find_device(&pci_bus_type, NULL, &data, match_hid_uid);
 }
 
-static bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
-{
-	struct acpi_handle_list dep_devices;
-	acpi_status status;
-	int i;
-
-	if (!acpi_has_method(adev->handle, "_DEP"))
-		return false;
-
-	status = acpi_evaluate_reference(adev->handle, "_DEP", NULL,
-					 &dep_devices);
-	if (ACPI_FAILURE(status)) {
-		dev_dbg(&adev->dev, "Failed to evaluate _DEP.\n");
-		return false;
-	}
-
-	for (i = 0; i < dep_devices.count; i++) {
-		if (dep_devices.handles[i] == handle)
-			return true;
-	}
-
-	return false;
-}
-
 static void acpi_lpss_link_consumer(struct device *dev1,
 				    const struct lpss_device_links *link)
 {
diff --git a/drivers/acpi/internal.h b/drivers/acpi/internal.h
index cb229e24c563..ee62c0973576 100644
--- a/drivers/acpi/internal.h
+++ b/drivers/acpi/internal.h
@@ -79,6 +79,7 @@ static inline void acpi_lpss_init(void) {}
 #endif
 
 void acpi_apd_init(void);
+bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle);
 
 acpi_status acpi_hotplug_schedule(struct acpi_device *adev, u32 src);
 bool acpi_queue_hotplug_work(struct work_struct *work);
diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index ddca1550cce6..78b38775f18b 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -807,6 +807,30 @@ static int acpi_dev_match_cb(struct device *dev, const void *data)
 	return hrv == match->hrv;
 }
 
+bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
+{
+	struct acpi_handle_list dep_devices;
+	acpi_status status;
+	int i;
+
+	if (!acpi_has_method(adev->handle, "_DEP"))
+		return false;
+
+	status = acpi_evaluate_reference(adev->handle, "_DEP", NULL,
+					 &dep_devices);
+	if (ACPI_FAILURE(status)) {
+		dev_dbg(&adev->dev, "Failed to evaluate _DEP.\n");
+		return false;
+	}
+
+	for (i = 0; i < dep_devices.count; i++) {
+		if (dep_devices.handles[i] == handle)
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * acpi_dev_present - Detect that a given ACPI device is present
  * @hid: Hardware ID of the device.
-- 
2.25.1

