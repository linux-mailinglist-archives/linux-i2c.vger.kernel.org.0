Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4D12F969C
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 01:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbhARAfd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 19:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730532AbhARAf2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jan 2021 19:35:28 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19A7C0613C1;
        Sun, 17 Jan 2021 16:34:46 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id y17so14846229wrr.10;
        Sun, 17 Jan 2021 16:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PbvX9p++F2mDiu44jiSND5knwA5OcZJgkRIiG9x4IPE=;
        b=aK2h+ZKGBqLjK+HOsK8Eb94wCvZZPHTRYUej+vcgRDgyBKsMIHmwfl+IK5pu94V0EG
         9C86oP5mfCuSSVn/H1QmrHiJ3FwAa8iwt4W1Y5CUXK121frgvoxSGe26vlzjHr9+S1A0
         5+dc9s6vi3u2Q6RbKUHK5s7YKhgotybEZC5+ukSDjW5rq2fyhTSDCa4X3hp8Gc73fLYy
         gR24PgQGPz7T+Wi6P8qE7VmyNzvNV4IdO1vLa5sT/JjIEvtwG9z6ag6rD/hBdLTPICsB
         eP4KcjnTjj5JY4AwJ6FQLaPn+sjG3uHR7GO/IdszjqJsnOtt+/09bNFcvozu8LaoE67L
         YRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PbvX9p++F2mDiu44jiSND5knwA5OcZJgkRIiG9x4IPE=;
        b=Sry+6HM0bI3M3s45VmNvcM4yO9fCyaqet2ZqIQjC5JU3Zug3Yh3NnV5GcXXvE6XwJZ
         e2q5ZUL3gEzPhYIqP0tlU3n/WxE6PrE41ngOi6NZ7iERMgMJcuWjPWfttwaoFhCX2fHq
         G+6MQN/W65MXlQKK9NQy71prCBc9AiPWUDPy2Gydqgajmja5Ca5QTOT27k9uEr7uoaYk
         4CJEMohWqrcafhuX7oMPoZL3FVjCWBPgbxqMwI+Qw8Qlx0K97h+1InYyAqIgJ9f+TvQH
         cthkilRnWPZe78xG8ieQ8tRr5vJHHAtME/83RnWZKcnA32tbMPXWZtYdLq7D7ujcN4KU
         ViAQ==
X-Gm-Message-State: AOAM531L0E0ZN6lvUMp8LFVRBGXnoYtcwN4ukUosRewjFtdE/1zCShkZ
        x0C6GuSYLeOKwOuqWvxIbnyUNzhUwH/Rpw==
X-Google-Smtp-Source: ABdhPJzn7m9FqPVHSUWMPIKCaOySd8Kyzq/uVeNq66KJG9h3ejnku8fB0HiFon0VF+qkXnVSKChDFA==
X-Received: by 2002:a05:6000:104d:: with SMTP id c13mr22897288wrx.127.1610930085498;
        Sun, 17 Jan 2021 16:34:45 -0800 (PST)
Received: from valhalla.home ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id o124sm23642040wmb.5.2021.01.17.16.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 16:34:44 -0800 (PST)
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
Subject: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
Date:   Mon, 18 Jan 2021 00:34:25 +0000
Message-Id: <20210118003428.568892-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118003428.568892-1-djrscally@gmail.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We want to refer to an i2c device by name before it has been
created by the kernel; add a function that constructs the name
from the acpi device instead.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- Stopped using devm_kasprintf()

 drivers/i2c/i2c-core-acpi.c | 16 ++++++++++++++++
 include/linux/i2c.h         |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 37c510d9347a..98c3ba9a2350 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -497,6 +497,22 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
 
+/**
+ * i2c_acpi_dev_name - Construct i2c device name for devs sourced from ACPI
+ * @adev:     ACPI device to construct the name for
+ *
+ * Constructs the name of an i2c device matching the format used by
+ * i2c_dev_set_name() to allow users to refer to an i2c device by name even
+ * before they have been instantiated.
+ *
+ * The caller is responsible for freeing the returned pointer.
+ */
+char *i2c_acpi_dev_name(struct acpi_device *adev)
+{
+	return kasprintf(GFP_KERNEL, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
+}
+EXPORT_SYMBOL_GPL(i2c_acpi_dev_name);
+
 #ifdef CONFIG_ACPI_I2C_OPREGION
 static int acpi_gsb_i2c_read_bytes(struct i2c_client *client,
 		u8 cmd, u8 *data, u8 data_len)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 4d40a4b46810..b82aac05b17f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -998,6 +998,7 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 u32 i2c_acpi_find_bus_speed(struct device *dev);
 struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 				       struct i2c_board_info *info);
+char *i2c_acpi_dev_name(struct acpi_device *adev);
 struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
 #else
 static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
@@ -1014,6 +1015,10 @@ static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
 {
 	return ERR_PTR(-ENODEV);
 }
+static inline char *i2c_acpi_dev_name(struct acpi_device *adev)
+{
+	return NULL;
+}
 static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 {
 	return NULL;
-- 
2.25.1

