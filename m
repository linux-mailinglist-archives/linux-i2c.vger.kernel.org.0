Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783412203A4
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 06:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgGOEUi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 00:20:38 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9565 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbgGOET3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 00:19:29 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e835f0000>; Tue, 14 Jul 2020 21:17:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:19:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 14 Jul 2020 21:19:29 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:19:28 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:19:28 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e83cf0000>; Tue, 14 Jul 2020 21:19:28 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v3 06/18] i2c: tegra: Fix runtime resume to re-init VI I2C
Date:   Tue, 14 Jul 2020 21:20:43 -0700
Message-ID: <1594786855-26506-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786655; bh=rVT7elWIzK6dQfAm9YaBBuoEEleair7GkfBCOrcVb5U=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ZVsOspQXOQhKMXofQtLcCis5jFnvhNKlwIeOFcdXIxp7MIDcMAY4ro7qygeTxmC4J
         6pSo0qCZ29/9V9vh0ZHep15nKCkSRd1OGcBed1u/vUmiVMY0MQsCpYUzjKluVkmkyd
         rz+Gr/fEJir1zYqLqeLd663lZW057MZVwapgE1Hg7laKvGddSbOJtoMikagAC58xFr
         3rC1Ukavenfp8Q+OVxwXC0ae9HnpWcPI8LsTakw94NB6/+nCefVexuVmFZtalrWExe
         eae7bsKnX6r+4AFGyr4XLZ0BGLVBoYRQicyJ58lG2AG84nt4ZBXLFf22yLBfbfIA35
         +X5DZPAwGdmug==
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
index 7b93c45..1bf3666 100644
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
@@ -675,8 +677,22 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
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

