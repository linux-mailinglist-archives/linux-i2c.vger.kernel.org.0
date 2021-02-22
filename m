Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A6A321818
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhBVNKl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhBVNId (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 08:08:33 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCABDC06178A;
        Mon, 22 Feb 2021 05:07:52 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id v14so18998132wro.7;
        Mon, 22 Feb 2021 05:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FJcro0M+ytwCFMFq3BOIPESMWrpP9oxj2MmSemg8LEw=;
        b=ZMV6xWwrBQrEWuEKxkJvb6oDFeM2VJFkvddd2dHAka7o/K1BRYtpOqQMoLZWJRYvwd
         8MXeuK83NEsaL0B3qS6jOh8u3DdHjnZKSP+kmvhj65asROB78EBYta/tUhMo0aoG57fh
         ADl/r3ItZYcCyakqmjHrfetQCha0gyHJuQNGLwjWYJb//MH26IzOEalbBVr/he4i3s9G
         iuDKLLEYcr6R0GyFJoCPb1RgE2RdIg/r5ys2Zy7rWhcb7CkQqXl53N5SnbS7RDwlcnue
         pBHPbmKZ255yMzmeWxSGkw1A7s9nC2rcqYxO0gMtZBDU7gZB7wi15bNMJFkrdWkUucJv
         shuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FJcro0M+ytwCFMFq3BOIPESMWrpP9oxj2MmSemg8LEw=;
        b=Gcc81CVcQ74dtpO9/WnR//8HrKQ7YinBGkfHKY1O12cOAe31uxvObZRIt283XUr/8z
         +5GR8xKXzsD4taAgf2arV5RL6KNxA3xtm6k5CvQ2tR6f3vGmxWnUUhospTcPNQ/Tagw/
         VimywA0xfCQD1lqAiYvomPL4AhIR8S1tjaotnNeMMXNzHPlrd37yKzuTUoQuIHEWe3fR
         ZOXNRin2lNXYVWgvCgAjgVO4zIGWR0/axO7PAHKkAiJ0ABls6YZyOhoU9SDvhG7704Sn
         jWwKQS06YQzHm0EKFOtdInOmD9DYaAZhr4eKhjMk8Xy1JVpjpRI+zF0O6hKDauSWpaq0
         2J/A==
X-Gm-Message-State: AOAM530hGr3jlNCcofiujNEZzXETTdSJpCFWAFb3M/9JI3MF+6KJYPna
        FPp65SiSBHepuXTn8G74Scs=
X-Google-Smtp-Source: ABdhPJyihhA6n1SWGZYlAOk6ihzKQ5ZFA1SIaPDiVg2PFbN66LAkajUtWccl7dJMQ90I3MjEp7F9uw==
X-Received: by 2002:adf:82ad:: with SMTP id 42mr21238137wrc.116.1613999271658;
        Mon, 22 Feb 2021 05:07:51 -0800 (PST)
Received: from valhalla.home ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id t198sm26575828wmt.7.2021.02.22.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 05:07:51 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     tfiga@chromium.org, sakari.ailus@linux.intel.com,
        rajmohan.mani@intel.com, rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        mgross@linux.intel.com, luzmaximilian@gmail.com,
        robert.moore@intel.com, erik.kaneda@intel.com, me@fabwu.ch,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Subject: [PATCH v3 2/6] ACPI: scan: Add function to fetch dependent of acpi device
Date:   Mon, 22 Feb 2021 13:07:31 +0000
Message-Id: <20210222130735.1313443-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222130735.1313443-1-djrscally@gmail.com>
References: <20210222130735.1313443-1-djrscally@gmail.com>
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

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- Switched from a standalone function to a callback passed to
	  acpi_walk_dep_device_list().

 drivers/acpi/scan.c     | 34 ++++++++++++++++++++++++++++++++++
 include/acpi/acpi_bus.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index c9e4190316ef..55626925261c 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2093,6 +2093,21 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
 		device->handler->hotplug.notify_online(device);
 }
 
+static int __acpi_dev_get_dependent_dev(struct acpi_dep_data *dep, void *data)
+{
+	struct acpi_device *adev;
+	int ret;
+
+	ret = acpi_bus_get_device(dep->consumer, &adev);
+	if (ret)
+		/* If we don't find an adev then we want to continue parsing */
+		return 0;
+
+	*(struct acpi_device **)data = adev;
+
+	return 1;
+}
+
 static int __acpi_dev_flag_dependency_met(struct acpi_dep_data *dep,
 					  void *data)
 {
@@ -2145,6 +2160,25 @@ void acpi_dev_flag_dependency_met(acpi_handle handle)
 }
 EXPORT_SYMBOL_GPL(acpi_dev_flag_dependency_met);
 
+/**
+ * acpi_dev_get_dependent_dev - Return ACPI device dependent on @adev
+ * @adev: Pointer to the dependee device
+ *
+ * Returns the first &struct acpi_device which declares itself dependent on
+ * @adev via the _DEP buffer, parsed from the acpi_dep_list.
+ */
+struct acpi_device *
+acpi_dev_get_dependent_dev(struct acpi_device *supplier)
+{
+	struct acpi_device *adev = NULL;
+
+	acpi_walk_dep_device_list(supplier->handle,
+				  __acpi_dev_get_dependent_dev, &adev);
+
+	return adev;
+}
+EXPORT_SYMBOL_GPL(acpi_dev_get_dependent_dev);
+
 /**
  * acpi_bus_scan - Add ACPI device node objects in a given namespace scope.
  * @handle: Root of the namespace scope to scan.
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 91172af3a04d..5b14a9ae4ed5 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -690,6 +690,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
 
 void acpi_dev_flag_dependency_met(acpi_handle handle);
+struct acpi_device *acpi_dev_get_dependent_dev(struct acpi_device *supplier);
 struct acpi_device *
 acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
 struct acpi_device *
-- 
2.25.1

