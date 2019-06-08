Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF10339CCA
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 12:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfFHK4x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 06:56:53 -0400
Received: from sauhun.de ([88.99.104.3]:51862 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbfFHK4w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 8 Jun 2019 06:56:52 -0400
Received: from localhost (p5486CBCC.dip0.t-ipconnect.de [84.134.203.204])
        by pokefinder.org (Postfix) with ESMTPSA id 77F333E4770;
        Sat,  8 Jun 2019 12:56:50 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 18/34] power: supply: bq25890_charger: simplify getting the adapter of a client
Date:   Sat,  8 Jun 2019 12:55:57 +0200
Message-Id: <20190608105619.593-19-wsa+renesas@sang-engineering.com>
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

 drivers/power/supply/bq25890_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/supply/bq25890_charger.c
index b2ff82b4707a..d333f2b321b9 100644
--- a/drivers/power/supply/bq25890_charger.c
+++ b/drivers/power/supply/bq25890_charger.c
@@ -817,7 +817,7 @@ static int bq25890_fw_probe(struct bq25890_device *bq)
 static int bq25890_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
-	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
+	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
 	struct bq25890_device *bq;
 	int ret;
-- 
2.19.1

