Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF3AF20A7
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbfKFVWG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:22:06 -0500
Received: from sauhun.de ([88.99.104.3]:59026 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732439AbfKFVV2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:28 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id CF6202C0553;
        Wed,  6 Nov 2019 22:21:26 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/17] media: platform: sti: c8sectpfe: c8sectpfe-dvb: convert to use i2c_new_client_device()
Date:   Wed,  6 Nov 2019 22:21:10 +0100
Message-Id: <20191106212120.27983-11-wsa+renesas@sang-engineering.com>
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
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
index a79250a7f812..103872266565 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
@@ -170,8 +170,8 @@ int c8sectpfe_frontend_attach(struct dvb_frontend **fe,
 
 		/* attach tuner */
 		request_module("tda18212");
-		client = i2c_new_device(tsin->i2c_adapter, &tda18212_info);
-		if (!client || !client->dev.driver) {
+		client = i2c_new_client_device(tsin->i2c_adapter, &tda18212_info);
+		if (!i2c_client_has_driver(client)) {
 			dvb_frontend_detach(*fe);
 			return -ENODEV;
 		}
-- 
2.20.1

