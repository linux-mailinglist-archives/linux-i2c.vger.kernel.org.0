Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30992F96BC
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 01:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730730AbhARAh1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 19:37:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730507AbhARAfY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jan 2021 19:35:24 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54217C061575;
        Sun, 17 Jan 2021 16:34:44 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id c5so14846553wrp.6;
        Sun, 17 Jan 2021 16:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxyOObT1sg5s9bWkUVceIGz0KKXfziZMqNtmhxIBUsg=;
        b=QzL/Nu1C+vMnHFaRThEDIZe5Ncq5Of2W3gkYCJnm8AmU7SESXNgasBnk8UNZDddGaQ
         NY2UFS1U4m8+RsHxWIsXCuHC55DliW48CVdjoyr/Hcn1plYmlhE+l47VbBxLoz8itTu2
         aZo45y9QldNIOq5Rzwd+s1ivBqcKHiGqlxioGfubLKYAdjh4m37/fcMJWFQus9zOugXS
         c2PKC6sAQ6Am6/ejcfKwnxansf6BufsA8GzXsQYwjgJtbZ4C5jlb8HNHBXaD+lJ3jQiN
         ZY1wZFnmzKWrxFBPslIqd9GIVPEHI3y+LjYJCjN6WD5tpfhV22TIdQt7X/v833C874MM
         pfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxyOObT1sg5s9bWkUVceIGz0KKXfziZMqNtmhxIBUsg=;
        b=NyUYXtlmW9rx/aHp6K/xozCJP1rNchifLWx8LL2ebFjUiWvoVSLsk1RbIDOvTeQ24j
         j10xNCp0SgDwk49PNcAHhCB4fw2fGb9cw3FaTOGpA8qyTcDO/6FY3GxVj7tiayEApjzA
         S+e6qmLaINLFsTsEBgKVFvYBtG79IFxlTd0bHCsCCmKko13TKEssjxzDWrQ55oG1wiKo
         Rld9R4CZwZ33/2j8tk4TPi1b+SFyulvutqvwuL1TiHMXeB1UptDCe3fJBeGH+R7raLSt
         uklrwOV/GOc18nJmXmaBcqOYr7yw8TNYOAiFWQkZgzE4wcio3kkU5hfQ6xNU2Lt/jDwU
         2gGA==
X-Gm-Message-State: AOAM530nHKW984q5KIRC22FxPYRyxBzOE9tmt8LOu364uVfUnYKkXtbx
        Gvlk/LFBsz5Gwrztb6GyYckTT3dA2ylOwA==
X-Google-Smtp-Source: ABdhPJwP8X4dWttjUj1Bb2v8rxhV65TD73lpEEX+TkikPku+vK0TaGlSy9mss5ow/8gIZF3SXV9r4Q==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr23185951wrj.339.1610930083018;
        Sun, 17 Jan 2021 16:34:43 -0800 (PST)
Received: from valhalla.home ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id o124sm23642040wmb.5.2021.01.17.16.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 16:34:42 -0800 (PST)
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
Subject: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent acpi_devices
Date:   Mon, 18 Jan 2021 00:34:23 +0000
Message-Id: <20210118003428.568892-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118003428.568892-1-djrscally@gmail.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In some ACPI tables we encounter, devices use the _DEP method to assert
a dependence on other ACPI devices as opposed to the OpRegions that the
specification intends. We need to be able to find those devices "from"
the dependee, so add a function to parse all ACPI Devices and check if
the include the handle of the dependee device in their _DEP buffer.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:
	- Used acpi_lpss_dep() as Andy suggested.

 drivers/acpi/utils.c    | 34 ++++++++++++++++++++++++++++++++++
 include/acpi/acpi_bus.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index 78b38775f18b..ec6a2406a886 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -831,6 +831,18 @@ bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
 	return false;
 }
 
+static int acpi_dev_match_by_dep(struct device *dev, const void *data)
+{
+	struct acpi_device *adev = to_acpi_device(dev);
+	const struct acpi_device *dependee = data;
+	acpi_handle handle = dependee->handle;
+
+	if (acpi_lpss_dep(adev, handle))
+		return 1;
+
+	return 0;
+}
+
 /**
  * acpi_dev_present - Detect that a given ACPI device is present
  * @hid: Hardware ID of the device.
@@ -866,6 +878,28 @@ bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
 }
 EXPORT_SYMBOL(acpi_dev_present);
 
+/**
+ * acpi_dev_get_next_dep_dev - Return next ACPI device dependent on input dev
+ * @adev: Pointer to the dependee device
+ * @prev: Pointer to the previous dependent device (or NULL for first match)
+ *
+ * Return the next ACPI device which declares itself dependent on @adev in
+ * the _DEP buffer.
+ *
+ * The caller is responsible to call put_device() on the returned device.
+ */
+struct acpi_device *acpi_dev_get_next_dep_dev(struct acpi_device *adev,
+					      struct acpi_device *prev)
+{
+	struct device *start = prev ? &prev->dev : NULL;
+	struct device *dev;
+
+	dev = bus_find_device(&acpi_bus_type, start, adev, acpi_dev_match_by_dep);
+
+	return dev ? to_acpi_device(dev) : NULL;
+}
+EXPORT_SYMBOL(acpi_dev_get_next_dep_dev);
+
 /**
  * acpi_dev_get_next_match_dev - Return the next match of ACPI device
  * @adev: Pointer to the previous acpi_device matching this @hid, @uid and @hrv
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 02a716a0af5d..33deb22294f2 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -683,6 +683,8 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 
 bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
 
+struct acpi_device *
+acpi_dev_get_next_dep_dev(struct acpi_device *adev, struct acpi_device *prev);
 struct acpi_device *
 acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
 struct acpi_device *
-- 
2.25.1

