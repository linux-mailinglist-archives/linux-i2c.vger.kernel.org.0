Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96AACF20BB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732603AbfKFVVZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:21:25 -0500
Received: from sauhun.de ([88.99.104.3]:59014 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732439AbfKFVVZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:25 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 9C4B22C054E;
        Wed,  6 Nov 2019 22:21:23 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/17] media: dvb-frontends: m88ds3103: convert to use i2c_new_client_device()
Date:   Wed,  6 Nov 2019 22:21:05 +0100
Message-Id: <20191106212120.27983-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106212120.27983-1-wsa+renesas@sang-engineering.com>
References: <20191106212120.27983-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the newer API returning an ERRPTR and use the new helper to bail
out.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/dvb-frontends/m88ds3103.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index 3a367a585084..c96f05ff5f2f 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1277,8 +1277,8 @@ struct dvb_frontend *m88ds3103_attach(const struct m88ds3103_config *cfg,
 	strscpy(board_info.type, "m88ds3103", I2C_NAME_SIZE);
 	board_info.addr = cfg->i2c_addr;
 	board_info.platform_data = &pdata;
-	client = i2c_new_device(i2c, &board_info);
-	if (!client || !client->dev.driver)
+	client = i2c_new_client_device(i2c, &board_info);
+	if (!i2c_client_has_driver(client))
 		return NULL;
 
 	*tuner_i2c_adapter = pdata.get_i2c_adapter(client);
-- 
2.20.1

