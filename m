Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C470E206FC4
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jun 2020 11:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387926AbgFXJMo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jun 2020 05:12:44 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:33840 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387614AbgFXJMo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Jun 2020 05:12:44 -0400
Received: by mail-ej1-f66.google.com with SMTP id y10so1737382eje.1;
        Wed, 24 Jun 2020 02:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YdWYqCcMRr77s7ONOlycpXkNOF5ibDahUUAFISahTZ8=;
        b=rPyKw2iNt+MTqobRya2IA59wOB0kW2fPybRkeBN3EmjBzaGBk/j6Y7zrGS+TlZu1rK
         fvHnBWpSZc0jp7aFKMerC3VbFgc+fvyo328Nh5omIr3we0wmB6OVIOcti8k5emV7PfRv
         Ve2nTpLMwgxAQ1jczDtisSIErjv2yU+mbvgRjQBboBZ/Y622m0oyxVoyfhwH05ex1K/2
         Kt6bUtWgbvTjIcJVKNxjxXn/LupfinVJWugGEeZ9PGWQQNW9oASqwhaDRuNI068JQTOc
         gVq2LWj1F8dHavy6nOEgd5hzbEriaeubfFRxslW5193k45zsUnEA3y9G0/BMvKCP60ki
         k8gw==
X-Gm-Message-State: AOAM533j86JTTNYid2gDlz+SzXiRYwxNmcvfKzJC9K3PfJQNOEF+RlYu
        FddUqiRJgGxR1dc2bNSkpC4=
X-Google-Smtp-Source: ABdhPJw+6nm3RPauYFejP5pE6TcOmJh0UYlB9uSK8bOa6dCg7F66bo2p5kNrBvg9wZ4p/DNKLHBPhg==
X-Received: by 2002:a17:906:4c81:: with SMTP id q1mr24499860eju.273.1592989962320;
        Wed, 24 Jun 2020 02:12:42 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 36sm16585162edl.31.2020.06.24.02.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 02:12:41 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH] i2c: designware: platdrv: Set class based on dmi
Date:   Wed, 24 Jun 2020 11:12:39 +0200
Message-Id: <20200624091239.802218-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Current AMD's zen-based APUs use this core for some of its i2c-buses.

With this patch we re-enable autodetection of hwmon-alike devices, so
lm-sensors will be able to work automatically.

It does not affect the boot-time of embedded devices, as the class is
set based on the dmi information.

Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c2efaaaac252..f0a02fc3c135 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -191,6 +191,13 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 	return ret;
 }
 
+static bool dw_i2c_hwmon_bus(void)
+{
+	if (strstr(dmi_get_system_info(DMI_PRODUCT_NAME), "QT5222"))
+		return true;
+	return false;
+}
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -267,7 +274,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_DEPRECATED;
+	adap->class = dw_i2c_hwmon_bus() ? I2C_CLASS_HWMON
+					 : I2C_CLASS_DEPRECATED;
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
 	adap->nr = -1;
-- 
2.27.0

