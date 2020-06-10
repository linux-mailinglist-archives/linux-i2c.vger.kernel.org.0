Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489E51F4DA0
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 08:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgFJGD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 02:03:58 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6104 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgFJGCw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 02:02:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee0775e0001>; Tue, 09 Jun 2020 23:02:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Jun 2020 23:02:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Jun 2020 23:02:51 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 06:02:51 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Jun 2020 06:02:51 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.70]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee0778a0001>; Tue, 09 Jun 2020 23:02:51 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v1 13/18] gpu: host1x: mipi: Add of_tegra_mipi_request() API
Date:   Tue, 9 Jun 2020 23:02:35 -0700
Message-ID: <1591768960-31648-14-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591768926; bh=qd5ZedoXJM6zCreLe65FRGR8l6so02mvB+u6w942LLM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=dnismLbIeUjyT/UE4bEjAB6TfGtTrBB8Vd7yNwEQYVo4azSGukxYMHJerqsxMlA45
         wLLKLVb7s9hVuGVcuR37tglygJjIgevZuVKmIvDIQzSPAMWUnHzb+EDXbcOHZtUzVp
         AQPIcltO0DLfdixvfbUfU2JpDafnGEmR6T5E+sJ1ypp+TuCom/CSDcHOpNn7IfYKck
         trR3iP1w6j+pxgb02f0lflSjHYPPq02bAJec/bVoEFcAoYF2KFUnA2MDsEU4KBtG5y
         pI31gIyEo8xJ+LIPVGjLlhTjXzya3o/7jvrbzBKemnDAa/kA5ZpXLAEM5k4FCS0RRI
         G5MmQEk+yrUzQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds an API of_tegra_mipi_request() to allow creating
mipi device for specific device node rather than a device so Tegra
CSI driver can use it for calibrating MIPI pads for each stream
independently.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/host1x/mipi.c | 10 ++++++++--
 include/linux/host1x.h    |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e00809d..f51fe69 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -206,9 +206,9 @@ static int tegra_mipi_power_down(struct tegra_mipi *mipi)
 	return 0;
 }
 
-struct tegra_mipi_device *tegra_mipi_request(struct device *device)
+struct tegra_mipi_device *of_tegra_mipi_request(struct device *device,
+						struct device_node *np)
 {
-	struct device_node *np = device->of_node;
 	struct tegra_mipi_device *dev;
 	struct of_phandle_args args;
 	int err;
@@ -252,6 +252,12 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device)
 	of_node_put(args.np);
 	return ERR_PTR(err);
 }
+EXPORT_SYMBOL(of_tegra_mipi_request);
+
+struct tegra_mipi_device *tegra_mipi_request(struct device *device)
+{
+	return of_tegra_mipi_request(device, device->of_node);
+}
 EXPORT_SYMBOL(tegra_mipi_request);
 
 void tegra_mipi_free(struct tegra_mipi_device *device)
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index c230b4e..a61ca52 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -325,6 +325,8 @@ int host1x_client_resume(struct host1x_client *client);
 
 struct tegra_mipi_device;
 
+struct tegra_mipi_device *of_tegra_mipi_request(struct device *device,
+						struct device_node *np);
 struct tegra_mipi_device *tegra_mipi_request(struct device *device);
 void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
-- 
2.7.4

