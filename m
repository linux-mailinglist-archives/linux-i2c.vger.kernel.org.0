Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCC3766140
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 03:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjG1Bci (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 21:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjG1Bcg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 21:32:36 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133F03592;
        Thu, 27 Jul 2023 18:32:23 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RBqmK2WZbztRgQ;
        Fri, 28 Jul 2023 09:29:05 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 28 Jul
 2023 09:32:20 +0800
From:   Liao Chang <liaochang1@huawei.com>
To:     <andi.shyti@kernel.org>, <florian.fainelli@broadcom.com>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <yangyicong@hisilicon.com>, <aisheng.dong@nxp.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <kblaiech@nvidia.com>, <asmaa@nvidia.com>,
        <loic.poulain@linaro.org>, <rfoss@kernel.org>, <ardb@kernel.org>,
        <gcherian@marvell.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <liaochang1@huawei.com>
Subject: [PATCH 0/9] Use dev_err_probe in i2c probe function
Date:   Fri, 28 Jul 2023 09:31:39 +0800
Message-ID: <20230728013148.1720978-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the dev_err_probe function instead of dev_err in the probe function
so that the printed messge includes the return value and also handles
-EPROBE_DEFER nicely.

Liao Chang (9):
  i2c: bcm2835: Use dev_err_probe in probe function
  i2c: mlxbf: Use dev_err_probe in probe function
  i2c: xlp9xx: Use dev_err_probe in probe function
  i2c: hisi: Use dev_err_probe in probe function
  i2c: qcom-cci: Use dev_err_probe in probe function
  i2c: pxa: Use dev_err_probe in probe function
  i2c: dln2: Use dev_err_probe in probe function
  i2c: imx-lpi2c: Use dev_err_probe in probe function
  i2c: synquacer: Use dev_err_probe in probe function

 drivers/i2c/busses/i2c-bcm2835.c   | 14 ++++------
 drivers/i2c/busses/i2c-dln2.c      |  6 ++--
 drivers/i2c/busses/i2c-hisi.c      | 12 +++-----
 drivers/i2c/busses/i2c-imx-lpi2c.c |  6 ++--
 drivers/i2c/busses/i2c-mlxbf.c     | 44 ++++++++++--------------------
 drivers/i2c/busses/i2c-pxa.c       |  7 ++---
 drivers/i2c/busses/i2c-qcom-cci.c  |  6 ++--
 drivers/i2c/busses/i2c-synquacer.c |  7 ++---
 drivers/i2c/busses/i2c-xlp9xx.c    |  6 ++--
 9 files changed, 38 insertions(+), 70 deletions(-)

-- 
2.25.1

