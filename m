Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C06E3419A3
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 11:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhCSKMl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 06:12:41 -0400
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:59393 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhCSKM3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Mar 2021 06:12:29 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08010255|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00528173-0.000297908-0.99442;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.JnFD7JF_1616148736;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JnFD7JF_1616148736)
          by smtp.aliyun-inc.com(10.147.41.187);
          Fri, 19 Mar 2021 18:12:23 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     wsa@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, ywltyut@sina.cn, sernia.zhou@foxmail.com
Subject: [PATCH v2] I2C: JZ4780: Fix bug for Ingenic X1000.
Date:   Fri, 19 Mar 2021 18:12:13 +0800
Message-Id: <1616148733-15154-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616148733-15154-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1616148733-15154-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Only send "X1000_I2C_DC_STOP" when last byte, or it will cause
error when I2C write operation.

Fixes: 21575a7a8d4c ("I2C: JZ4780: Add support for the X1000.")

Reported-by: 杨文龙 (Yang Wenlong) <ywltyut@sina.cn>
Tested-by: 杨文龙 (Yang Wenlong) <ywltyut@sina.cn>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    1.Add missing Reported-by and Tested-by.
    2.Remove change which not related to the bugfix.

 drivers/i2c/busses/i2c-jz4780.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 8509c5f..55177eb 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -525,8 +525,8 @@ static irqreturn_t jz4780_i2c_irq(int irqno, void *dev_id)
 				i2c_sta = jz4780_i2c_readw(i2c, JZ4780_I2C_STA);
 				data = *i2c->wbuf;
 				data &= ~JZ4780_I2C_DC_READ;
-				if ((!i2c->stop_hold) && (i2c->cdata->version >=
-						ID_X1000))
+				if ((i2c->wt_len == 1) && (!i2c->stop_hold) &&
+						(i2c->cdata->version >= ID_X1000))
 					data |= X1000_I2C_DC_STOP;
 				jz4780_i2c_writew(i2c, JZ4780_I2C_DC, data);
 				i2c->wbuf++;
-- 
2.7.4

