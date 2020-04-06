Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45C819F5C1
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Apr 2020 14:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbgDFMZm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Apr 2020 08:25:42 -0400
Received: from sauhun.de ([88.99.104.3]:39032 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727522AbgDFMZm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Apr 2020 08:25:42 -0400
Received: from localhost (p54B335C6.dip0.t-ipconnect.de [84.179.53.198])
        by pokefinder.org (Postfix) with ESMTPSA id E3AA52C0961;
        Mon,  6 Apr 2020 14:25:40 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: remove i2c_new_probed_device API
Date:   Mon,  6 Apr 2020 14:25:31 +0200
Message-Id: <20200406122531.3763-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All in-tree users have been converted to the new i2c_new_scanned_device
function, so remove this deprecated one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I will send this one out around rc1 release.

Another step done. Only a few i2c_new_device conversions left...

 drivers/i2c/i2c-core-base.c | 13 -------------
 include/linux/i2c.h         |  6 ------
 2 files changed, 19 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5cc0b0ec5570..a66912782064 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2273,19 +2273,6 @@ i2c_new_scanned_device(struct i2c_adapter *adap,
 }
 EXPORT_SYMBOL_GPL(i2c_new_scanned_device);
 
-struct i2c_client *
-i2c_new_probed_device(struct i2c_adapter *adap,
-		      struct i2c_board_info *info,
-		      unsigned short const *addr_list,
-		      int (*probe)(struct i2c_adapter *adap, unsigned short addr))
-{
-	struct i2c_client *client;
-
-	client = i2c_new_scanned_device(adap, info, addr_list, probe);
-	return IS_ERR(client) ? NULL : client;
-}
-EXPORT_SYMBOL_GPL(i2c_new_probed_device);
-
 struct i2c_adapter *i2c_get_adapter(int nr)
 {
 	struct i2c_adapter *adapter;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 456fc17ecb1c..45d36ba4826b 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -461,12 +461,6 @@ i2c_new_scanned_device(struct i2c_adapter *adap,
 		       unsigned short const *addr_list,
 		       int (*probe)(struct i2c_adapter *adap, unsigned short addr));
 
-struct i2c_client *
-i2c_new_probed_device(struct i2c_adapter *adap,
-		       struct i2c_board_info *info,
-		       unsigned short const *addr_list,
-		       int (*probe)(struct i2c_adapter *adap, unsigned short addr));
-
 /* Common custom probe functions */
 int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr);
 
-- 
2.20.1

