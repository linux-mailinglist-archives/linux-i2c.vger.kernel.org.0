Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA41D1FC3CD
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 03:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgFQBlU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 21:41:20 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13786 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgFQBjf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 21:39:35 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee974490000>; Tue, 16 Jun 2020 18:39:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 18:39:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 16 Jun 2020 18:39:34 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jun
 2020 01:39:34 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 17 Jun 2020 01:39:33 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.171.186]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee974540002>; Tue, 16 Jun 2020 18:39:33 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v2 05/18] i2c: tegra: Fix runtime resume to re-init VI I2C
Date:   Tue, 16 Jun 2020 18:41:21 -0700
Message-ID: <1592358094-23459-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592357961; bh=amcwP8TlSGCRNDP9S1LB/JftLvG4ejWcYGZTopYF82w=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ZZeNnIeqp37VbpO/lmvDDHCX3R59inRvK4yheucNlLWh306A5g/p+jkm12sLojpix
         06xDWuZxfIuJqeC6n8KpI39aAhNDgT1M05bentSZFgOraCY2mflsRSPHB65bXAyIQ8
         lSBuFWNvSeUc+A3Fqt0XLLuwVQY7NIwFBqw4Hkz0SBIStxRZssFODOfsEsasYFv+hI
         Bu+SOsNR5Yn/Dyv2Rt24ttTQzZA27Cv+dP5iokU0piD+muTdW7MGAocah8kXLWcrd0
         0C6GlXwVUKVoK+HLK4hiORFY010mlXICUHo1+yw4b5X5/TL6pg8ybEC9/TKNNpZvPK
         kpDb8RcisvAUA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VI I2C is on host1x bus and is part of VE power domain.

During suspend/resume VE power domain goes through power off/on.

So, controller reset followed by i2c re-initialization is required
after the domain power up.

This patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1b459ca..e7aad64 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -293,6 +293,8 @@ struct tegra_i2c_dev {
 	bool is_curr_atomic_xfer;
 };
 
+static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit);
+
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
 {
@@ -679,8 +681,22 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 		goto disable_slow_clk;
 	}
 
+	/*
+	 * VI I2C device is attached to VE power domain which goes through
+	 * power ON/OFF during PM runtime resume/suspend. So, controller
+	 * should go through reset and need to re-initialize after power
+	 * domain ON.
+	 */
+	if (i2c_dev->is_vi) {
+		ret = tegra_i2c_init(i2c_dev, true);
+		if (ret)
+			goto disable_div_clk;
+	}
+
 	return 0;
 
+disable_div_clk:
+	clk_disable(i2c_dev->div_clk);
 disable_slow_clk:
 	clk_disable(i2c_dev->slow_clk);
 disable_fast_clk:
-- 
2.7.4

