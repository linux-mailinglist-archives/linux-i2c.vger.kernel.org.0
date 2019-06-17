Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2593048C38
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 20:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbfFQSjn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 14:39:43 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:37641 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfFQSjn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 14:39:43 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MZk1p-1i5l7r2t2l-00Wl3Z; Mon, 17 Jun 2019 20:39:40 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@the-dreams.de, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 2/3] drivers: gpio: pca953x: use subsys_i2c_driver()
Date:   Mon, 17 Jun 2019 20:39:38 +0200
Message-Id: <1560796779-17117-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796779-17117-1-git-send-email-info@metux.net>
References: <1560796779-17117-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:y/OLPt8jWGxBdQc5g2OSfdKXZL4KwALMlRKEmmbL/xl4LEmPK9X
 dqH+Uj77VBvCwLBmi4HtUwoSroGEToLQ3xMQ7WPwMrx0THYZ+9f8CELH8L3hoh/+0Ofd9ml
 8nbM7uXxARYP0UDiAGCfS7tdm2WxHqQOFIAl6vc9++H+XzzgjjIAW9vQTxHO4Zrye+kci6h
 YV168eOxGY6k5RIuQgagQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n9ZFQGog3wE=:OyEj5HFmdTkSqbmWBi2hgn
 oprlKpQbpKIJzslBvavsf6B7gVZ3ltUmlRFgFb0O6l+ArCvx9x14bjTFnKTAmza9fMVpK5zp5
 WH0/Rwig2ERdtRusXJQyVNl8cBvNufA9wsoND9OVrbtpyPvMnP7w9pF5YIJ6TqwhzmOyruBaW
 OvRK/xM6PlC2gzZOywkPgRtdWIIyX+XFD9m/CweFAS69QhN9D/gvjenJDtzx81JXyt9CiRZb+
 a3PQVsAcwG0ONRhaNPaTilk3hG1dJtcKIobM70c4triu1bmvIvrX4xUDmetPeHxBCRblnB4u+
 c0/IsuehtmdhMknDE2WlHmNCZYZL+RnMoH/G1PQS5U9/hQNJyyd1CgTdBKGwZ7cVntcEJZkY5
 QHS6t+uHVFESc8op3pbMwPPjh878j6JMorekVfX7brLZAPGuhAL7FsXNBgE8FtgqhwMQxdTsE
 sp3Km9/SYIDkEcmYfXIYegAQN7fQtXfE1Pg9fGABd19OV1G1Bi2LOLZ5WDncMvSkMWVVhhgTR
 Mh1galLA70gi6WQQPNG7vVSDu/dWD9P7/Ani2MJSpqwzBPOi7rybSMUbM/xN8K/DLLnS9e6s3
 YDRgD/rdImxXfzGIF0Il94o5KVNEcLPpXGtgcFWcZK/i/LD+5mOyj7s0a1aONPx6HaO7FKTS1
 DSXPEOc7Eu6XqPpw3RPDF/6UnwMJis/poE+ZwAu9n1ZTH2ofzyorGrLCi2n/hx59d67Xv4VEs
 dehaH1Np7hSB5O4Vx5d1indM4UGjGOymDJhVJw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_i2c_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-pca953x.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index cfe827c..532762d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1202,20 +1202,10 @@ static int pca953x_resume(struct device *dev)
 	.id_table	= pca953x_id,
 };
 
-static int __init pca953x_init(void)
-{
-	return i2c_add_driver(&pca953x_driver);
-}
 /* register after i2c postcore initcall and before
  * subsys initcalls that may rely on these GPIOs
  */
-subsys_initcall(pca953x_init);
-
-static void __exit pca953x_exit(void)
-{
-	i2c_del_driver(&pca953x_driver);
-}
-module_exit(pca953x_exit);
+subsys_i2c_driver(pca953x_driver);
 
 MODULE_AUTHOR("eric miao <eric.miao@marvell.com>");
 MODULE_DESCRIPTION("GPIO expander driver for PCA953x");
-- 
1.9.1

