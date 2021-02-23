Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2E83224E7
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 05:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBWEai (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 23:30:38 -0500
Received: from m12-15.163.com ([220.181.12.15]:37608 "EHLO m12-15.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229886AbhBWEag (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Feb 2021 23:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4Q8G+
        thhSes14HOGuyk5bkywj7djiYy6NknykskR6dc=; b=XV0qr8Z5pe0s2lV8uad7/
        ayLRALERfFFCvXuoeAoQ4mq8fUGOFIOJl+v80d7W8q7G/kpuIA33rEjn9ulSieiu
        uTsbAq08awmtJnZOuFSl+wbqgZzAsnfCny73zV++U/ExBaPdQQbmjxXu05So/m86
        xQ552Ol6EYVUz7jjWrzgRE=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
        by smtp11 (Coremail) with SMTP id D8CowACHOxztbTRgAmF8Cg--.10S2;
        Tue, 23 Feb 2021 10:52:38 +0800 (CST)
From:   dingsenjie@163.com
To:     krzk@kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH] i2c/busses:remove unneeded "ret" variables in the i2c-s3c2410.c
Date:   Tue, 23 Feb 2021 10:52:21 +0800
Message-Id: <20210223025221.18028-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowACHOxztbTRgAmF8Cg--.10S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFy8uFWrZF13CFWxXry8uFg_yoWfXwc_Kw
        n2gwn7Gr1qkwn5Jr1UCrW3ZryrKay8WF1kW3ZYv343CF15Zw17WF4DCryfGrZ7Wr43ZFyj
        9340gFsIyw1xtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnmjg7UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiThZCyFUDH1OW1AAAsK
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: dingsenjie <dingsenjie@yulong.com>

remove unneeded "ret" variables in the i2c-s3c2410.c.

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 3eafe0e..be8f2da 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -388,7 +388,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 {
 	unsigned long tmp;
 	unsigned char byte;
-	int ret = 0;
 
 	switch (i2c->state) {
 
@@ -548,7 +547,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 	tmp &= ~S3C2410_IICCON_IRQPEND;
 	writel(tmp, i2c->regs + S3C2410_IICCON);
  out:
-	return ret;
+	return 0;
 }
 
 /*
-- 
1.9.1


