Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1DCE2C8585
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgK3NdU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgK3NdS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:18 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1539CC061A51;
        Mon, 30 Nov 2020 05:32:16 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r3so16246791wrt.2;
        Mon, 30 Nov 2020 05:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g3BMXw9JzXtFm16YDoDU8hR3/fKFvazRWYpnvqcHgAY=;
        b=f0hTX38WWoYFOqduIv8btPWQeeYXnpvQT0AKV2DDZ116iEm5JP+YpIbA3czDOvy1oI
         obkFPRnUjDfiJaPS9g4M7+yHNIeMXc6tWNwgTi/ZCp/2wvvVoavHx5mJ3+T+YhlVDH4Y
         UlWwoPadkMAF/1W74cggIXpoD8Rx6+r1IG0mm0NLiRssof/Oo2HjpJLpfJt36TLWGCkl
         uvQcBwzlh794D+3V/6d4aOGSKMFglZbKF2hCdd8CJElgla5M2GilkvV6sSwXqpW/MAL8
         F9sqikgb2+/DBlTINJ+Zpb0DiEHAecd+4i+A5U3QiFYX7LloHZYnR6VWHLpKkhasrEkY
         yYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g3BMXw9JzXtFm16YDoDU8hR3/fKFvazRWYpnvqcHgAY=;
        b=T/fL5sa8bTL1QNUlynW360oRyFWrk2BBmksnygFm4Rqpi4khfZnDg5SeAU2xzma3RR
         njkfpoSFmujQYz/f/5iOGwHuZkZzOUh/jXE0UNckdoqlTc7ZTFgC0Is1net1FYj+G/Iv
         r59HEnIb+sTvuC6NsHJmcRJOX+bwfi9oZzx/puwvO4o4ohnlHSAHETCFi5tclvSk6+gu
         6DAQ6HukHCWT9QC2/XzdfurmdHBEsQSyQ6onzCkgrTkgwSxTjov+Lc0SeLhahWUCjdYH
         +UOA19D7ly09VKrv649VMuo6U7Y9dt/O9KABozPfef6h5fNrMX3XoQbCLFOeEA8VrXnh
         9jDQ==
X-Gm-Message-State: AOAM531c9/rs7WGkW1fuONtjh3Pc4BrdvlW5NED3/E0vWdGG6QH/vJw7
        3CPS7qeGM/TVf1gDpnjDXGzctqmh9Ik9A/5G
X-Google-Smtp-Source: ABdhPJzDCcxaoTO342dCdUscQv15sIxKHbckb9UWSMvt9SP2Hs4Rezs8wWCAwD8sNCiCr+Mm4eFlHA==
X-Received: by 2002:adf:ecc9:: with SMTP id s9mr28663695wro.246.1606743133595;
        Mon, 30 Nov 2020 05:32:13 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:12 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: [PATCH 14/18] acpi: utils: Add function to fetch dependent acpi_devices
Date:   Mon, 30 Nov 2020 13:31:25 +0000
Message-Id: <20201130133129.1024662-15-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ACPI devices declare themselves dependent on other devices via the _DEP
buffer. Fetching the dependee from dependent is a matter of parsing
_DEP, but currently there's no method to fetch dependent from dependee.
Add one, so we can parse sensors dependent on a PMIC from the PMIC's
acpi_driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	- Patch introduced

 drivers/acpi/utils.c    | 68 +++++++++++++++++++++++++++++++++++++++++
 include/acpi/acpi_bus.h |  2 ++
 2 files changed, 70 insertions(+)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index c177165c8db2..7099529121db 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -807,6 +807,52 @@ static int acpi_dev_match_cb(struct device *dev, const void *data)
 	return hrv == match->hrv;
 }
 
+static int acpi_dev_match_by_dep(struct device *dev, const void *data)
+{
+	struct acpi_device *adev = to_acpi_device(dev);
+	const struct acpi_device *dependee = data;
+	struct acpi_handle_list dep_handles;
+	struct acpi_device *candidate;
+	acpi_handle handle;
+	acpi_status status;
+	unsigned int i;
+	int ret;
+
+	handle = adev->handle;
+
+	if (!acpi_has_method(handle, "_DEP"))
+		return 0;
+
+	status = acpi_evaluate_reference(handle, "_DEP", NULL, &dep_handles);
+	if (ACPI_FAILURE(status))
+		return 0;
+
+	for (i = 0; i < dep_handles.count; i++) {
+		struct acpi_device_info *info;
+
+		status = acpi_get_object_info(dep_handles.handles[i], &info);
+		if (ACPI_FAILURE(status))
+			continue;
+
+		if (info->valid & ACPI_VALID_HID) {
+			ret = acpi_bus_get_device(dep_handles.handles[i], &candidate);
+			if (ret || !candidate) {
+				kfree(info);
+				continue;
+			}
+
+			if (candidate == dependee) {
+				acpi_dev_put(candidate);
+				kfree(info);
+				return 1;
+			}
+
+			kfree(info);
+		}
+	}
+	return 0;
+}
+
 /**
  * acpi_dev_present - Detect that a given ACPI device is present
  * @hid: Hardware ID of the device.
@@ -842,6 +888,28 @@ bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
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
  * @adev: Pointer to the previous acpi_device matching this hid, uid and hrv
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 0a028ba967d3..f5dfeb030b9c 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -688,6 +688,8 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 
 bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
 
+struct acpi_device *
+acpi_dev_get_next_dep_dev(struct acpi_device *adev, struct acpi_device *prev);
 struct acpi_device *
 acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
 struct acpi_device *
-- 
2.25.1

