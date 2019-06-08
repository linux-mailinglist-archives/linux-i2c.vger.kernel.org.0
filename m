Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBD639CC0
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 12:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfFHK6c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 06:58:32 -0400
Received: from sauhun.de ([88.99.104.3]:51862 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbfFHK4y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 8 Jun 2019 06:56:54 -0400
Received: from localhost (p5486CBCC.dip0.t-ipconnect.de [84.134.203.204])
        by pokefinder.org (Postfix) with ESMTPSA id 1D4E23E4770;
        Sat,  8 Jun 2019 12:56:53 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 23/34] power: supply: rt9455_charger: simplify getting the adapter of a client
Date:   Sat,  8 Jun 2019 12:56:02 +0200
Message-Id: <20190608105619.593-24-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have a dedicated pointer for that, so use it. Much easier to read and
less computation involved.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Please apply to your subsystem tree.

 drivers/power/supply/rt9455_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/rt9455_charger.c b/drivers/power/supply/rt9455_charger.c
index 40a9d329418a..29161ae90245 100644
--- a/drivers/power/supply/rt9455_charger.c
+++ b/drivers/power/supply/rt9455_charger.c
@@ -1584,7 +1584,7 @@ static const struct regmap_config rt9455_regmap_config = {
 static int rt9455_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
-	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
+	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
 	struct rt9455_info *info;
 	struct power_supply_config rt9455_charger_config = {};
-- 
2.19.1

