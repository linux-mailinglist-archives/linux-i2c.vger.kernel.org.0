Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5FD39243
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 18:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbfFGQhk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 12:37:40 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42852 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730923AbfFGQhj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 12:37:39 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so1484829pff.9;
        Fri, 07 Jun 2019 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dT4VYAJyIXPDSG1SeHDUIuNL89VHe1e73T/Ox4HA8S0=;
        b=q6vH9CwbwkXnyvbPxvMOCS67K5b1MvAhhhfXtiWCNLIQnXaeLLFmp6Yu6cdonN/uMx
         pcwL0Xz9Au9iqMbiNWux07vKkOZdyXlk/koamYgG3BNsVtqi6wegpvgzTjHagT4xV4wa
         lQq7wbkDvS3HO3F33NPTP64iu1U5NYMGkLUmCzWenuoWz+SvuwhDEMd/wY/BYYWtkh1j
         wYN6qlQHkxTAJLXtACVYSidP0yJdLoSak9JBWggnbQcpfBH+E8IKfxVaCFO9O79QnkXY
         PXuCOrYPe6LvHJ7R0eykOa9j8XTIndGhRoZ5FHxxyGxSlpOGQg7zgIMtqqoyAlYER4a5
         +AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dT4VYAJyIXPDSG1SeHDUIuNL89VHe1e73T/Ox4HA8S0=;
        b=mgyDzDRrs0K8vIW8N9ENefvhDZV+E0PH8FEZeVRzagPaYnxUT6d/dHCxti+zbgRcNG
         RjRLuDxkYyN9VfN/Mq8PMYnVVx8NKEGK1iNVP4+16GJYa9Gbr6vtxouresjVU2q6/T8e
         jLvxfl/lrQvPhoJj+FHwgld2RWM7w8o3Hp+w6L2JFsbT4zCJ67eLal5zMjviamTPR+tl
         awlGmR4LuhnfciBMcbv2AlGG6KODVyi2ilk8WsO7dGVKa9dd+c0DcTSBdfXY52E7Xmy7
         OX81KBRBGEQfJdXNkLQU4sd0QvH2W1ZZLg7VqOYQVnWlmdQ0+dztQJsNCCxDeJh9qyi5
         63ag==
X-Gm-Message-State: APjAAAUhXa4eVfJDVGkQr9rfdVv4BpBfV+bMmlJZChYqbXXoUDfrmwwg
        xl6quEqg0YB3RvsKoJhQF0a3/u9Q
X-Google-Smtp-Source: APXvYqwRsfjG+RITW1K8ulhAW13XHbXWyhm+zgKcx0Ty7Fa+TCg3pQCdF1gGAK4zMpzQVz/DIJEmgw==
X-Received: by 2002:a63:c30e:: with SMTP id c14mr3696785pgd.41.1559925458862;
        Fri, 07 Jun 2019 09:37:38 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id t2sm1745520pgj.39.2019.06.07.09.37.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 09:37:38 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v5 4/5] i2c: nvidia-gpu: resume ccgx i2c client
Date:   Fri,  7 Jun 2019 09:34:22 -0700
Message-Id: <20190607163423.31860-5-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607163423.31860-1-ajayg@nvidia.com>
References: <20190607163423.31860-1-ajayg@nvidia.com>
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
Changes from v4->v5: None

 drivers/i2c/busses/i2c-nvidia-gpu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 364244ffb5bf..cfc76b5de726 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -51,6 +51,7 @@ struct gpu_i2c_dev {
 	void __iomem *regs;
 	struct i2c_adapter adapter;
 	struct i2c_board_info *gpu_ccgx_ucsi;
+	struct i2c_client *ccgx_client;
 };
 
 static void gpu_enable_i2c_bus(struct gpu_i2c_dev *i2cd)
@@ -268,8 +269,6 @@ static const struct property_entry ccgx_props[] = {
 
 static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 {
-	struct i2c_client *ccgx_client;
-
 	i2cd->gpu_ccgx_ucsi = devm_kzalloc(i2cd->dev,
 					   sizeof(*i2cd->gpu_ccgx_ucsi),
 					   GFP_KERNEL);
@@ -281,8 +280,8 @@ static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 	i2cd->gpu_ccgx_ucsi->addr = 0x8;
 	i2cd->gpu_ccgx_ucsi->irq = irq;
 	i2cd->gpu_ccgx_ucsi->properties = ccgx_props;
-	ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
-	if (!ccgx_client)
+	i2cd->ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
+	if (!i2cd->ccgx_client)
 		return -ENODEV;
 
 	return 0;
@@ -377,6 +376,13 @@ static __maybe_unused int gpu_i2c_resume(struct device *dev)
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

