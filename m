Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6A3415D7D1
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2020 13:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgBNM4n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Feb 2020 07:56:43 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53701 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgBNM4m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Feb 2020 07:56:42 -0500
Received: by mail-pj1-f65.google.com with SMTP id n96so3862815pjc.3
        for <linux-i2c@vger.kernel.org>; Fri, 14 Feb 2020 04:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZbniyEJTirTbUN5Kp5MdouPYcKx6sF+19/2+jH3u4Lk=;
        b=oF2pMkiuT35X59x5AqHzby30zwlqdIhEHCuBzT6nQZ6ZHXv3qjXkrmUAPEAo/P+iyF
         GhqeFOPMGa7T93ucE1JiX1+4494VNcok9Dd8KDoEoZKg82IO88U4XBmcvb0YBtdPnxJH
         e8mRFmIdgx8f4/epmgXJP6j5bSI28L03vXX7vWIsqyLFvLBqJlKHjvG598PZLu7AN+3L
         RYTVFx9RYC6dq2/GlhUkjBCTmgf4MtWHVMJtHN8pNJ0JwMgRpKlFVCnhnHfN+Jr3XqRx
         NyQMKuR9Iqrn4Y0L9e8z2BJ3HzNRfFzmHVg9mRTNla2b80HKFFLP5geGqTV+UYCmdElv
         4/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZbniyEJTirTbUN5Kp5MdouPYcKx6sF+19/2+jH3u4Lk=;
        b=ZwAGPUK56L7OZWbmktinxmEDmYCDBF+SdGMFsswyQWAsY3qTAzSEDEOEs3iqCuJWUs
         p43BodOOd5OM0bywvaZFlwpaQt6s2sJgN4hEyva5AUShpPce2ktWaVxVTQVv+E9as0Cw
         CRvJNdspsc2jL8KcxIgiUeLgjuL8slSsrxRrG6+oZIJJNyt8BEc+c4A4EBvnSAdC4Wqs
         NfX2G1XC18PZ7FGyn8f760xb6SNMD9n9WnHgEBtka7evysgn3c9+Sx8Q7/UofumxOBzV
         Mm4f6Z3IDR8bwVsz37WkwkWa89v+7ZIB2Jd+q+O/s56FDt5FEXcNXYjSZqU6Yx4zLj1j
         LZoQ==
X-Gm-Message-State: APjAAAXVc3GMNfNbjzsDPGswqW2PXwSkY+Wha9om7BPzO1clV4OA3f9/
        x2mgYiHdtSL9CJiCPr7DSkU=
X-Google-Smtp-Source: APXvYqwX+G79PST9JoCTtHWjQcRCq6xNoEU4YwUAyvbJ3Na+YDNRTqfrYXS6Cpc0n2c9BBfbptPwrQ==
X-Received: by 2002:a17:90a:7784:: with SMTP id v4mr3496290pjk.134.1581685002252;
        Fri, 14 Feb 2020 04:56:42 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id b1sm7350834pgs.27.2020.02.14.04.56.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 14 Feb 2020 04:56:41 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] i2c: use kobj_to_dev() API
Date:   Fri, 14 Feb 2020 20:56:37 +0800
Message-Id: <1581684997-8322-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Use kobj_to_dev() API instead of container_of().

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index db9763c..cb415b1 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -96,7 +96,7 @@ static ssize_t i2c_slave_eeprom_bin_read(struct file *filp, struct kobject *kobj
 	struct eeprom_data *eeprom;
 	unsigned long flags;
 
-	eeprom = dev_get_drvdata(container_of(kobj, struct device, kobj));
+	eeprom = dev_get_drvdata(kobj_to_dev(kobj));
 
 	spin_lock_irqsave(&eeprom->buffer_lock, flags);
 	memcpy(buf, &eeprom->buffer[off], count);
@@ -111,7 +111,7 @@ static ssize_t i2c_slave_eeprom_bin_write(struct file *filp, struct kobject *kob
 	struct eeprom_data *eeprom;
 	unsigned long flags;
 
-	eeprom = dev_get_drvdata(container_of(kobj, struct device, kobj));
+	eeprom = dev_get_drvdata(kobj_to_dev(kobj));
 
 	spin_lock_irqsave(&eeprom->buffer_lock, flags);
 	memcpy(&eeprom->buffer[off], buf, count);
-- 
1.9.1

