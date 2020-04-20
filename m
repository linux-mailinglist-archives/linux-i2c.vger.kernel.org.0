Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DB91B0062
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 06:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgDTEBo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 00:01:44 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2806 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725681AbgDTEBn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Apr 2020 00:01:43 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 9FB90DEF3D2A265CF43F;
        Mon, 20 Apr 2020 12:01:41 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Apr 2020
 12:01:34 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <wsa@the-dreams.de>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] i2c: busses: remove unneeded conversion to bool
Date:   Mon, 20 Apr 2020 12:28:16 +0800
Message-ID: <20200420042816.18989-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The '>' expression itself is bool, no need to convert it to bool again.
This fixes the following coccicheck warning:

drivers/i2c/busses/i2c-qup.c:960:48-53: WARNING: conversion to bool not needed here
drivers/i2c/busses/i2c-qup.c:962:47-52: WARNING: conversion to bool not needed here
drivers/i2c/busses/i2c-qup.c:1531:29-34: WARNING: conversion to bool not needed here
drivers/i2c/busses/i2c-qup.c:1533:29-34: WARNING: conversion to bool not needed here

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/i2c/busses/i2c-qup.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 155dcde70fc9..25d5fe2f8316 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -956,10 +956,8 @@ static void qup_i2c_conf_v1(struct qup_i2c_dev *qup)
 	u32 qup_config = I2C_MINI_CORE | I2C_N_VAL;
 	u32 io_mode = QUP_REPACK_EN;
 
-	blk->is_tx_blk_mode =
-		blk->total_tx_len > qup->out_fifo_sz ? true : false;
-	blk->is_rx_blk_mode =
-		blk->total_rx_len > qup->in_fifo_sz ? true : false;
+	blk->is_tx_blk_mode = blk->total_tx_len > qup->out_fifo_sz;
+	blk->is_rx_blk_mode = blk->total_rx_len > qup->in_fifo_sz;
 
 	if (blk->is_tx_blk_mode) {
 		io_mode |= QUP_OUTPUT_BLK_MODE;
@@ -1528,9 +1526,9 @@ qup_i2c_determine_mode_v2(struct qup_i2c_dev *qup,
 		qup->use_dma = true;
 	} else {
 		qup->blk.is_tx_blk_mode = max_tx_len > qup->out_fifo_sz -
-			QUP_MAX_TAGS_LEN ? true : false;
+			QUP_MAX_TAGS_LEN;
 		qup->blk.is_rx_blk_mode = max_rx_len > qup->in_fifo_sz -
-			READ_RX_TAGS_LEN ? true : false;
+			READ_RX_TAGS_LEN;
 	}
 
 	return 0;
-- 
2.21.1

