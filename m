Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 090CF4881B5
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jan 2022 06:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbiAHFlO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 00:41:14 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:39182 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229708AbiAHFlO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 00:41:14 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0V1E-kH9_1641620471;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0V1E-kH9_1641620471)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 08 Jan 2022 13:41:11 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     wsa+renesas@sang-engineering.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] i2c: sh_mobile: remove unneeded semicolon
Date:   Sat,  8 Jan 2022 13:41:09 +0800
Message-Id: <20220108054109.119750-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Eliminate the following coccicheck warning:
./drivers/i2c/busses/i2c-sh_mobile.c:849:3-4: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 9754849dbb23..72f024a0c363 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -846,7 +846,7 @@ static int sh_mobile_i2c_hook_irqs(struct platform_device *dev, struct sh_mobile
 				return ret;
 			}
 			k++;
-		};
+		}
 	} else {
 		struct resource *res;
 		resource_size_t n;
-- 
2.20.1.7.g153144c

