Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C6D321814
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbhBVNKf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhBVNIc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 08:08:32 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D892BC061786;
        Mon, 22 Feb 2021 05:07:51 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id i7so7400454wmb.0;
        Mon, 22 Feb 2021 05:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ddip2ZavcBTfjDSBP8ZYl7mESUaZbGsgIowoLJ9mNJI=;
        b=UFAGMlyiXfJKu5msYMYsxV4D2aD7VKsyyeZm5x9XdhEMXNe3Rk8j/o/HcFxkpbc1zo
         jojqHOHh+Nbs+i/1txgahdfrxwb4gp5MzU3QAvDecI3s410TbOeh+C8q2Zwm9RFukFzC
         k7LgTUPvZjkZaKzdfsvI7yvCAyrn2thFtluczlmP5H7gvfjxMOUbe5SyT+Q6izn0p4xM
         xqAO0Q0q39GGSh31a83oOl7ltgNmMZDnzs7X3VEKdNAu5VUAlz7O/zX6p9ILKR9q+3BE
         Eo3dS0cBEXUH5BQMfJoq6lQ9WvW9ZbYHZ+TsXS9a3k35+2ef2RAWaIgVbkF0K7HxzvVF
         eZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ddip2ZavcBTfjDSBP8ZYl7mESUaZbGsgIowoLJ9mNJI=;
        b=D/T9AbFXzJsy6v2uYPWonCr3Tv+3aYZ8MeZZ/5TJjyB66/llK453Djq/tLQckS66SR
         jb+3x3ekYy7ELjQSFzcJuWwZv/bngjrznQ1Nt9Un8D25F/DTyPu/14tSmKSrK3CKT/XR
         +AcB7sX6dtecBzWQNmFbVRVJz/VuQNDp+nruLMVKJW104KZJ28rjhPaWS5IBfWVlELPQ
         Ncp/a9p1Qds24l8FSe0nSRPcnjA952tV4ngqsfPTQ8MO1h1d4/J+k/LuYduGpsFx0LTK
         ipETNU5EEog2LirBRNjfxAlfEdhUv62B1WdZDSjsnHiFQ4x/b4QGmbk8H5ykH3e3h5if
         rD6g==
X-Gm-Message-State: AOAM531lIF6ylX7REXTk1K3qpMhWYxBjsgR/koQZNIV1B3P7BzGRNnM2
        mAaHVELz54p3u4VzgzvTMGs=
X-Google-Smtp-Source: ABdhPJzDF7EmFDEKzqAgNHl5NOXKxsfQiZ6QT0oyo5+YGK0+0X3WYyZtvYVKjHXk1C7WwxP3Lua/LA==
X-Received: by 2002:a1c:2c05:: with SMTP id s5mr20081256wms.70.1613999270603;
        Mon, 22 Feb 2021 05:07:50 -0800 (PST)
Received: from valhalla.home ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id t198sm26575828wmt.7.2021.02.22.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 05:07:50 -0800 (PST)
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
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v3 1/6] ACPI: scan: Extend acpi_walk_dep_device_list()
Date:   Mon, 22 Feb 2021 13:07:30 +0000
Message-Id: <20210222130735.1313443-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222130735.1313443-1-djrscally@gmail.com>
References: <20210222130735.1313443-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The acpi_walk_dep_device_list() is not as generalisable as its name
implies, serving only to decrement the dependency count for each
dependent device of the input. Extend the function to instead accept
a callback which can be applied to all the dependencies in acpi_dep_list.
Replace all existing calls to the function with calls to a wrapper, passing
a callback that applies the same dependency reduction.

Suggested-by: Rafael J. Wysocki <rafael@kernel.org>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- patch introduced

 drivers/acpi/ec.c                         |  2 +-
 drivers/acpi/pmic/intel_pmic_chtdc_ti.c   |  2 +-
 drivers/acpi/scan.c                       | 58 ++++++++++++++++-------
 drivers/gpio/gpiolib-acpi.c               |  2 +-
 drivers/i2c/i2c-core-acpi.c               |  2 +-
 drivers/platform/surface/surface3_power.c |  2 +-
 include/acpi/acpi_bus.h                   |  7 +++
 include/linux/acpi.h                      |  4 +-
 8 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/drivers/acpi/ec.c b/drivers/acpi/ec.c
index 13565629ce0a..a258db713bd2 100644
--- a/drivers/acpi/ec.c
+++ b/drivers/acpi/ec.c
@@ -1627,7 +1627,7 @@ static int acpi_ec_add(struct acpi_device *device)
 	WARN(!ret, "Could not request EC cmd io port 0x%lx", ec->command_addr);
 
 	/* Reprobe devices depending on the EC */
-	acpi_walk_dep_device_list(ec->handle);
+	acpi_dev_flag_dependency_met(ec->handle);
 
 	acpi_handle_debug(ec->handle, "enumerated.\n");
 	return 0;
diff --git a/drivers/acpi/pmic/intel_pmic_chtdc_ti.c b/drivers/acpi/pmic/intel_pmic_chtdc_ti.c
index a5101b07611a..59cca504325e 100644
--- a/drivers/acpi/pmic/intel_pmic_chtdc_ti.c
+++ b/drivers/acpi/pmic/intel_pmic_chtdc_ti.c
@@ -117,7 +117,7 @@ static int chtdc_ti_pmic_opregion_probe(struct platform_device *pdev)
 		return err;
 
 	/* Re-enumerate devices depending on PMIC */
-	acpi_walk_dep_device_list(ACPI_HANDLE(pdev->dev.parent));
+	acpi_dev_flag_dependency_met(ACPI_HANDLE(pdev->dev.parent));
 	return 0;
 }
 
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 80b668c80073..c9e4190316ef 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -49,12 +49,6 @@ static DEFINE_MUTEX(acpi_hp_context_lock);
  */
 static u64 spcr_uart_addr;
 
-struct acpi_dep_data {
-	struct list_head node;
-	acpi_handle supplier;
-	acpi_handle consumer;
-};
-
 void acpi_scan_lock_acquire(void)
 {
 	mutex_lock(&acpi_scan_lock);
@@ -2099,30 +2093,58 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
 		device->handler->hotplug.notify_online(device);
 }
 
-void acpi_walk_dep_device_list(acpi_handle handle)
+static int __acpi_dev_flag_dependency_met(struct acpi_dep_data *dep,
+					  void *data)
 {
-	struct acpi_dep_data *dep, *tmp;
 	struct acpi_device *adev;
 
+	acpi_bus_get_device(dep->consumer, &adev);
+	if (!adev)
+		return 0;
+
+	adev->dep_unmet--;
+	if (!adev->dep_unmet)
+		acpi_bus_attach(adev, true);
+
+	list_del(&dep->node);
+	kfree(dep);
+	return 0;
+}
+
+void acpi_walk_dep_device_list(acpi_handle handle,
+			       int (*callback)(struct acpi_dep_data *, void *),
+			       void *data)
+{
+	struct acpi_dep_data *dep, *tmp;
+	int ret;
+
 	mutex_lock(&acpi_dep_list_lock);
 	list_for_each_entry_safe(dep, tmp, &acpi_dep_list, node) {
 		if (dep->supplier == handle) {
-			acpi_bus_get_device(dep->consumer, &adev);
-			if (!adev)
-				continue;
-
-			adev->dep_unmet--;
-			if (!adev->dep_unmet)
-				acpi_bus_attach(adev, true);
-
-			list_del(&dep->node);
-			kfree(dep);
+			ret = callback(dep, data);
+			if (ret)
+				break;
 		}
 	}
 	mutex_unlock(&acpi_dep_list_lock);
 }
 EXPORT_SYMBOL_GPL(acpi_walk_dep_device_list);
 
+/**
+ * acpi_dev_flag_dependency_met() - Inform consumers of @handle that the device
+ *				    is now active
+ * @handle: acpi_handle for the supplier device
+ *
+ * This function walks through the dependencies list and informs each consumer
+ * of @handle that their dependency upon it is now met. Devices with no more
+ * unmet dependencies will be attached to the acpi bus.
+ */
+void acpi_dev_flag_dependency_met(acpi_handle handle)
+{
+	acpi_walk_dep_device_list(handle, __acpi_dev_flag_dependency_met, NULL);
+}
+EXPORT_SYMBOL_GPL(acpi_dev_flag_dependency_met);
+
 /**
  * acpi_bus_scan - Add ACPI device node objects in a given namespace scope.
  * @handle: Root of the namespace scope to scan.
diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index e37a57d0a2f0..e4d728fda982 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1254,7 +1254,7 @@ void acpi_gpiochip_add(struct gpio_chip *chip)
 
 	acpi_gpiochip_request_regions(acpi_gpio);
 	acpi_gpiochip_scan_gpios(acpi_gpio);
-	acpi_walk_dep_device_list(handle);
+	acpi_dev_flag_dependency_met(handle);
 }
 
 void acpi_gpiochip_remove(struct gpio_chip *chip)
diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 37c510d9347a..38647cf34bde 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -283,7 +283,7 @@ void i2c_acpi_register_devices(struct i2c_adapter *adap)
 	if (!handle)
 		return;
 
-	acpi_walk_dep_device_list(handle);
+	acpi_dev_flag_dependency_met(handle);
 }
 
 static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
index cc4f9cba6856..ad895285d3e9 100644
--- a/drivers/platform/surface/surface3_power.c
+++ b/drivers/platform/surface/surface3_power.c
@@ -478,7 +478,7 @@ static int mshw0011_install_space_handler(struct i2c_client *client)
 		return -ENOMEM;
 	}
 
-	acpi_walk_dep_device_list(handle);
+	acpi_dev_flag_dependency_met(handle);
 	return 0;
 }
 
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 02a716a0af5d..91172af3a04d 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -278,6 +278,12 @@ struct acpi_device_power {
 	struct acpi_device_power_state states[ACPI_D_STATE_COUNT];	/* Power states (D0-D3Cold) */
 };
 
+struct acpi_dep_data {
+	struct list_head node;
+	acpi_handle supplier;
+	acpi_handle consumer;
+};
+
 /* Performance Management */
 
 struct acpi_device_perf_flags {
@@ -683,6 +689,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 
 bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
 
+void acpi_dev_flag_dependency_met(acpi_handle handle);
 struct acpi_device *
 acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
 struct acpi_device *
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 2630c2e953f7..2d5e6e88e8a0 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -655,7 +655,9 @@ extern bool acpi_driver_match_device(struct device *dev,
 				     const struct device_driver *drv);
 int acpi_device_uevent_modalias(struct device *, struct kobj_uevent_env *);
 int acpi_device_modalias(struct device *, char *, int);
-void acpi_walk_dep_device_list(acpi_handle handle);
+void acpi_walk_dep_device_list(acpi_handle handle,
+			       int (*callback)(struct acpi_dep_data *, void *),
+			       void *data);
 
 struct platform_device *acpi_create_platform_device(struct acpi_device *,
 						    struct property_entry *);
-- 
2.25.1

