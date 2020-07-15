Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDBE2203A8
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 06:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgGOEUq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 00:20:46 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9559 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgGOET0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 00:19:26 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e835c0000>; Tue, 14 Jul 2020 21:17:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:19:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 14 Jul 2020 21:19:25 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:19:25 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:19:24 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e83cb0004>; Tue, 14 Jul 2020 21:19:24 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v3 03/18] i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
Date:   Tue, 14 Jul 2020 21:20:40 -0700
Message-ID: <1594786855-26506-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786652; bh=zxB65TqmmcKmPfWkLJU50AtZToCBrCGEYlb/JsyjY+U=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Xka7PEDQWikb4oQIXRaCkY2gULdhMDJ1lasgdot1PE7Qf8Z/hdMS8RhHveHp+qBk+
         P7VgFglkANZ11RbdOM7SOFc/cLmigsqV9PcSWWJVYFBnIPYPeLfDz9pX9xSI3K1MDi
         QOeJzMMya50BETGQiaSeB2mhYEW/QqRUFqK5F7OCpeM+SG+yfLlCVzLWUN47dMsJN5
         4tGMIVKVP/LW642IIzNsh5ze1UW2iMBZKLmdO9mwC03T6WBX3O4FDnA0MgQw0sKr29
         eLagY03vZ1rKnriR7npLuBZ5bKSQfO8Kgisz1Yg0mTYzoCCEERwMpbqm+eW6BKOmNO
         6Iwvh4+fpTNUA==
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

