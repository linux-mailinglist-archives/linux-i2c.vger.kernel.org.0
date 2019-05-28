Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072042D1D9
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 01:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbfE1XCj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 19:02:39 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39138 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbfE1XCg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 19:02:36 -0400
Received: by mail-pg1-f195.google.com with SMTP id w22so102718pgi.6
        for <linux-i2c@vger.kernel.org>; Tue, 28 May 2019 16:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s2ViynWJZEyN8mcu6TmbFxSpMS7SsoypON3/YHWH96A=;
        b=St/vjj6Qqr4VrnqnZt7lhqXW524lNYAN8dAdBgBacW3KRPKYy8Wg6HrwtcmYXieLsr
         2kwhx8/aTOPSBOgQBUK747dtMYB+e43bhpyGGz3RjdfZ+fUUYAxE0/TivmEU1fy9ZhQF
         8x+OP7ChowWrXUwDhs0nuQce21mTBh4CPydsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s2ViynWJZEyN8mcu6TmbFxSpMS7SsoypON3/YHWH96A=;
        b=Mmdy00YUBfGWOyFWlYJVy8Z9zHkgeljL2h27uhFFP4pwAtP9s7e3AI3E+r7FBVFGcO
         yZfmawbkdvsAt7oyEI/mow31T0rKALD4eEHinrD00m5KvYVxS+HYkMxotOsD8E9GDjse
         cMjk69gARJvCYPoA1bzUeiaSqhukbCxcxK7DxxWWVbKOWIX4epDiStVBOBShi3n2wrnM
         CAlER+TjMVKVpFFT7Q13rkaRjHp4QIdH648xB9tgJ6b71s+u9aNPcdza5mrb3A3s0SeM
         GKZcZhxLVyhGdiGZ9oHl6xHqo81KWNNX0vxDsorVojf+WEG/NDqcxeBAYg5YxWt2bbU7
         JgJg==
X-Gm-Message-State: APjAAAXIhW7sjQzLxj0lsBCdvdTME9rDY4N1aBYZxPOkTX3dgKVZW3jP
        dTxdchKhRQjvh07FMKO6U97kXw==
X-Google-Smtp-Source: APXvYqxkjw4TsyenlTd45BRn+EsgZDClxPQgonXCVk8Xvy+wPAE8+WBlyAt1u5RrmXA1QHPFV4LWSw==
X-Received: by 2002:a62:5244:: with SMTP id g65mr23525695pfb.237.1559084555903;
        Tue, 28 May 2019 16:02:35 -0700 (PDT)
Received: from p50.cisco.com ([128.107.241.183])
        by smtp.gmail.com with ESMTPSA id p16sm27028196pfq.153.2019.05.28.16.02.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 16:02:35 -0700 (PDT)
From:   Ruslan Babayev <ruslan@babayev.com>
To:     mika.westerberg@linux.intel.com, wsa@the-dreams.de,
        linux@armlinux.org.uk, andrew@lunn.ch, f.fainelli@gmail.com,
        hkallweit1@gmail.com, davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        xe-linux-external@cisco.com
Subject: [net-next,v4 1/2] i2c: acpi: export i2c_acpi_find_adapter_by_handle
Date:   Tue, 28 May 2019 16:02:32 -0700
Message-Id: <20190528230233.26772-2-ruslan@babayev.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190528230233.26772-1-ruslan@babayev.com>
References: <20190528230233.26772-1-ruslan@babayev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This allows drivers to lookup i2c adapters on ACPI based systems similar to
of_get_i2c_adapter_by_node() with DT based systems.

Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
Cc: xe-linux-external@cisco.com
---
 drivers/i2c/i2c-core-acpi.c | 3 ++-
 include/linux/i2c.h         | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 272800692088..964687534754 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -337,7 +337,7 @@ static int i2c_acpi_find_match_device(struct device *dev, void *data)
 	return ACPI_COMPANION(dev) == data;
 }
 
-static struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
+struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 {
 	struct device *dev;
 
@@ -345,6 +345,7 @@ static struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 			      i2c_acpi_find_match_adapter);
 	return dev ? i2c_verify_adapter(dev) : NULL;
 }
+EXPORT_SYMBOL_GPL(i2c_acpi_find_adapter_by_handle);
 
 static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 1308126fc384..e982b8913b73 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -14,6 +14,7 @@
 #ifndef _LINUX_I2C_H
 #define _LINUX_I2C_H
 
+#include <linux/acpi.h>		/* for acpi_handle */
 #include <linux/mod_devicetable.h>
 #include <linux/device.h>	/* for struct device */
 #include <linux/sched.h>	/* for completion */
@@ -981,6 +982,7 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 u32 i2c_acpi_find_bus_speed(struct device *dev);
 struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 				       struct i2c_board_info *info);
+struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
 #else
 static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 					     struct acpi_resource_i2c_serialbus **i2c)
@@ -996,6 +998,10 @@ static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
 {
 	return NULL;
 }
+static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
+{
+	return NULL;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _LINUX_I2C_H */
-- 
2.19.2

