Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD14395B2
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 21:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730487AbfFGTat (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 15:30:49 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17214 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729172AbfFGTas (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 15:30:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfabb650002>; Fri, 07 Jun 2019 12:30:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Jun 2019 12:30:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 12:30:48 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 19:30:47 +0000
Received: from HQMAIL103.nvidia.com (172.20.187.11) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 19:30:47 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 7 Jun 2019 19:30:47 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfabb640000>; Fri, 07 Jun 2019 12:30:46 -0700
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
Subject: [PATCH V2 5/6] i2c: tegra: fix msleep warning
Date:   Fri, 7 Jun 2019 12:30:25 -0700
Message-ID: <1559935826-25812-5-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559935826-25812-1-git-send-email-bbiswas@nvidia.com>
References: <1559935826-25812-1-git-send-email-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559935846; bh=Qae36JSCpcTdcklRmVE7XBNUMoQSDDFmpYRBvHliYh0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=nnpz86M5AGeMvzjV/GmzHMVnpKoSc9USVJ7RUj2KL5bSb+hNuMGYnB9V6DEArsYES
         Kvl/yXP8PDRmCHluwjwii7Ck1NPUXW0GWEkW/sxqeUseCDJoEKVAQISXEPjdMHXaeE
         RJmmsG9/rD8VLZbFqWMVnLulYnoA82khxfUhIizdMltcIMaAkwfCBwsUko5npnYEXi
         PshON64IOItpTDcJehX4NiUGnwHlNt9fE0K3UCmyVu1/PcpepTh9nRHcn5q4purguy
         XG7bzuI3ijveCYxQ7vhgF4WQEWFOJmeCbosAs2qo1skTyzm9hNw4lOUBtvWChUr0ey
         7r3Y6pyDIZb0Q==
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

