Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86767F20B2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732141AbfKFVVX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:21:23 -0500
Received: from sauhun.de ([88.99.104.3]:58986 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727973AbfKFVVX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:23 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 90CEF2C054E;
        Wed,  6 Nov 2019 22:21:21 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/17] media: dvb-core: dvbdev: convert to use i2c_new_client_device()
Date:   Wed,  6 Nov 2019 22:21:02 +0100
Message-Id: <20191106212120.27983-3-wsa+renesas@sang-engineering.com>
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
 drivers/media/dvb-core/dvbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 917fe034af37..80b6a71aa33e 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -983,8 +983,8 @@ struct i2c_client *dvb_module_probe(const char *module_name,
 	board_info->addr = addr;
 	board_info->platform_data = platform_data;
 	request_module(module_name);
-	client = i2c_new_device(adap, board_info);
-	if (client == NULL || client->dev.driver == NULL) {
+	client = i2c_new_client_device(adap, board_info);
+	if (!i2c_client_has_driver(client)) {
 		kfree(board_info);
 		return NULL;
 	}
-- 
2.20.1

