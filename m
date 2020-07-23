Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5B622BA65
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 01:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgGWXsU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 19:48:20 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17993 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbgGWXsT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 19:48:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1a21830000>; Thu, 23 Jul 2020 16:47:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 16:48:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 16:48:18 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 23:48:18 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 23:48:18 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1a21c10002>; Thu, 23 Jul 2020 16:48:18 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v4 03/14] i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
Date:   Thu, 23 Jul 2020 16:51:01 -0700
Message-ID: <1595548272-9809-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595548035; bh=eufXsoZ14WkRUf36lqjK6lfwNSwXZDr32mhUx6fHlSE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=GyJ1vhtqJ3xldvtM5bdGL3aj2uZlCQL/Al5ZopfVFtN/2FE3WPwKkbLI+d8ENnV13
         WCjP+iphCOu/3nY4rP1s2/H/c4t0CsJmj6+GoSRYAF07dHdSTBmlp6TLZYEPJ82yWq
         9L3GRBEUhSE7cM8QcO9NG+jJns4cvSKTibQVjQ3FfQzdltOGV3makqy6ZnymOfINlO
         E4B7VYqvDvhRutOHqWuF1wyPBolyu83kBAdMjEm5DhxFRtFSm4DvOwj5GMS4rk/V7P
         s6vk/sLQ5pfdUpgiYpstsTvDafiZ+5RwAjQu6Mba1u94tltX9Eau6+ETs6ZTmTp6i2
         vl7MHOzQjv0PA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

tegra_i2c_runtime_resume does not disable prior enabled clocks
properly.

This patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c91307b9..7b93c45 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -665,18 +665,23 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	ret = clk_enable(i2c_dev->slow_clk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable slow clock: %d\n", ret);
-		return ret;
+		goto disable_fast_clk;
 	}
 
 	ret = clk_enable(i2c_dev->div_clk);
 	if (ret < 0) {
 		dev_err(i2c_dev->dev,
 			"Enabling div clk failed, err %d\n", ret);
-		clk_disable(i2c_dev->fast_clk);
-		return ret;
+		goto disable_slow_clk;
 	}
 
 	return 0;
+
+disable_slow_clk:
+	clk_disable(i2c_dev->slow_clk);
+disable_fast_clk:
+	clk_disable(i2c_dev->fast_clk);
+	return ret;
 }
 
 static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
-- 
2.7.4

