Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886E53C962
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 12:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387906AbfFKKyU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 06:54:20 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3975 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387489AbfFKKyU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 06:54:20 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cff88580004>; Tue, 11 Jun 2019 03:54:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 11 Jun 2019 03:54:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 11 Jun 2019 03:54:19 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Jun
 2019 10:52:37 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Jun
 2019 10:52:16 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 11 Jun 2019 10:51:55 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cff87b30001>; Tue, 11 Jun 2019 03:51:34 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        "Bitan Biswas" <bbiswas@nvidia.com>
Subject: [PATCH V5 5/7] i2c: tegra: fix msleep warning
Date:   Tue, 11 Jun 2019 03:51:12 -0700
Message-ID: <1560250274-18499-5-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560250457; bh=Qae36JSCpcTdcklRmVE7XBNUMoQSDDFmpYRBvHliYh0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=JR9/49oVDCxWGSptD7JxMxVU1M7CXJt9lnlYu+2CIeFrMTbY6TEVyukW6Z/gzinOZ
         //JIGXHY6VkutdF2U1wjrRxkMx3ESB9GTsQODS9dMgiQs1ZSZsb2jF+/baqK9+r2L3
         D/x4Sktg4YxEAn/s0nuCOtG8kyDvqk0Rx33GNv0MFfd94s/HCE0D6dLIdQOVstycS7
         aNEDZWw7Qkt67RP7PC07rwG8l8nvkcf5A0OgLacqMgjCM1eh1Y84PFucJU9zSsKstZ
         Q8ur8dtxaYrOd4P3VPhqQh0YCeR+IMyPJL6zCvg6HJeJ3LSmjdlapMwC54HDI8llBQ
         OqE0tIHy3CD9g==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix checkpatch.pl WARNING for delay of approximately 1msec
in flush i2c FIFO polling loop by using usleep_range(1000, 2000):
WARNING: msleep < 20ms can sleep for up to 20ms; see ...
Documentation/timers/timers-howto.txt
+               msleep(1);

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bececa6..4dfb4c1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -476,7 +476,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 	return 0;
 }
-- 
2.7.4

