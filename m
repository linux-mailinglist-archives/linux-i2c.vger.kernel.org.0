Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27E12C856C
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgK3Ndp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgK3Ndn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:43 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF1EC061A52;
        Mon, 30 Nov 2020 05:32:16 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id d3so15384645wmb.4;
        Mon, 30 Nov 2020 05:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jx3a1AHoq9drKHNXIr2dchc7sTh/KrOlq0lIEE/z1CM=;
        b=ZboWROXtaYKvtFfbq1ELckUauK4Mg57diLs3Qv1A6o05u5TDqN1trpGRVnVwmDA2Un
         SiNshu4YDMyXU4JlSy8q4o+4eu7AlE2Jc2Qmismx9q6nmdOG+zqdjtgKyTGr7YDzUw+b
         XNeYV398+vuk/rlJOHvGzsCkduBMna71C1rSCws2UBc8YIa28o0+GhwTaLiG6jeZMlk0
         pmgZJpKnXt3pwOyYyxnqr9ANWChZ25eJaGAmWhRbyyRGKwR7PN0JZVRz06pRVQc/L4bP
         zcd96HYbJ6O0aEGKleab0G0W2SjJ8BEL1Fm8Q0JWNQnDH3s875wXNx2vN7RkwDbV+JvN
         PckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jx3a1AHoq9drKHNXIr2dchc7sTh/KrOlq0lIEE/z1CM=;
        b=jRtJ5bu+jiZl8kpXwGjSHA1fsvWhsg5vgYY8Ku/P+kLSpC4ZCVlvksR82FDZIIaP6W
         8mBFf0DttrBVWTKQpinExHhTxR4oD2cKRFHTZejvWjzvi6r2lHE0U73J6VtQBk3oM6bO
         DmamO1Wgs80lqM55YgCumQVWiuLvJhAg+aOczjbbHlKNum5VSwJ0xlX1zEFS4fgeaXOW
         jF09eArFpsb+LSuffe7qXQ7bF8tRs6g4c2EK6z1KOuqdCDk/J3xzB18thmFgWsJUZExl
         2LSWZJUPcv1oAPn1Gh3498kMIF2+I3U8IHd+hDZppqm3AMY5T0/SpuqqaT4b8D8e5xwp
         QTpw==
X-Gm-Message-State: AOAM5337VrQmSN6Mq1yTebV//2BLXwwwWiRxWkBJzj3e4gfbOFHVBe6S
        LE5SFuazbDSmalYyMB8gHYK73KS0Awb+FqS/
X-Google-Smtp-Source: ABdhPJx2XYmLEhxwD4GDyLxa/m/rn9eBir8T7DakT9rLA4kl14HeBZiBELU2jlYYE18zHPxm/56vow==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr23965371wmb.175.1606743135351;
        Mon, 30 Nov 2020 05:32:15 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:14 -0800 (PST)
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
Subject: [PATCH 15/18] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
Date:   Mon, 30 Nov 2020 13:31:26 +0000
Message-Id: <20201130133129.1024662-16-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some places in the kernel allow users to map resources to a device
using device name (for example, gpiod_lookup_table). Currently
this involves waiting for the i2c_client to have been registered so we
can use dev_name(&client->dev). Adding this function means that we can
achieve the same thing without having to wait to the i2c device.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	- Patch introduced

 drivers/i2c/i2c-core-acpi.c | 14 ++++++++++++++
 include/linux/i2c.h         |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 37c510d9347a..d3a653eac79e 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -497,6 +497,20 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
 
+/**
+ * i2c_acpi_dev_name - Construct i2c device name for devs sourced from ACPI
+ * @adev:     ACPI device to construct the name for
+ *
+ * Prefixes "i2c-" to the ACPI device name, for use in i2c_dev_set_name() and
+ * also anywhere else in the kernel that needs to refer to an i2c device by
+ * name but before they have been instantiated.
+ */
+char *i2c_acpi_dev_name(struct acpi_device *adev)
+{
+	return kasprintf(GFP_KERNEL, "i2c-%s", acpi_dev_name(adev));
+}
+EXPORT_SYMBOL_GPL(i2c_acpi_dev_name);
+
 #ifdef CONFIG_ACPI_I2C_OPREGION
 static int acpi_gsb_i2c_read_bytes(struct i2c_client *client,
 		u8 cmd, u8 *data, u8 data_len)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..ab0e505b2ca6 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -995,6 +995,7 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 u32 i2c_acpi_find_bus_speed(struct device *dev);
 struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 				       struct i2c_board_info *info);
+char *i2c_acpi_dev_name(struct acpi_device *adev);
 struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
 #else
 static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
@@ -1011,6 +1012,10 @@ static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
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

