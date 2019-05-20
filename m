Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDC3A24094
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 20:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbfETSjm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 14:39:42 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38609 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfETSjl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 14:39:41 -0400
Received: by mail-pl1-f195.google.com with SMTP id f97so7099673plb.5;
        Mon, 20 May 2019 11:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ut7E9wDK6wYglc03Ugsb4hwLeRPLBJfYWZ8fNdK57pM=;
        b=dYEvjzqcduv1KHlCLhyEWY54yfIP5wQnnlwn4d0AfXf6gIuWU8gcv2ApuVEvPg+LM+
         yayDuZFW0dB3ZzshIzS9TJ25hEJEHplNl4GTCp29JLM7n1uKitoF06jybo1ZvcAP420J
         3CLE7PZA7mUdtBdOqv6TueeLI1Qo0Li38D1FvMUEagQPCMt4fq2ncuIwodxigE7BX/DS
         9Jh7GHWTk9THmtVcN8ySKSfzh3R/eWAEWhFpx5Z3w5hyfSb3kBQyXj15Fg37vFiCiXnh
         lIqIJ4u+ySIEc/3zm3aqtCa3EOhFcUmMrRNhYbX5Xniy1h1yNL49NbCSJhIlDLm4xYwe
         byVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ut7E9wDK6wYglc03Ugsb4hwLeRPLBJfYWZ8fNdK57pM=;
        b=mZBdr/1KAQV/JxnxOXtPpO/fbJdV0cecyGNyfCA2wD06vu2kJiWm2du2La/T7I0Zsv
         QPtm3UMNtdWQSTEkKa2dI30rvoWwQUjgeCF0wSeCPHqJSPwKYoydIJRbiKqIyBn/ikW0
         VmVJeB8+RUPfX7loFV98+ZpN9Cl72C4vBjk5+IO52M0egOnOOFKuflQgHz98i4Ns8tPd
         cl0iSACGHpxYHFFyPcMVbIA6Ut3XLr+pK5NJ9jSdwhrXB6AcHs3ST1RKHF01u1QnQvHW
         Ah/B8nwpY76lnCJyz95K5TetE1nhEwWOO5S/LJCIANz1F7NqjqDdZblz8anBZpPvEcwF
         ZptQ==
X-Gm-Message-State: APjAAAWuRAtJjBv8h14ga69vLYpwnfAo5aJaGkIRFl35v0iRKYo7/aB+
        kzx6zqdnGBGuCMVVx8V9uQ1lOU5g1fM=
X-Google-Smtp-Source: APXvYqxKcD/bIq66EPuxVJBn76Frl3fxEbCCxw736+u1UzzufKZxmxfxoIPCPiaMpq3EoCWNFZtbHQ==
X-Received: by 2002:a17:902:8d96:: with SMTP id v22mr1919386plo.282.1558377581004;
        Mon, 20 May 2019 11:39:41 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id o20sm22321288pgj.70.2019.05.20.11.39.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 11:39:40 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v2 4/5] i2c: nvidia-gpu: resume ccgx i2c client
Date:   Mon, 20 May 2019 11:37:49 -0700
Message-Id: <20190520183750.2932-5-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520183750.2932-1-ajayg@nvidia.com>
References: <20190520183750.2932-1-ajayg@nvidia.com>
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
Changes from v1->v2:
	Fixed comment from Wolfram by fixing comment style.

 drivers/i2c/busses/i2c-nvidia-gpu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index af445590041b..6826740fd0f5 100644
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

