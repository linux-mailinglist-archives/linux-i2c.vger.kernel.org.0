Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2EB13361F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 19:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfFCRIl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 13:08:41 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44883 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbfFCRIl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 13:08:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so2150844pfe.11;
        Mon, 03 Jun 2019 10:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E4+QVlZhPxqvppC8fwdZBINlVHKUj1lRFLO2bCQ8PZA=;
        b=leNPH82gRgwlpGZ0M42alITOYHYGn6n21dBw62aRjCYwtXqvFaiv7fxPlb/D0ZE1E+
         QlBSCtgOZ0B0eVYdR+OkcujDyZCP+SZ/0U6NchfXM6jFq+/zg9nXMxa5W4WQTWg1UleY
         1G+MolpgSktflcCAIZm7XjGQgJQeFurGNiOkNrj6plxsf8LU39ozCcSDYcp3aJT25L1B
         VUOonMssmKJ0cL/QOTyUzLI0cLZa5q2uXHkLZQ+04VjPxy1kvVpBEp6DTBMZ5ksPqn1o
         8h5xTxt9X2WQTa/Q49cdI3NQAkD7c3cDGvlSmsZRNGBuUU0Jmsqt//jZIt7hyJiXBr+f
         AQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E4+QVlZhPxqvppC8fwdZBINlVHKUj1lRFLO2bCQ8PZA=;
        b=oKPc6dK1ERdzdKnxC+wtaKNYtLZ2A5qtud0z9kxBoswfIOKL4PKrHRt4f8TfCKVtSD
         2gl80EiRSKPsHsLMpQKhbWg5pc2hlRpTYQEpgdKWCkukPUIt2CV1yssLBS+9d/sEaFqg
         xok2G0taRarP86ZfYKMN21KDpJijZP8LBcLLyj+5vxIpRRiN978yNF/qEFjxeatOqN+L
         AhluZErKcjWHu9E+Z75aMEXg2YOSsChNr+mEmBjg6q5ztbSZcQ3XsDrd0It7IFJ72aHG
         uDDsTOnNbynYn/XwhoaUKLMq79YK5T5u/bIWCH+ZJadx5C27f0aTO51Nqjyw/bMm0WvY
         8JVA==
X-Gm-Message-State: APjAAAVTOK48HX6vcBrNd8afNS7LIwkCKefgXv4Xc/I2eIl7aUpsE/py
        SbtLbsX0tDdsu/vWUm2cR1o=
X-Google-Smtp-Source: APXvYqzPEj/dmmJLF2xqM+OTMV7MGq7DY7EfIS5GapWzBGaT0q0iXRpZV8oHbYnzl+804i55WlU3IQ==
X-Received: by 2002:a63:2d41:: with SMTP id t62mr29997907pgt.113.1559581720584;
        Mon, 03 Jun 2019 10:08:40 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id p63sm17988814pfb.70.2019.06.03.10.08.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 10:08:39 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v4 4/5] i2c: nvidia-gpu: resume ccgx i2c client
Date:   Mon,  3 Jun 2019 10:05:44 -0700
Message-Id: <20190603170545.24004-5-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603170545.24004-1-ajayg@nvidia.com>
References: <20190603170545.24004-1-ajayg@nvidia.com>
X-NVConfidentiality: public
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Cypress USB Type-C CCGx controller firmware version 3.1.10
(which is being used in many NVIDIA GPU cards) has known issue of
not triggering interrupt when a USB device is hot plugged to runtime
resume the controller. If any GPU card gets latest kernel with runtime
pm support but does not get latest fixed firmware then also it should
continue to work and therefore a workaround is required to check for
any connector change event

The workaround is to request runtime resume of i2c client
which is UCSI Cypress CCGx driver. CCG driver will call the ISR
for any connector change event only if NVIDIA GPU has old
CCG firmware with the known issue.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
Changes from v3->v4: None

 drivers/i2c/busses/i2c-nvidia-gpu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index ad1006e72a03..17a7cdf1dea0 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -51,6 +51,7 @@ struct gpu_i2c_dev {
 	void __iomem *regs;
 	struct i2c_adapter adapter;
 	struct i2c_board_info *gpu_ccgx_ucsi;
+	struct i2c_client *ccgx_client;
 };
 
 static void gpu_enable_i2c_bus(struct gpu_i2c_dev *i2cd)
@@ -270,8 +271,6 @@ static const struct property_entry ccgx_props[] = {
 
 static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 {
-	struct i2c_client *ccgx_client;
-
 	i2cd->gpu_ccgx_ucsi = devm_kzalloc(i2cd->dev,
 					   sizeof(*i2cd->gpu_ccgx_ucsi),
 					   GFP_KERNEL);
@@ -283,8 +282,8 @@ static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 	i2cd->gpu_ccgx_ucsi->addr = 0x8;
 	i2cd->gpu_ccgx_ucsi->irq = irq;
 	i2cd->gpu_ccgx_ucsi->properties = ccgx_props;
-	ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
-	if (!ccgx_client)
+	i2cd->ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
+	if (!i2cd->ccgx_client)
 		return -ENODEV;
 
 	return 0;
@@ -384,6 +383,13 @@ static __maybe_unused int gpu_i2c_resume(struct device *dev)
 	struct gpu_i2c_dev *i2cd = dev_get_drvdata(dev);
 
 	gpu_enable_i2c_bus(i2cd);
+	/*
+	 * Runtime resume ccgx client so that it can see for any
+	 * connector change event. Old ccg firmware has known
+	 * issue of not triggering interrupt when a device is
+	 * connected to runtime resume the controller.
+	 */
+	pm_request_resume(&i2cd->ccgx_client->dev);
 	return 0;
 }
 
-- 
2.17.1

