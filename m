Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D582C8575
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgK3Nd3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgK3Nd0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:26 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDD8C061A4C;
        Mon, 30 Nov 2020 05:32:12 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a3so25182525wmb.5;
        Mon, 30 Nov 2020 05:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1qZxQUVXboQ5crtln8dmuzp3bJm0oO37ggxavzFk5EY=;
        b=pth4rsTAOYyO3nOYNkmd0bEgCSufvk4P5pfvzoPTqAB7P226N5XLUiQe2Gvz2DqYlD
         SerdQB4+DhYCZbxujz67ARtSE7l6TfTnonxQefIF5anJ0rk0P6l6EgpjxnKLIUDSGSz1
         xkC0wi9gVvz2xC8HVZnQq2dQmfS5y56BDFSDlwgNDBe9lL+5lXtRz7Hut6kToiK611TB
         NunVEkcje6I/kmHsL6Lh1lRc5S9MiDNI7baEbiYvyp7/Bb28IVAn9Rc+Uo3jMR20MDas
         wKqhZQWKmsYRk/F1ZFtD4DFMApjMiRJko2/FBs30BeardCq/tNPuoO441MuMSuNEUyrs
         Ms2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1qZxQUVXboQ5crtln8dmuzp3bJm0oO37ggxavzFk5EY=;
        b=JypXlso3WB/BYY/cnRYUZCLBCHX45AHQ/Ol6IzdzLMbR6rQGMFASGNNNE/Qci7tJTb
         xr9I3HWEZnrbnInars/v0P289FCxOgVXt4z0xO00IlB5Eh/B+e1vSSOjmFbZeZ4emVaS
         wWzD3EWBfrqc2O4cEQhtG6c9dUBYNVaOGlpr03iJygoXaizqKgfIGVNqiXe891MWTRuq
         lFQrBAFLSCzIItm3yXGOpXHI1qtG8/TjStJBhDJ3wFrVc8ClG29zNbkFyvga5x5Bkc8A
         Jh2f0dB3hczuXtDP1fSZhZfkir7YKbRtAHd6uvkyK5O6Ek71AA5BeWUxVJuJzHAkTeBg
         tp3w==
X-Gm-Message-State: AOAM530DgLIsQNBjxRP30FxyD1P9puPQelofk3nay8oeGXd86xFNlG26
        wEJx67YptsFeD56lLdcVRGMfdT9tuU+1Or5v
X-Google-Smtp-Source: ABdhPJxtLZvNBS/munaHOwK41hIYsQV7c/T+h5/DalrVRqJdU9cHqO1a9xMnQXZQoTWmdtn6AzVBXg==
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr23333228wmh.54.1606743130456;
        Mon, 30 Nov 2020 05:32:10 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:09 -0800 (PST)
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
Subject: [PATCH 12/18] acpi: Add acpi_dev_get_next_match_dev() and macro to iterate through acpi_devices matching a given _HID
Date:   Mon, 30 Nov 2020 13:31:23 +0000
Message-Id: <20201130133129.1024662-13-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To ensure we handle situations in which multiple sensors of the same
model (and therefore _HID) are present in a system, we need to be able
to iterate over devices matching a known _HID but unknown _UID and _HRV
 - add acpi_dev_get_next_match_dev() to accommodate that possibility and
change acpi_dev_get_first_match_dev() to simply call the new function
with a NULL starting point. Add an iterator macro for convenience.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	- Patch introduced

 drivers/acpi/utils.c    | 30 ++++++++++++++++++++++++++----
 include/acpi/acpi_bus.h |  7 +++++++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index d5411a166685..c177165c8db2 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -843,12 +843,13 @@ bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
 EXPORT_SYMBOL(acpi_dev_present);
 
 /**
- * acpi_dev_get_first_match_dev - Return the first match of ACPI device
+ * acpi_dev_get_next_match_dev - Return the next match of ACPI device
+ * @adev: Pointer to the previous acpi_device matching this hid, uid and hrv
  * @hid: Hardware ID of the device.
  * @uid: Unique ID of the device, pass NULL to not check _UID
  * @hrv: Hardware Revision of the device, pass -1 to not check _HRV
  *
- * Return the first match of ACPI device if a matching device was present
+ * Return the next match of ACPI device if another matching device was present
  * at the moment of invocation, or NULL otherwise.
  *
  * The caller is responsible to call put_device() on the returned device.
@@ -856,8 +857,9 @@ EXPORT_SYMBOL(acpi_dev_present);
  * See additional information in acpi_dev_present() as well.
  */
 struct acpi_device *
-acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
+acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv)
 {
+	struct device *start = adev ? &adev->dev : NULL;
 	struct acpi_dev_match_info match = {};
 	struct device *dev;
 
@@ -865,9 +867,29 @@ acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
 	match.uid = uid;
 	match.hrv = hrv;
 
-	dev = bus_find_device(&acpi_bus_type, NULL, &match, acpi_dev_match_cb);
+	dev = bus_find_device(&acpi_bus_type, start, &match, acpi_dev_match_cb);
 	return dev ? to_acpi_device(dev) : NULL;
 }
+EXPORT_SYMBOL(acpi_dev_get_next_match_dev);
+
+/**
+ * acpi_dev_get_first_match_dev - Return the first match of ACPI device
+ * @hid: Hardware ID of the device.
+ * @uid: Unique ID of the device, pass NULL to not check _UID
+ * @hrv: Hardware Revision of the device, pass -1 to not check _HRV
+ *
+ * Return the first match of ACPI device if a matching device was present
+ * at the moment of invocation, or NULL otherwise.
+ *
+ * The caller is responsible to call put_device() on the returned device.
+ *
+ * See additional information in acpi_dev_present() as well.
+ */
+struct acpi_device *
+acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
+{
+	return acpi_dev_get_next_match_dev(NULL, hid, uid, hrv);
+}
 EXPORT_SYMBOL(acpi_dev_get_first_match_dev);
 
 /*
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index a3abcc4b7d9f..0a028ba967d3 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -688,9 +688,16 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 
 bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
 
+struct acpi_device *
+acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
 struct acpi_device *
 acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv);
 
+#define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
+	for (adev = acpi_dev_get_first_match_dev(hid, uid, hrv);	\
+	     adev;							\
+	     adev = acpi_dev_get_next_match_dev(adev, hid, uid, hrv))
+
 static inline void acpi_dev_put(struct acpi_device *adev)
 {
 	put_device(&adev->dev);
-- 
2.25.1

