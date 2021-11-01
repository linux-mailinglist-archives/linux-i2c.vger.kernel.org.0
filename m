Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B97441BF1
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 14:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhKANvp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 09:51:45 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:26219 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231981AbhKANvh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 09:51:37 -0400
Received: from dggeml709-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HjZ8x54YFz8v7T;
        Mon,  1 Nov 2021 21:47:29 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 dggeml709-chm.china.huawei.com (10.3.17.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Mon, 1 Nov 2021 21:48:56 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Wolfram Sang <wsa@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Zhiqi Song <songzhiqi1@huawei.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>
CC:     <linux-i2c@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] i2c: xgene-slimpro: Fix wrong pointer passed to PTR_ERR()
Date:   Mon, 1 Nov 2021 14:02:35 +0000
Message-ID: <20211101140235.777322-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeml709-chm.china.huawei.com (10.3.17.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PTR_ERR should access the value just tested by IS_ERR, otherwise
the wrong error code will be returned.

Fixes: 7b6da7fe7bba ("mailbox: pcc: Use PCC mailbox channel pointer instead of standard")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/i2c/busses/i2c-xgene-slimpro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 1a19ebad60ad..63259b3ea5ab 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -487,7 +487,7 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 		pcc_chan = pcc_mbox_request_channel(cl, ctx->mbox_idx);
 		if (IS_ERR(pcc_chan)) {
 			dev_err(&pdev->dev, "PCC mailbox channel request failed\n");
-			return PTR_ERR(ctx->pcc_chan);
+			return PTR_ERR(pcc_chan);
 		}
 
 		ctx->pcc_chan = pcc_chan;

