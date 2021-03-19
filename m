Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11993419A1
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 11:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhCSKMm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 06:12:42 -0400
Received: from out28-98.mail.aliyun.com ([115.124.28.98]:57807 "EHLO
        out28-98.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhCSKM3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Mar 2021 06:12:29 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1038196|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00916001-0.000361254-0.990479;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.JnFD7JF_1616148736;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JnFD7JF_1616148736)
          by smtp.aliyun-inc.com(10.147.41.187);
          Fri, 19 Mar 2021 18:12:22 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     wsa@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, ywltyut@sina.cn, sernia.zhou@foxmail.com
Subject: Fix bug for Ingenic X1000 v2.
Date:   Fri, 19 Mar 2021 18:12:12 +0800
Message-Id: <1616148733-15154-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For SoCs after X1000, only send "X1000_I2C_DC_STOP" when last byte,
or it will cause error when I2C write operation.

v1->v2:
1.Add missing Reported-by and Tested-by.
2.Remove change which not related to the bugfix.

周琰杰 (Zhou Yanjie) (1):
  I2C: JZ4780: Fix bug for Ingenic X1000.

 drivers/i2c/busses/i2c-jz4780.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4

