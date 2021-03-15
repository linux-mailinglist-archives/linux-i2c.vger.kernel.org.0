Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B5933B1BE
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 12:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCOLut (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 07:50:49 -0400
Received: from www.zeus03.de ([194.117.254.33]:45792 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230196AbhCOLuX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Mar 2021 07:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=iJrqMTwIM3xwIjns29vc+k51vDM
        wE2a+88javwYN/n0=; b=rmvO14+d4e7cVKd3aoLZwoyEAwoyQJraJkg4FCHiQU4
        BThco5CnYqrYZnkDGcSdM0S3nPrfpde509F0LTfzXW28/Drd97PcNAhq8LHU24Wy
        raPsUkdazMtZVGxerQInl/eSBgjEpB8bTDZfxpVuobOxSBH0MH928a5PgI3nzT2Y
        =
Received: (qmail 1376454 invoked from network); 15 Mar 2021 12:50:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Mar 2021 12:50:16 +0100
X-UD-Smtp-Session: l3s3148p1@dmJy2pG9vIcgARa4RYTzARykWRFxRPkz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Klaus Kudielka <klaus.kudielka@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: turn recovery error on init to debug
Date:   Mon, 15 Mar 2021 12:50:08 +0100
Message-Id: <20210315115008.19110-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In some configurations, recovery is optional. So, don't throw an error
when it is not used because e.g. pinctrl settings for recovery are not
provided. Reword the message and make it debug output.

Reported-by: Klaus Kudielka <klaus.kudielka@gmail.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested on a Renesas Salvator-XS with R-Car H3 ES2.0. Klaus, let me know
if you are happy as well.

 drivers/i2c/i2c-core-base.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf722a424..f21362355973 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -378,7 +378,7 @@ static int i2c_gpio_init_recovery(struct i2c_adapter *adap)
 static int i2c_init_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
-	char *err_str;
+	char *err_str, *err_level = KERN_ERR;
 
 	if (!bri)
 		return 0;
@@ -387,7 +387,8 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 		return -EPROBE_DEFER;
 
 	if (!bri->recover_bus) {
-		err_str = "no recover_bus() found";
+		err_str = "no suitable method provided";
+		err_level = KERN_DEBUG;
 		goto err;
 	}
 
@@ -414,7 +415,7 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 
 	return 0;
  err:
-	dev_err(&adap->dev, "Not using recovery: %s\n", err_str);
+	dev_printk(err_level, &adap->dev, "Not using recovery: %s\n", err_str);
 	adap->bus_recovery_info = NULL;
 
 	return -EINVAL;
-- 
2.30.0

