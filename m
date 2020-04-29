Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E4D1BDC7D
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 14:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgD2MlB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 08:41:01 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3382 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726516AbgD2MlA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Apr 2020 08:41:00 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id F2D9E481BCF15DD98D02;
        Wed, 29 Apr 2020 20:40:52 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 29 Apr 2020 20:40:43 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] i2c: sh_mobile: eliminate a misreported warning
Date:   Wed, 29 Apr 2020 20:40:17 +0800
Message-ID: <20200429124017.397-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The warning is caused by the branches "if (pd->pos == -1)" and
"if (pd->pos == 0)", because they appear after "real_pos = pd->pos - 2",
so the compiler doesn't known the value of real_pos is negative through
these two branches.

To avoid this warning, eliminate the middleman "data".

drivers/i2c/busses/i2c-sh_mobile.c: In function ‘sh_mobile_i2c_isr’:
drivers/i2c/busses/i2c-sh_mobile.c:396:26: warning: ‘data’ may be used uninitialized in this function [-Wmaybe-uninitialized]
   pd->msg->buf[real_pos] = data;
                          ^
drivers/i2c/busses/i2c-sh_mobile.c:369:16: note: ‘data’ was declared here
  unsigned char data;

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index d83ca4028fa0..2cca1b21e26e 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -366,7 +366,6 @@ static int sh_mobile_i2c_isr_tx(struct sh_mobile_i2c_data *pd)
 
 static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 {
-	unsigned char data;
 	int real_pos;
 
 	/* switch from TX (address) to RX (data) adds two interrupts */
@@ -387,13 +386,11 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 		if (real_pos < 0)
 			i2c_op(pd, OP_RX_STOP);
 		else
-			data = i2c_op(pd, OP_RX_STOP_DATA);
+			pd->msg->buf[real_pos] = i2c_op(pd, OP_RX_STOP_DATA);
 	} else if (real_pos >= 0) {
-		data = i2c_op(pd, OP_RX);
+		pd->msg->buf[real_pos] = i2c_op(pd, OP_RX);
 	}
 
-	if (real_pos >= 0)
-		pd->msg->buf[real_pos] = data;
  done:
 	pd->pos++;
 	return pd->pos == (pd->msg->len + 2);
-- 
2.26.0.106.g9fadedd


