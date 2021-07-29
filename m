Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DD83DA101
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jul 2021 12:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhG2KYv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Jul 2021 06:24:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:59224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235510AbhG2KYv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Jul 2021 06:24:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B27A960249;
        Thu, 29 Jul 2021 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627554287;
        bh=/a47ddqQ3sBiuyUH/SAsvhNh6TP1yNBcCFyH3ZI0CI4=;
        h=From:To:Cc:Subject:Date:From;
        b=xgDfOOYv+L4JD9RMXcqp+bIQsRbSWDjIsSaRk/Cd21y4Tx7vfoo77Lc+pDwx0Io7y
         UJbc61gKWHZbx0dCYC5ZODbbOaMm7cVI3lFxzwwkczvWqBse4lcbgc+0gQN0ISiP3X
         458Q+KDOLYF4ns9of2NcZeedMxlvVyaVp4DwPX94=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Eric Dumazet <edumazet@google.com>
Subject: [PATCH] i2c: dev: zero out array used for i2c reads from userspace
Date:   Thu, 29 Jul 2021 12:24:43 +0200
Message-Id: <20210729102443.1729100-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; h=from:subject; bh=/a47ddqQ3sBiuyUH/SAsvhNh6TP1yNBcCFyH3ZI0CI4=; b=owGbwMvMwCRo6H6F97bub03G02pJDIlMjS/qA70OXMrm4XC6+bq484/Ux8pHZZ/XVhUwFxyNFQy7 /lKzI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACZSeY9hrsyKROWtQabaN8+3ZgfNnS ict+3zBIa5EivWH3j9rtQtVFBY0nR9od60Txs3AwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If an i2c driver happens to not provide the full amount of data that a
user asks for, it is possible that some uninitialized data could be sent
to userspace.  While all in-kernel drivers look to be safe, just be sure
by initializing the buffer to zero before it is passed to the i2c driver
so that any future drivers will not have this issue.

Reported-by: Eric Dumazet <edumazet@google.com>
Cc: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/i2c/i2c-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index cb64fe649390..ae59ef5748f4 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -141,7 +141,7 @@ static ssize_t i2cdev_read(struct file *file, char __user *buf, size_t count,
 	if (count > 8192)
 		count = 8192;
 
-	tmp = kmalloc(count, GFP_KERNEL);
+	tmp = kzalloc(count, GFP_KERNEL);
 	if (tmp == NULL)
 		return -ENOMEM;
 
-- 
2.32.0

