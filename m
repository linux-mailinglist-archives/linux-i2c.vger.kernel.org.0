Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B12194A16
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgCZVJ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:09:57 -0400
Received: from sauhun.de ([88.99.104.3]:54372 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbgCZVJ5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:09:57 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 1DC892C1F8B;
        Thu, 26 Mar 2020 22:09:55 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] power: supply: bq24190_charger: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:09:54 +0100
Message-Id: <20200326210954.12931-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326210954.12931-1-wsa+renesas@sang-engineering.com>
References: <20200326210954.12931-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API in this comment.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/power/supply/bq24190_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/bq24190_charger.c b/drivers/power/supply/bq24190_charger.c
index 453d6332d43a..4540e913057f 100644
--- a/drivers/power/supply/bq24190_charger.c
+++ b/drivers/power/supply/bq24190_charger.c
@@ -673,7 +673,7 @@ static int bq24190_register_reset(struct bq24190_dev_info *bdi)
 	 *   { .type = "bq24190", .addr = 0x6b, .properties = pe, .irq = irq };
 	 * struct i2c_adapter ad = { ... };
 	 * i2c_add_adapter(&ad);
-	 * i2c_new_device(&ad, &bi);
+	 * i2c_new_client_device(&ad, &bi);
 	 */
 	if (device_property_read_bool(bdi->dev, "disable-reset"))
 		return 0;
-- 
2.20.1

