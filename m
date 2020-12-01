Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65E82C9D5B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 10:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390697AbgLAJW2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 04:22:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8222 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390682AbgLAJWY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 04:22:24 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Clc6741BSzkj6p;
        Tue,  1 Dec 2020 17:21:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 17:21:26 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Michal Simek <michal.simek@xilinx.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Vignesh R <vigneshr@ti.com>,
        "Aaro Koskinen" <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH 0/8] i2c: fix reference leak when pm_runtime_get_sync fails
Date:   Tue, 1 Dec 2020 17:29:24 +0800
Message-ID: <20201201092924.112461-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pm_runtime_get_sync will increment the PM reference count
even failed. Forgetting to putting operation will result
in a reference leak here. 

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced. 

BTW, pm_runtime_resume_and_get is introduced in v5.10-rc5 as
dd8088d5a896 ("PM: runtime: Add  pm_runtime_resume_and_get
to dealwith usage counter")

Qinglang Miao (8):
  i2c: cadence: fix reference leak when pm_runtime_get_sync fails
  i2c: img-scb: fix reference leak when pm_runtime_get_sync fails
  i2c: imx-lpi2c: fix reference leak when pm_runtime_get_sync fails
  i2c: imx: fix reference leak when pm_runtime_get_sync fails
  i2c: omap: fix reference leak when pm_runtime_get_sync fails
  i2c: sprd: fix reference leak when pm_runtime_get_sync fails
  i2c: stm32f7: fix reference leak when pm_runtime_get_sync fails
  i2c: xiic: fix reference leak when pm_runtime_get_sync fails

 drivers/i2c/busses/i2c-cadence.c   |  4 ++--
 drivers/i2c/busses/i2c-img-scb.c   |  4 ++--
 drivers/i2c/busses/i2c-imx-lpi2c.c |  2 +-
 drivers/i2c/busses/i2c-imx.c       |  4 ++--
 drivers/i2c/busses/i2c-omap.c      |  8 ++++----
 drivers/i2c/busses/i2c-sprd.c      |  4 ++--
 drivers/i2c/busses/i2c-stm32f7.c   | 12 ++++++------
 drivers/i2c/busses/i2c-xiic.c      |  4 ++--
 8 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.23.0

