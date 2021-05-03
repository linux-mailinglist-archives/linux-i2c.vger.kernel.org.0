Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6073711CE
	for <lists+linux-i2c@lfdr.de>; Mon,  3 May 2021 09:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhECHDX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 May 2021 03:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhECHDW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 May 2021 03:03:22 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2A1C061756
        for <linux-i2c@vger.kernel.org>; Mon,  3 May 2021 00:02:29 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by baptiste.telenet-ops.be with bizsmtp
        id 072P2500N3aEpPb0172PRJ; Mon, 03 May 2021 09:02:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldSb1-002SiY-5h; Mon, 03 May 2021 09:02:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldSb0-0006El-Ef; Mon, 03 May 2021 09:02:22 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Max Staudt <max@enpas.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] i2c: icy: Remove unused variable new_fwnode in icy_probe()
Date:   Mon,  3 May 2021 09:02:20 +0200
Message-Id: <20210503070220.23932-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The last user of new_fwnode was removed, leading to:

    drivers/i2c/busses/i2c-icy.c: In function ‘icy_probe’:
    drivers/i2c/busses/i2c-icy.c:126:24: warning: unused variable ‘new_fwnode’ [-Wunused-variable]
      126 |  struct fwnode_handle *new_fwnode;
	  |                        ^~~~~~~~~~

Fixes: dd7a37102b79ae55 ("i2c: icy: Constify the software node")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/i2c/busses/i2c-icy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index c8c422e9dda43393..5dae7cab72605592 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -123,7 +123,6 @@ static int icy_probe(struct zorro_dev *z,
 {
 	struct icy_i2c *i2c;
 	struct i2c_algo_pcf_data *algo_data;
-	struct fwnode_handle *new_fwnode;
 	struct i2c_board_info ltc2990_info = {
 		.type		= "ltc2990",
 		.swnode		= &icy_ltc2990_node,
-- 
2.25.1

