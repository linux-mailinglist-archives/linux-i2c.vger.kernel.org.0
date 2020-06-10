Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3321F4DCC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 08:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgFJGEr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 02:04:47 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6083 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgFJGCq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 02:02:46 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee07758000e>; Tue, 09 Jun 2020 23:02:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Jun 2020 23:02:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Jun 2020 23:02:45 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 06:02:45 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Jun 2020 06:02:45 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.70]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee077840005>; Tue, 09 Jun 2020 23:02:45 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v1 03/18] i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
Date:   Tue, 9 Jun 2020 23:02:25 -0700
Message-ID: <1591768960-31648-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591768920; bh=zxB65TqmmcKmPfWkLJU50AtZToCBrCGEYlb/JsyjY+U=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=DYbxS+vBHf/CFkVU1bqvqwYINCQE2Cho4VeoNEkp27HpOM79yynDNsQYKq8zKNxqN
         uNDDdTRfTIVchoCyH+Q/Oux/vy+Jd8snfgSva3gKEWF4YfyYb/ohGmle97s5WtpPmy
         QFu2V/mxulfh4MLcSDRj2OuKN4p9s6OimlRDYkizr5NncHUJhRxF+u5tl+flQcwo2a
         gK6mYo0JqzGbPWz9/fZ+sWdIuIBxLveZervEKrqsyB0b6JtbpTyYINFCaFBMgITOsz
         KS81raaW2rPuMFxFIW+qLN/jMsugbgmAn2E3UmGiNUaHydjhGjfFzEReFGuANPaZCU
         ucgFXExgFi8Sw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tegra VI I2C is part of VE power domain and typically used for
camera usecases.

VE power domain is not always on and is non-IRQ safe. So, IRQ safe
device cannot be attached to a non-IRQ safe domain as it prevents
powering off the PM domain and generic power domain driver will warn.

Current driver marks all I2C devices as IRQ safe and VI I2C device
does not require IRQ safe as it will not be used for atomic transfers.

This patch has fix to make VI I2C as non-IRQ safe.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1577296..3be1018 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1750,7 +1750,15 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto unprepare_slow_clk;
 	}
 
-	pm_runtime_irq_safe(&pdev->dev);
+	/*
+	 * VI I2C is in VE power domain which is not always on and not
+	 * an IRQ safe. So, IRQ safe device can't be attached to a non-IRQ
+	 * safe domain as it prevents powering off the PM domain.
+	 * Also, VI I2C device don't need to use runtime IRQ safe as it will
+	 * not be used for atomic transfers.
+	 */
+	if (!i2c_dev->is_vi)
+		pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = tegra_i2c_runtime_resume(&pdev->dev);
-- 
2.7.4

