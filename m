Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B89939CDC
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 12:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbfFHK7N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 06:59:13 -0400
Received: from sauhun.de ([88.99.104.3]:51870 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727028AbfFHK4t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 8 Jun 2019 06:56:49 -0400
Received: from localhost (p5486CBCC.dip0.t-ipconnect.de [84.134.203.204])
        by pokefinder.org (Postfix) with ESMTPSA id 5A5523E4771;
        Sat,  8 Jun 2019 12:56:48 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/34] misc: tsl2550: simplify getting the adapter of a client
Date:   Sat,  8 Jun 2019 12:55:53 +0200
Message-Id: <20190608105619.593-15-wsa+renesas@sang-engineering.com>
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

 drivers/misc/tsl2550.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/tsl2550.c b/drivers/misc/tsl2550.c
index 5b7afd6190fe..09db397df287 100644
--- a/drivers/misc/tsl2550.c
+++ b/drivers/misc/tsl2550.c
@@ -336,7 +336,7 @@ static struct i2c_driver tsl2550_driver;
 static int tsl2550_probe(struct i2c_client *client,
 				   const struct i2c_device_id *id)
 {
-	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
+	struct i2c_adapter *adapter = client->adapter;
 	struct tsl2550_data *data;
 	int *opmode, err = 0;
 
-- 
2.19.1

