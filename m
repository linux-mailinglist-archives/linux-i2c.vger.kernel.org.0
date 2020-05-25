Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA431E0E14
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 14:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390293AbgEYMFM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 08:05:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:40252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390169AbgEYMFL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 May 2020 08:05:11 -0400
Received: from localhost (p54b3318b.dip0.t-ipconnect.de [84.179.49.139])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1BC02073B;
        Mon, 25 May 2020 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590408311;
        bh=ItJJOpEAFwOTlS1jRa48EC2cZ16DVsLPyRmX4t19Wuk=;
        h=From:To:Cc:Subject:Date:From;
        b=Ux1BlNQysgf6q0PEqCFQxuuATptqwOnSDlmhpYJqmHqi7/7Oj+v5r5e0p0Q8smr/I
         NFnxu2HJ2KXeJxwc+aT01aKtFrcYtXPDR873RuarGwSbV5EcKdR6jvLcH38CxCZll4
         FNE/a3i3zFmuF3kWdVxe7AukEh5Fu6FS+2ZlEL/Q=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: avoid confusing naming in header
Date:   Mon, 25 May 2020 14:05:04 +0200
Message-Id: <20200525120504.23338-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_client pointers are usually named 'client'. Use it here to get rid
of the ambiguity of 'dev->dev'.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

Tested by booting a Renesas Lager board; no regressions discovered.

 include/linux/i2c.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 49d29054e657..c10617bb980a 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -351,14 +351,14 @@ static inline struct i2c_client *kobj_to_i2c_client(struct kobject *kobj)
 	return to_i2c_client(dev);
 }
 
-static inline void *i2c_get_clientdata(const struct i2c_client *dev)
+static inline void *i2c_get_clientdata(const struct i2c_client *client)
 {
-	return dev_get_drvdata(&dev->dev);
+	return dev_get_drvdata(&client->dev);
 }
 
-static inline void i2c_set_clientdata(struct i2c_client *dev, void *data)
+static inline void i2c_set_clientdata(struct i2c_client *client, void *data)
 {
-	dev_set_drvdata(&dev->dev, data);
+	dev_set_drvdata(&client->dev, data);
 }
 
 /* I2C slave support */
-- 
2.20.1

