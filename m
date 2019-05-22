Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 649E7269EB
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 20:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729483AbfEVSdm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 14:33:42 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35955 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729642AbfEVSdm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 14:33:42 -0400
Received: by mail-pf1-f194.google.com with SMTP id v80so1779604pfa.3;
        Wed, 22 May 2019 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bgPRiLK8QP/T5A6kfBoroSy+Bu11YHpBXlua43RT2NQ=;
        b=e+zPn32QXsKPmQ/7D7bECU/4Az9Hi7QfN7JUxfpYiZNM/ZWteTYirGa1cuujwH0GA2
         qmFs0G/rmN+nVCjSx4fXLYmK1M/pCFtw/Yp04DPbrLoUu5kNF63NGh72ZGo25u58n5L3
         LWyJtrvxlHsJTXY+ygdXESdVjU5mkFQNHQWEHNse+BYi3NzNNHF9cDz3iiVkQ8q64A93
         jNRwh8N0XGq80voL5w7Uj4QFjkix1GH9K6AZUgT1Vs3xNpXO8jHRojtS02SJRbLaj/Mn
         ZZwMidin+kCTaiYxG16ZXOw/3ZwhPeZ5AEim/y//AAzUFNE7xna972/Pc94e7LNk/El8
         6tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bgPRiLK8QP/T5A6kfBoroSy+Bu11YHpBXlua43RT2NQ=;
        b=Um/xAJ8Lnjp6RDtSkLj16pOJP5h/rGcuuV8x9OOO/9FicBODZQSykehdOWBjduwF69
         5hjKSeAf7uO0OWQ2VUsVPA44aMtEUcKKmdfghTtR3kIEso1cTuhA3pgWMYB/AWrfHUgS
         5XJ+buQtAmMeapF9d4h4mzlOscBhq5YgxdN9GQoCEi6qkfEgTKLlNb0zkRbh0aoqydL7
         o60jH0djAYWsIKeK7sOQEZ3gaHj6pCJjhxAulurHTfSesjHuCDrOK2Fhk1fzBFKrXg0k
         4BJeSiKRj54I+26BjQWH1zqeP6Z+MRPLwoLx+CXY/fYtvbq7aWup7M7o5H9ppo6prd8f
         NM/w==
X-Gm-Message-State: APjAAAVenpITvNp9GKdwF9ObHgimNOD67E/0S7tPUMtdL6iXIVhNGFs3
        DKUKle9v2U69ld1A8tDLiDM=
X-Google-Smtp-Source: APXvYqySi/2VfSyiJpm9ocnmBKgk7wbm8qrON+qxkyhUdf+dq/G4EHWrXsTsqoSMaOl0zk87rkwYSg==
X-Received: by 2002:a62:1ec3:: with SMTP id e186mr51257253pfe.197.1558550021595;
        Wed, 22 May 2019 11:33:41 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id c76sm46138294pfc.43.2019.05.22.11.33.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 11:33:40 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v3 4/5] i2c: nvidia-gpu: resume ccgx i2c client
Date:   Wed, 22 May 2019 11:31:41 -0700
Message-Id: <20190522183142.11061-5-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522183142.11061-1-ajayg@nvidia.com>
References: <20190522183142.11061-1-ajayg@nvidia.com>
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
Changes from v2->v3: None

 drivers/i2c/busses/i2c-nvidia-gpu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 28fee85135ac..957b39c9760f 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -51,6 +51,7 @@ struct gpu_i2c_dev {
 	void __iomem *regs;
 	struct i2c_adapter adapter;
 	struct i2c_board_info *gpu_ccgx_ucsi;
+	struct i2c_client *ccgx_client;
 };
 
 static void gpu_enable_i2c_bus(struct gpu_i2c_dev *i2cd)
@@ -271,8 +272,6 @@ static const struct property_entry ccgx_props[] = {
 
 static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 {
-	struct i2c_client *ccgx_client;
-
 	i2cd->gpu_ccgx_ucsi = devm_kzalloc(i2cd->dev,
 					   sizeof(*i2cd->gpu_ccgx_ucsi),
 					   GFP_KERNEL);
@@ -284,8 +283,8 @@ static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 	i2cd->gpu_ccgx_ucsi->addr = 0x8;
 	i2cd->gpu_ccgx_ucsi->irq = irq;
 	i2cd->gpu_ccgx_ucsi->properties = ccgx_props;
-	ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
-	if (!ccgx_client)
+	i2cd->ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
+	if (!i2cd->ccgx_client)
 		return -ENODEV;
 
 	return 0;
@@ -375,6 +374,13 @@ static __maybe_unused int gpu_i2c_resume(struct device *dev)
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

