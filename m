Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783212E6BC1
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Dec 2020 00:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbgL1Wzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Dec 2020 17:55:52 -0500
Received: from mga09.intel.com ([134.134.136.24]:61112 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729380AbgL1UIR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Dec 2020 15:08:17 -0500
IronPort-SDR: RREgzjBaso99mSTeVlNaUy/fo6AtEYfr5dvuAwWn4/WESK/hUOpSStApNE9gzeb07uazx5RTfe
 t/9l6eZMOEaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="176575254"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="176575254"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 12:06:22 -0800
IronPort-SDR: zJFJp+S+NPWOURQbhlYG5sNbx6K0NY67QRYgLpqSe3+GVrv6pIJj4j/3YkUdHUf3jvZOZG2DP6
 XQjzhODS1dEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="418919057"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 28 Dec 2020 12:06:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A9F3973; Mon, 28 Dec 2020 22:06:19 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] i2c: i801: Drop duplicate NULL check in i801_del_mux()
Date:   Mon, 28 Dec 2020 22:06:17 +0200
Message-Id: <20201228200618.58716-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
References: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since gpiod_remove_lookup_table() is NULL-aware, no need to have this check
in the caller. Drop duplicate NULL check.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ae90713443fa..7c2569a18f8c 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1487,8 +1487,7 @@ static void i801_del_mux(struct i801_priv *priv)
 {
 	if (priv->mux_pdev)
 		platform_device_unregister(priv->mux_pdev);
-	if (priv->lookup)
-		gpiod_remove_lookup_table(priv->lookup);
+	gpiod_remove_lookup_table(priv->lookup);
 }
 
 static unsigned int i801_get_adapter_class(struct i801_priv *priv)
-- 
2.29.2

