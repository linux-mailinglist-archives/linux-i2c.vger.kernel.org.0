Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 755A1F1950
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 16:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfKFPCk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 10:02:40 -0500
Received: from sauhun.de ([88.99.104.3]:53918 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727321AbfKFPCk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 10:02:40 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id DB5982C053B;
        Wed,  6 Nov 2019 16:02:38 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Max Staudt <max@enpas.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: icy: no need to populate address for scanned device
Date:   Wed,  6 Nov 2019 16:02:31 +0100
Message-Id: <20191106150231.26605-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_new_{probed|scanned}_device will update the address after scanning.
No need to preset it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Max, if you have a minute, could you test this (and the
i2c_new_scanned_device conversion) on your HW? Would be much
appreciated. Thanks!

 drivers/i2c/busses/i2c-icy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index 07baa4d8de39..271470f4d8a9 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -122,7 +122,6 @@ static int icy_probe(struct zorro_dev *z,
 	struct fwnode_handle *new_fwnode;
 	struct i2c_board_info ltc2990_info = {
 		.type		= "ltc2990",
-		.addr		= 0x4c,
 	};
 
 	i2c = devm_kzalloc(&z->dev, sizeof(*i2c), GFP_KERNEL);
-- 
2.20.1

