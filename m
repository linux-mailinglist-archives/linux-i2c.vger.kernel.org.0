Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D8D34FF3B
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 13:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235117AbhCaLF0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 07:05:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:62720 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234942AbhCaLFI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 07:05:08 -0400
IronPort-SDR: jlqgy3hJapjSca61A3o6vcR7zwzYrtccTFOqW3UmcbqLE6hdaKqRdKpeyvhYYfO0KzBX/VKelV
 hv+arf9py+dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="189746724"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="189746724"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 04:05:07 -0700
IronPort-SDR: QRQwEgHBZSFb1xEtQhhWTpkwzOxXH4ut6pbyf+63s9r76kjWrP6haS8JrBMv3kNww/E+CmVupJ
 K6WzsiOdDNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="445594502"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Mar 2021 04:05:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0AE25133; Wed, 31 Mar 2021 14:05:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org, Yicong Yang <yangyicong@hisilicon.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: [PATCH v1 1/1] i2c: designware: Adjust bus_freq_hz when refuse high speed mode set
Date:   Wed, 31 Mar 2021 14:05:10 +0300
Message-Id: <20210331110510.67523-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When hardware doesn't support High Speed Mode, we forget bus_freq_hz
timing adjustment. This makes the timings and real registers being
unsynchronized. Adjust bus_freq_hz when refuse high speed mode set.

Fixes: b6e67145f149 ("i2c: designware: Enable high speed mode")
Reported-by: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 34bb4e21bcc3..9bfa06e31eec 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -129,6 +129,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 		if ((comp_param1 & DW_IC_COMP_PARAM_1_SPEED_MODE_MASK)
 			!= DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH) {
 			dev_err(dev->dev, "High Speed not supported!\n");
+			t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 			dev->master_cfg &= ~DW_IC_CON_SPEED_MASK;
 			dev->master_cfg |= DW_IC_CON_SPEED_FAST;
 			dev->hs_hcnt = 0;
-- 
2.30.2

