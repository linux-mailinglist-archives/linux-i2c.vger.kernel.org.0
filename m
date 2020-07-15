Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCF9220360
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 06:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgGOET3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 00:19:29 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11970 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728163AbgGOET2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 00:19:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e83950000>; Tue, 14 Jul 2020 21:18:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:19:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 21:19:27 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:19:27 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:19:27 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e83ce0001>; Tue, 14 Jul 2020 21:19:26 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v3 05/18] i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
Date:   Tue, 14 Jul 2020 21:20:42 -0700
Message-ID: <1594786855-26506-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786709; bh=eufXsoZ14WkRUf36lqjK6lfwNSwXZDr32mhUx6fHlSE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=O8tYkUqrbIYTKjoF52jmmh2bSQejoxqlnbuovv0mgrgzo6II8YlzvPYBAd0qpzXYx
         4Mr2rH0cYU1CUEdI8Mw1loF0qCOKI9IWt3BBBfH9UsyWUTbXP2jZ93HxjLYKBYTQGp
         1dt48ep7L7N3fUlZBxlrbNaPSQ+IMC7aLlVtDLsbpaWh8K7hzTJD46eVpLiNuKvqt5
         4HOLZujS5elgYo/gRqoTSfHnz49xnCiWHsszGroWL58455IvYUe2TzUlXYafSgEYmD
         Zn6VVASBbNixVKNCdWXlcfOYzne+uo02TVeL/Q46nSJeS/Ksqpqm+si36vMyQXnecE
         Phybz8I+sRNyA==
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

