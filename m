Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E52E21BCB
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 18:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbfEQQjx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 12:39:53 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44643 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbfEQQjw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 12:39:52 -0400
Received: by mail-pf1-f196.google.com with SMTP id g9so3922716pfo.11;
        Fri, 17 May 2019 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Q14eH62D0Ig9mZ2azyQBuSLX07GFb0agZ0N0YeEOvXA=;
        b=e1bM/Cy+CbXxaDQfeGMKL9WT+JguvdyFAqk2HG4/YhYzQUOm1x5F/oVJfwRjJ4ioaX
         3RmsZtLkjQjxJ608cOQUURkvjEKiJDETxEXrP0gvrVSk09CHH4n2Pp8UhloZ6Bltl0nS
         cT3Mwe5V2actK4xucvpxDS2o8CUq9QMjGs8bcXGsnh6C5lUV0criQmw0NpAg5v4TXmEr
         Fyj1rFvKIvK3kE38t75BgAdt57q53KovXqnK2k//KGGOVa96MgJiJUIcrVEHdwQ0QFSH
         8MVFeNl0+RH62NNgMLX4hB9AAzwDiQqMVUu2LaMGm3W4q7A3VeU1waLSs0zHXa4WIeO3
         FYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Q14eH62D0Ig9mZ2azyQBuSLX07GFb0agZ0N0YeEOvXA=;
        b=NBqn3jUFhvapAmURd1RsbVZUhflxY5voSms5ddKvJGpn+0JaEtTHfzVsrcDx+9PWkt
         wNEjeo/Sc3svFGzmJVNBkmsVfgdEAi6MLo+1vutm5T+82mAUq2e3RAm8SNVIO5kq2yLd
         W4IIs/Ank8diduMnvPolS4d1IbrT/JgB32OWgAL+ZUXFL9mXbVGg0qZA+jj9YoOvK83Y
         BZYhcc7TgcPCZb0nKD8XuDfPXQoJrVFzfFu//jqgsICeh/wQ8BD4DmZWBoQHyXVVMeff
         z9oxUjAb/dC9clXuvse+UwV6bR6Ve4VVE00x6xoEF67UodRpGDpWtNz8DM7Ojh4n0xA7
         S9YA==
X-Gm-Message-State: APjAAAUfKReJQfLJa1Ekqn7pxeZZ+5yD7ERxil7+fM4trF7BUKxogukF
        tcMJsKYcVXvlKkV4GPBUnOo=
X-Google-Smtp-Source: APXvYqwZqII6gNj9l7/yGspFdjDzVxor8OzxgE+HBMgtmFJvLqVnfRb6GWaKOpYS2wSFCwMPGdAkDQ==
X-Received: by 2002:a65:644e:: with SMTP id s14mr58676886pgv.290.1558111192168;
        Fri, 17 May 2019 09:39:52 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id z7sm10513791pgh.81.2019.05.17.09.39.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:39:51 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 3/4] i2c: nvidia-gpu: resume ccgx i2c client
Date:   Fri, 17 May 2019 09:38:17 -0700
Message-Id: <20190517163818.5007-4-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517163818.5007-1-ajayg@nvidia.com>
References: <20190517163818.5007-1-ajayg@nvidia.com>
X-NVConfidentiality: public
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Cypress USB Type-C CCGx controller firmware (which is being used
in many NVIDIA GPU cards) has known issue of not triggering
interrupt when a USB device is hot plugged to runtime resume the
controller. Many of these cards may get latest kernel but may not
get latest fixed firmware so a workaround to check for any
connector change event.

The workaround is to request runtime resume of i2c client
which is UCSI Cypress CCGx driver. CCG driver will call the ISR
for any connector change event only if NVIDIA GPU has old
CCG firmware with the known issue.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 9d347583f8dc..2f72135a547b 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -51,6 +51,7 @@ struct gpu_i2c_dev {
 	void __iomem *regs;
 	struct i2c_adapter adapter;
 	struct i2c_board_info *gpu_ccgx_ucsi;
+	struct i2c_client *ccgx_client;
 };
 
 static void gpu_enable_i2c_bus(struct gpu_i2c_dev *i2cd)
@@ -267,8 +268,6 @@ static const struct property_entry ccgx_props[] = {
 
 static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 {
-	struct i2c_client *ccgx_client;
-
 	i2cd->gpu_ccgx_ucsi = devm_kzalloc(i2cd->dev,
 					   sizeof(*i2cd->gpu_ccgx_ucsi),
 					   GFP_KERNEL);
@@ -280,8 +279,8 @@ static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 	i2cd->gpu_ccgx_ucsi->addr = 0x8;
 	i2cd->gpu_ccgx_ucsi->irq = irq;
 	i2cd->gpu_ccgx_ucsi->properties = ccgx_props;
-	ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
-	if (!ccgx_client)
+	i2cd->ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
+	if (!i2cd->ccgx_client)
 		return -ENODEV;
 
 	return 0;
@@ -371,6 +370,12 @@ static __maybe_unused int gpu_i2c_resume(struct device *dev)
 	struct gpu_i2c_dev *i2cd = dev_get_drvdata(dev);
 
 	gpu_enable_i2c_bus(i2cd);
+	/* runtime resume ccgx client so that it can see for any
+	 * connector change event. Old ccg firmware has known
+	 * issue of not triggering interrupt when a device is
+	 * connected to runtime resume the controller.
+	 */
+	pm_request_resume(&i2cd->ccgx_client->dev);
 	return 0;
 }
 
-- 
2.17.1

