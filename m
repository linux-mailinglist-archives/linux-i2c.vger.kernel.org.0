Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8FE03AE84
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 07:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387629AbfFJFJN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 01:09:13 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14308 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387452AbfFJFJM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 01:09:12 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfde5f60000>; Sun, 09 Jun 2019 22:09:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 09 Jun 2019 22:09:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 09 Jun 2019 22:09:12 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 05:09:11 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Jun 2019 05:09:11 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfde5f40001>; Sun, 09 Jun 2019 22:09:11 -0700
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
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V3 5/6] i2c: tegra: fix msleep warning
Date:   Sun, 9 Jun 2019 22:08:43 -0700
Message-ID: <1560143324-21754-5-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560143324-21754-1-git-send-email-bbiswas@nvidia.com>
References: <1560143324-21754-1-git-send-email-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560143350; bh=Qae36JSCpcTdcklRmVE7XBNUMoQSDDFmpYRBvHliYh0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=GtwEHZ3F04cdL8Nug1X9MEV6fu/XdUB3ZHTgr/0td4byluMW/LVigQAlZuWduQIDV
         t0gIclC8FwqyCBnFTzX5D4qCNoeMQBRyACDw+0JH3S58FYCTlfMIi4cHi++ca4t7KU
         oazjbU01EaQZGuNowcwp56Bu1dL+kqtQIVvXPH4nx/52jBllx4yuwjJMj1/oFlzp/Z
         VapVj/h89CA15wvu8n0bEruhdGLkOVRzZGN6T3qG+C/q7zr3xNhr0I9uCBToCn5o/i
         2h6tEjYoL5SzGpzBbC70NvNCVfbQzXAo7I/W2z45DI9GZgDL33IMxESSmksa7rPqnE
         vuhfvdRORhWhQ==
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

