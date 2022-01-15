Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C33648F3F2
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jan 2022 02:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiAOBMK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 20:12:10 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:33048 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbiAOBMK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jan 2022 20:12:10 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4JbKrm3SHxz63;
        Sat, 15 Jan 2022 02:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642209128; bh=scKGEpL52lWp55TeU1oP8aPIFhzsHvC402p525gBJdc=;
        h=Date:From:Subject:To:Cc:From;
        b=sAAisDp4DFHGd11WZcpdhzySV3jCCK1KGnP+E2YPDP2vQhhZBO8DeQefJZvS1lQvO
         CTBMhw7b0yhJRUD+tj3uQOiUagnb1n38WvqUFjKW0/iinCXSZeD39alzDWlBYa1enL
         l4yn4wKz2Pt05q94RON5XZsYMMIMtX08/2LRA+qZ0Hio4u80g4NYovyIIG3ubd1Cfv
         G6QCbAdClBwfpSOUiHlsovjAHYXkb5EED1POtEJtOQjIq4MESa9DQkU+shdC6bxLoN
         gBB79oe4Sp/96GvOUDQpcgJUwrCJR+4DnZUZL9tP7X3hpX1HIIOBtqXI0aSoo2t8lG
         4ZkA8Qn1F48cQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Sat, 15 Jan 2022 02:12:07 +0100
Message-Id: <a9dc272e4e06db661125b7b4c330821b532afc4d.1642209079.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] i2c: core: fix potential use-after-free on adapter removal
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

put_device(&adap->dev) might free the memory pointed to by `adap`,
so we shouldn't read adap->owner after that.

Fix by saving module pointer before calling put_device().

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/i2c/i2c-core-base.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2c59dd748a49..5d694f8ce9ef 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2464,11 +2464,14 @@ EXPORT_SYMBOL(i2c_get_adapter);
 
 void i2c_put_adapter(struct i2c_adapter *adap)
 {
+	struct module *owner;
+
 	if (!adap)
 		return;
 
+	owner = adap->owner;
 	put_device(&adap->dev);
-	module_put(adap->owner);
+	module_put(owner);
 }
 EXPORT_SYMBOL(i2c_put_adapter);
 
-- 
2.30.2

