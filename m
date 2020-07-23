Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C8D22BAAB
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 01:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgGWXtY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 19:49:24 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17987 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728196AbgGWXsR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 19:48:17 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1a21820001>; Thu, 23 Jul 2020 16:47:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 16:48:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 16:48:17 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 23:48:17 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 23:48:17 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1a21c00002>; Thu, 23 Jul 2020 16:48:17 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v4 01/14] i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
Date:   Thu, 23 Jul 2020 16:50:59 -0700
Message-ID: <1595548272-9809-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595548034; bh=zxB65TqmmcKmPfWkLJU50AtZToCBrCGEYlb/JsyjY+U=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Fl8tqvlySxeFQDQY+54PsTN9/Ap3KRcNINo11fVdby3IDSAfwpkG/gnQHKKq0aUdJ
         z6/23I17/nIZNyD47iGPQM2JX2PaOUtGzNfJwDdHn1+QuQhAfthEeKt2cMqbzZnbQy
         yAp4FZCOpjj8XQiNb4AJOWXCUefYA2o0KVdgK1X3CkSQVO8lV8HO/0ynCtMV11Rjvg
         v5ad1aLajISWQCt8Hm8tLz5bgc4tuNSCIGbU4y5bcxtjcQPh4NCrq6MPDjC9tO4lVD
         7Md3yFMMszQxoqAUB6JLrzGdUY4qKl8GRTvTwEZ2xSQC3GynxDEDAhn5r/03udxjTW
         vrvkdslNLO0Ag==
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

