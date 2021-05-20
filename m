Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA2238B144
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 16:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243572AbhETONE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 10:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239826AbhETOMH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 10:12:07 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C85FC061358;
        Thu, 20 May 2021 07:09:44 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d11so17799701wrw.8;
        Thu, 20 May 2021 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P0640m4NeG10qjpch2cOVQh+bHv5ZQPDXdCUWnzfzdA=;
        b=jyY6jgxb4uYgojvcdDZhGF/ZE/7r/S99lSJ7oh3FPWDSTMviwlW16F5cOpmkZ8PuAa
         BUNtTuJwvoVhthVmHa2h2IOFreTk1naTYUAL7042VYRa7/AFA6S4LMYJ4VneKAe08P7s
         YK0M+vSuRytKbU2Bh3fp4XMrt2nkJ6M8s4MO+BZuCD7Ot42RDedDxctDEmA6NkRwlZyL
         r/qMcwsc25251vnqo2PG2xzeh7IToVXVzmS9XMVOkXIdlbc3K+IrLevBoRLpRPXLuXYU
         xRMdV/5eftsnmLQNh5T3qk88xjfTnrl9f6/pTRLM63vTIO+uL7IBmxqZNgUZ++19Yh7C
         MNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P0640m4NeG10qjpch2cOVQh+bHv5ZQPDXdCUWnzfzdA=;
        b=soGk1o2romaDxgskQx1byqA3Gnu4QFZeMEXePfb9DgQlWCCoD1d89PNMOBhV5ELt8A
         weADUWLE48TP/m+F1WBOQscvFfpRt0XngOsKU/DGu10uKHt8dS/j3EMgsCWw8MHhAkS/
         pbw7DwVPObDa994pfm1nnBh2Ljf8LVNJvt8CVmTb6IoyGG8Jg1X69Rjom/GO8c2DpHgn
         6e/GsAMOm3EXd5ZYDADTtEJB0yoHL+KVf4ekrLQFEOq+54gLNTsoKGkg84c2/Z2Xg8df
         NhxNO4ntqCLchuvQzKlykT8kZoZcjGf8xAH3S/OVwFV2oemv5vXM2eEhT1hFtyvyT1ir
         w5/Q==
X-Gm-Message-State: AOAM530BhPDv0ohnjpCmLPw7wrWrvjriPoCX6C5L66R6qa5cixZLKdae
        dKw/q00r2ETxBUurLiR1+DI=
X-Google-Smtp-Source: ABdhPJz+vIYzRjGHJK4yLN2l9Kp317miX7WKHiinnsfztPJK0si2S9oymiHzHkrOgZEWqNQeUZ/YjQ==
X-Received: by 2002:adf:ebc4:: with SMTP id v4mr4435158wrn.217.1621519782899;
        Thu, 20 May 2021 07:09:42 -0700 (PDT)
Received: from valhalla.home ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id m6sm8411974wml.3.2021.05.20.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 07:09:42 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 2/8] ACPI: scan: Add function to fetch dependent of acpi device
Date:   Thu, 20 May 2021 15:09:22 +0100
Message-Id: <20210520140928.3252671-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210520140928.3252671-1-djrscally@gmail.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
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
Changes since v3:

	Both new functions were renamed.

 drivers/acpi/scan.c     | 38 ++++++++++++++++++++++++++++++++++++++
 include/acpi/acpi_bus.h |  1 +
 2 files changed, 39 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 195635c3462b..1a76fbdfa669 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2105,6 +2105,21 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
 		device->handler->hotplug.notify_online(device);
 }
 
+static int acpi_return_dep_dev(struct acpi_dep_data *dep, void *data)
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
 static int acpi_scan_clear_dep(struct acpi_dep_data *dep, void *data)
 {
 	struct acpi_device *adev;
@@ -2168,6 +2183,29 @@ void acpi_dev_clear_dependencies(struct acpi_device *supplier)
 }
 EXPORT_SYMBOL_GPL(acpi_dev_clear_dependencies);
 
+/**
+ * acpi_dev_get_dependent_dev - Return ACPI device dependent on @supplier
+ * @supplier: Pointer to the dependee device
+ *
+ * Returns the first &struct acpi_device which declares itself dependent on
+ * @supplier via the _DEP buffer, parsed from the acpi_dep_list.
+ *
+ * The caller is responsible for putting the reference to adev when it is no
+ * longer needed.
+ */
+struct acpi_device *acpi_dev_get_dependent_dev(struct acpi_device *supplier)
+{
+	struct acpi_device *adev = NULL;
+
+	acpi_walk_dep_device_list(supplier->handle, acpi_return_dep_dev, &adev);
+
+	if (adev)
+		get_device(&adev->dev);
+
+	return adev;
+}
+EXPORT_SYMBOL_GPL(acpi_dev_get_dependent_dev);
+
 /**
  * acpi_bus_scan - Add ACPI device node objects in a given namespace scope.
  * @handle: Root of the namespace scope to scan.
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 0b2c4f170f4d..68d378207704 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -692,6 +692,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
 
 void acpi_dev_clear_dependencies(struct acpi_device *supplier);
+struct acpi_device *acpi_dev_get_dependent_dev(struct acpi_device *supplier);
 struct acpi_device *
 acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
 struct acpi_device *
-- 
2.25.1

