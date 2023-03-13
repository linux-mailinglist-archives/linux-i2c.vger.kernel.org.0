Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86BB6B703D
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 08:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCMHqq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 03:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjCMHqq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 03:46:46 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741B04E5C3
        for <linux-i2c@vger.kernel.org>; Mon, 13 Mar 2023 00:46:45 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PZpcJ1sXwzrSmH;
        Mon, 13 Mar 2023 15:45:52 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 15:46:43 +0800
From:   Yicong Yang <yangyicong@huawei.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <chenweilong@huawei.com>, <f.fangjian@huawei.com>,
        <linuxarm@huawei.com>, <prime.zeng@huawei.com>,
        <yangyicong@hisilicon.com>, Sheng Feng <fengsheng5@huawei.com>
Subject: [PATCH 1/2] i2c: hisi: Avoid redundant interrupts
Date:   Mon, 13 Mar 2023 15:45:51 +0800
Message-ID: <20230313074552.54457-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230313074552.54457-1-yangyicong@huawei.com>
References: <20230313074552.54457-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Yicong Yang <yangyicong@hisilicon.com>

After issuing all the messages we can disable the TX_EMPTY interrupts
to avoid handling redundant interrupts. For doing a sinlge bus
detection (i2cdetect -y -r 0) we can reduce ~97% interrupts (before
~12000 after ~400).

Reported-by: Sheng Feng <fengsheng5@huawei.com>
Signed-off-by: Sheng Feng <fengsheng5@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/busses/i2c-hisi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index 8c6c7075c765..1b7609a34f4a 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -316,6 +316,13 @@ static void hisi_i2c_xfer_msg(struct hisi_i2c_controller *ctlr)
 		    max_write == 0)
 			break;
 	}
+
+	/*
+	 * Disable the TX_EMPTY interrupt after finishing all the messages to
+	 * avoid overwhelming the CPU.
+	 */
+	if (ctlr->msg_tx_idx == ctlr->msg_num)
+		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_TX_EMPTY);
 }
 
 static irqreturn_t hisi_i2c_irq(int irq, void *context)
-- 
2.24.0

