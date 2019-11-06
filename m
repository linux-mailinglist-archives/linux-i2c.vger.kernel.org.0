Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25A97F12BF
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 10:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfKFJug (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 04:50:36 -0500
Received: from sauhun.de ([88.99.104.3]:50164 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727239AbfKFJug (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 04:50:36 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id C36BD2C0548;
        Wed,  6 Nov 2019 10:50:34 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Max Staudt <max@enpas.org>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 02/12] i2c: icy: convert to i2c_new_scanned_device
Date:   Wed,  6 Nov 2019 10:50:20 +0100
Message-Id: <20191106095033.25182-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move from the deprecated i2c_new_probed_device() to the new
i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-icy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index 8382eb64b424..07baa4d8de39 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -188,10 +188,10 @@ static int icy_probe(struct zorro_dev *z,
 		ltc2990_info.fwnode = new_fwnode;
 
 		i2c->ltc2990_client =
-			i2c_new_probed_device(&i2c->adapter,
-					      &ltc2990_info,
-					      icy_ltc2990_addresses,
-					      NULL);
+			i2c_new_scanned_device(&i2c->adapter,
+					       &ltc2990_info,
+					       icy_ltc2990_addresses,
+					       NULL);
 	}
 
 	return 0;
-- 
2.20.1

