Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52CC1C2616
	for <lists+linux-i2c@lfdr.de>; Sat,  2 May 2020 16:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbgEBO0x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 May 2020 10:26:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:57908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728204AbgEBO0x (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 May 2020 10:26:53 -0400
Received: from localhost (p5486C608.dip0.t-ipconnect.de [84.134.198.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F82924957;
        Sat,  2 May 2020 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588429612;
        bh=GXv+rUTMKqJw2Z4X+ex6dinlnBTVNkG6IA7d6C96ae4=;
        h=From:To:Cc:Subject:Date:From;
        b=t9aYOTIbpkZFFsc+wcm78KfOhgKDptNcZhJbOjkjQWdC+A8/FiaEuYT3weRiRD9Vz
         DsIXhXf2wTm+HXADEvkeVhzjXOMEottVpNAwP2Q7H9JfiafR/86W7+vFsTGHkL8qdl
         MiKK0xgKGW31ZxMkAvMVw+H9Z28wiAwQyRC12qGg=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: algo-pca: update contact email
Date:   Sat,  2 May 2020 16:26:49 +0200
Message-Id: <20200502142650.19089-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 'pengutronix' address is defunct for years. Use the proper contact
address.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/algos/i2c-algo-pca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
index dff4e178c732..7f10312d1b88 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -542,7 +542,7 @@ int i2c_pca_add_numbered_bus(struct i2c_adapter *adap)
 EXPORT_SYMBOL(i2c_pca_add_numbered_bus);
 
 MODULE_AUTHOR("Ian Campbell <icampbell@arcom.com>, "
-	"Wolfram Sang <w.sang@pengutronix.de>");
+	"Wolfram Sang <kernel@pengutronix.de>");
 MODULE_DESCRIPTION("I2C-Bus PCA9564/PCA9665 algorithm");
 MODULE_LICENSE("GPL");
 
-- 
2.20.1

