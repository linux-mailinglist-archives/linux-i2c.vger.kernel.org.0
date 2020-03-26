Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 599411949FB
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgCZVKQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:10:16 -0400
Received: from sauhun.de ([88.99.104.3]:54558 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727960AbgCZVKP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:10:15 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id C69492C1F96;
        Thu, 26 Mar 2020 22:10:13 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ALSA: ppc: keywest: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:10:12 +0100
Message-Id: <20200326211013.13531-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326211013.13531-1-wsa+renesas@sang-engineering.com>
References: <20200326211013.13531-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/ppc/keywest.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index 093806d735c6..9554a0c506af 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -40,6 +40,7 @@ static int keywest_probe(struct i2c_client *client,
 static int keywest_attach_adapter(struct i2c_adapter *adapter)
 {
 	struct i2c_board_info info;
+	struct i2c_client *client;
 
 	if (! keywest_ctx)
 		return -EINVAL;
@@ -50,9 +51,11 @@ static int keywest_attach_adapter(struct i2c_adapter *adapter)
 	memset(&info, 0, sizeof(struct i2c_board_info));
 	strlcpy(info.type, "keywest", I2C_NAME_SIZE);
 	info.addr = keywest_ctx->addr;
-	keywest_ctx->client = i2c_new_device(adapter, &info);
-	if (!keywest_ctx->client)
-		return -ENODEV;
+	client = i2c_new_client_device(adapter, &info);
+	if (IS_ERR(client))
+		return PTR_ERR(client);
+	keywest_ctx->client = client;
+
 	/*
 	 * We know the driver is already loaded, so the device should be
 	 * already bound. If not it means binding failed, and then there
-- 
2.20.1

