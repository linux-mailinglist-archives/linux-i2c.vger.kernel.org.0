Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D3122FA79
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 22:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgG0Uvx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 16:51:53 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14231 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbgG0Uvv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 16:51:51 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1f3e0c0000>; Mon, 27 Jul 2020 13:50:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 27 Jul 2020 13:51:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 27 Jul 2020 13:51:51 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:51:50 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 27 Jul 2020 20:51:50 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1f3e660000>; Mon, 27 Jul 2020 13:51:50 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v5 01/14] i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
Date:   Mon, 27 Jul 2020 13:57:19 -0700
Message-ID: <1595883452-17343-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595883021; bh=EGA79RtzT4kKnVRthKR6rJkbAlCelvC1+Uw3vpnpE7k=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=XDntIQyUbq8rQHaG7l0Al+4ZQQAHfKmI2alYGkl3qOSDhEOcPMmhG54bmFow5x0Au
         FHLr1mZeIyxIlMKOwSPmJ/V+u8Izw61GQaLpTuNv5frS1a5HyPHyNJS+jgJXbc1XMm
         ACuVVvEmX9+y7aojP3UTsPhoDMuF6MBWt8VIbAHOLzXpL3AKrEaPpdmBkyD6j/Og5A
         83BGJazZpvh9C8zA+i5AXvsccnOqf83X3g5inY4NPf2uXzKCMlMeoMjzvZ0bw5kOFZ
         ypG/8nvBO2drmFaDiSNkhtxXYqqb6wn/1T/uPtm6CK64/5GAn7+YC48qu4Fa7dZYJr
         36wW3gUXMPwtw==
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

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
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

