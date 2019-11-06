Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 401D0F209B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732737AbfKFVVr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:21:47 -0500
Received: from sauhun.de ([88.99.104.3]:59084 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732673AbfKFVVa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:30 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 20D722C056C;
        Wed,  6 Nov 2019 22:21:29 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/17] media: usb: dvb-usb-v2: zd1301: convert to use i2c_new_client_device()
Date:   Wed,  6 Nov 2019 22:21:14 +0100
Message-Id: <20191106212120.27983-15-wsa+renesas@sang-engineering.com>
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
 drivers/media/usb/dvb-usb-v2/zd1301.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/zd1301.c b/drivers/media/usb/dvb-usb-v2/zd1301.c
index 63b66b207b64..ba2c1b0d3989 100644
--- a/drivers/media/usb/dvb-usb-v2/zd1301.c
+++ b/drivers/media/usb/dvb-usb-v2/zd1301.c
@@ -172,8 +172,8 @@ static int zd1301_frontend_attach(struct dvb_usb_adapter *adap)
 	board_info.addr = 0x60;
 	board_info.platform_data = &dev->mt2060_pdata;
 	request_module("%s", "mt2060");
-	client = i2c_new_device(adapter, &board_info);
-	if (!client || !client->dev.driver) {
+	client = i2c_new_client_device(adapter, &board_info);
+	if (!i2c_client_has_driver(client)) {
 		ret = -ENODEV;
 		goto err_module_put_demod;
 	}
-- 
2.20.1

