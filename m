Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560BE2B4588
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Nov 2020 15:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgKPOHo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Nov 2020 09:07:44 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:7923 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728074AbgKPOHo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Nov 2020 09:07:44 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZW9S3B94z6wnt;
        Mon, 16 Nov 2020 22:07:24 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 22:07:29 +0800
From:   Zhihao Cheng <chengzhihao1@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <wsa@kernel.org>, <sricharan@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chengzhihao1@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH] i2c: qup: Fix error return code in qup_i2c_bam_schedule_desc()
Date:   Mon, 16 Nov 2020 22:10:58 +0800
Message-ID: <20201116141058.2365043-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix to return the error code from qup_i2c_change_state()
instaed of 0 in qup_i2c_bam_schedule_desc().

Fixes: fbf9921f8b35d9b2 ("i2c: qup: Fix error handling")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/i2c/busses/i2c-qup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index fbc04b60cfd1..5a47915869ae 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -801,7 +801,8 @@ static int qup_i2c_bam_schedule_desc(struct qup_i2c_dev *qup)
 	if (ret || qup->bus_err || qup->qup_err) {
 		reinit_completion(&qup->xfer);
 
-		if (qup_i2c_change_state(qup, QUP_RUN_STATE)) {
+		ret = qup_i2c_change_state(qup, QUP_RUN_STATE);
+		if (ret) {
 			dev_err(qup->dev, "change to run state timed out");
 			goto desc_err;
 		}
-- 
2.25.4

