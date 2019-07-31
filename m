Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72EF87BEB8
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2019 12:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbfGaK4w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Jul 2019 06:56:52 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36109 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfGaK4w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Jul 2019 06:56:52 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so65155323ljj.3
        for <linux-i2c@vger.kernel.org>; Wed, 31 Jul 2019 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lWUtb7zcpjriA4PXCl0a7ByZXS09QukiEbZhHIw2Fjk=;
        b=jH3yCYNA8+Yew2LxOI67IHkIjKIsIvFHYzr03cz0THjJFGu0OSsiDwfWUan3chbQpm
         mZEmEi3yMQkW1v4HReuKE3j4j9p/8Wx1FKkBKXDmoKkeeNOzFy1e48b9yGjieDjSvsLl
         q6eJ0Q3q7/4RU5n4aXwx1Il4o8xewvLD3mclXDsKyWQwmw6bds/boYFyVWwpAL1NV7N6
         P3d9H0F6jh2iWh6vDuzyv9gWB6jawLP/p5I8bS9gfxJ4IGJzLQUx1/wwy2IxRGylUo9x
         Mqx/a4sZNY16xHx/NQ2Se9O54+kiXJrC7MQtmbgVdCRhev9A/ltJvrS1pJnXqlQhKfwl
         xyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lWUtb7zcpjriA4PXCl0a7ByZXS09QukiEbZhHIw2Fjk=;
        b=cplEyHD6m8aW55hx3jr+dWbyeZwMkSO6+yQWma/kTGmck+sb+FFUiIItcLUlPDGHLP
         a5ldpxTT/qsbKS3ycwDbktvtW/DiuBBjGBM7kk4endhkZm8AV6SD9qMWvJ6yirpZc5I2
         5caHQ/DVmqQHHzwZQ+3vknzrxTguN+gQVTZIx2185YaFIajm0RfIvCqy/NOgwJGtsLQI
         HFXyuk5+dQ8qFHGfUe48HisEFSj8w8wocJfHTSL/aSnq5J03ypWH6gCYJYLpGkiLwzV4
         k2QFJRBrJntszR9vPfMUjR0tD1XNo9UBOnaFUyCALcwv9sfBO10lLuAtUtmHNs8uuY21
         gaVw==
X-Gm-Message-State: APjAAAUn6MjikVF7ePcA+TMWidvZLqYYwjlktFGnygeOeP6aSRBR8Fg7
        G1bJAqOh4lJMUhFDjBKpmLuPCw==
X-Google-Smtp-Source: APXvYqxyeEQO8uE5Fdhzw9ds+s0/2GTAh6VgDFeXsuRN/l7VM3timHKnAv7SQw94o9XSRrHPLEphKA==
X-Received: by 2002:a2e:b0e6:: with SMTP id h6mr12041708ljl.18.1564570610667;
        Wed, 31 Jul 2019 03:56:50 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se. [213.112.60.36])
        by smtp.gmail.com with ESMTPSA id l11sm13191843lfc.18.2019.07.31.03.56.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 03:56:50 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     mika.westerberg@linux.intel.com, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] i2c: core: remove unused function
Date:   Wed, 31 Jul 2019 12:56:42 +0200
Message-Id: <20190731105642.29664-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

GCC warns taht function 'i2c_acpi_find_match_adapter()' is not used.

../drivers/i2c/i2c-core-acpi.c:347:12: warning:
  ‘i2c_acpi_find_match_adapter’ defined but not used [-Wunused-function]
 static int i2c_acpi_find_match_adapter(struct device *dev, const void *data)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Rework to remove the function 'i2c_acpi_find_match_adapter()'.

Fixes: 00500147cbd3 ("drivers: Introduce device lookup variants by ACPI_COMPANION device")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/i2c/i2c-core-acpi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index bc80aafb521f..bb6b39fe343a 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -344,17 +344,6 @@ u32 i2c_acpi_find_bus_speed(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_find_bus_speed);
 
-static int i2c_acpi_find_match_adapter(struct device *dev, const void *data)
-{
-	struct i2c_adapter *adapter = i2c_verify_adapter(dev);
-
-	if (!adapter)
-		return 0;
-
-	return ACPI_HANDLE(dev) == (acpi_handle)data;
-}
-
-
 struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 {
 	struct device *dev = bus_find_device_by_acpi_dev(&i2c_bus_type, handle);
-- 
2.20.1

