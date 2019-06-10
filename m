Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C283AE82
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 07:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387597AbfFJFJK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 01:09:10 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15235 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387452AbfFJFJJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 01:09:09 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfde5f40000>; Sun, 09 Jun 2019 22:09:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 09 Jun 2019 22:09:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 09 Jun 2019 22:09:08 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 05:09:07 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Jun 2019 05:09:07 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfde5f00000>; Sun, 09 Jun 2019 22:09:07 -0700
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
Subject: [PATCH V3 4/6] i2c: tegra: add spinlock definition comment
Date:   Sun, 9 Jun 2019 22:08:42 -0700
Message-ID: <1560143324-21754-4-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560143324-21754-1-git-send-email-bbiswas@nvidia.com>
References: <1560143324-21754-1-git-send-email-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560143348; bh=3cpCcddyT2qPq3Wnu1Z2qlvBOHM7S82lD9AAMomje2Q=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=IQZPplZ6jbvcW4yHWCwQtnFJQNywyWyZsoxy58ZfrOV+hhOtQSgZ/qLkXs/kOITpk
         6A/naBKyfX9z2ERkYQdCaHVF6BVzfy0ckdovnr3oqyt2SHM2jpNgVEiVXtd9b5ce5G
         XdYjj+Z31yfqykfsj4BCIWmkUGSDiU97aN1/gYayo6k7eh+re7787ktyOkxZbK+yKd
         sXe0SOC9fw8LO599dShdj8emcqlxQkKOKOuvmITCy7URKzdQfZYSGbr4+Bz4Wd+JeQ
         qABjCoO3VHpxwM69RSlX3ePqJGfrmis0MThfvkL3MuwtSwdRJWnkoGNGE9YIZgt3hj
         L/DzZe84Djkvg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix checkpatch.pl CHECK as follows:
CHECK: spinlock_t definition without comment
+       spinlock_t xfer_lock;

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2d381de..bececa6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -269,6 +269,7 @@ struct tegra_i2c_dev {
 	u32 bus_clk_rate;
 	u16 clk_divisor_non_hs_mode;
 	bool is_multimaster_mode;
+	/* xfer_lock: lock to serialize transfer submission and processing */
 	spinlock_t xfer_lock;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
-- 
2.7.4

