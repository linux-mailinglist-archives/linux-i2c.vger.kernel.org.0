Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9A9F209D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732743AbfKFVVs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:21:48 -0500
Received: from sauhun.de ([88.99.104.3]:59072 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732671AbfKFVVa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:30 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 93DEF2C0558;
        Wed,  6 Nov 2019 22:21:28 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/17] media: usb: dvb-usb-v2: rtl28xxu: convert to use i2c_new_client_device()
Date:   Wed,  6 Nov 2019 22:21:13 +0100
Message-Id: <20191106212120.27983-14-wsa+renesas@sang-engineering.com>
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
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 36 ++++++++++++-------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 5016ede7b35f..3a4eb992024a 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -697,8 +697,8 @@ static int rtl2831u_frontend_attach(struct dvb_usb_adapter *adap)
 	board_info.addr = 0x10;
 	board_info.platform_data = pdata;
 	request_module("%s", board_info.type);
-	client = i2c_new_device(&d->i2c_adap, &board_info);
-	if (client == NULL || client->dev.driver == NULL) {
+	client = i2c_new_client_device(&d->i2c_adap, &board_info);
+	if (!i2c_client_has_driver(client)) {
 		ret = -ENODEV;
 		goto err;
 	}
@@ -918,8 +918,8 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 	board_info.addr = 0x10;
 	board_info.platform_data = pdata;
 	request_module("%s", board_info.type);
-	client = i2c_new_device(&d->i2c_adap, &board_info);
-	if (client == NULL || client->dev.driver == NULL) {
+	client = i2c_new_client_device(&d->i2c_adap, &board_info);
+	if (!i2c_client_has_driver(client)) {
 		ret = -ENODEV;
 		goto err;
 	}
@@ -960,8 +960,8 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			info.addr = 0x18;
 			info.platform_data = &mn88472_config;
 			request_module(info.type);
-			client = i2c_new_device(&d->i2c_adap, &info);
-			if (client == NULL || client->dev.driver == NULL) {
+			client = i2c_new_client_device(&d->i2c_adap, &info);
+			if (!i2c_client_has_driver(client)) {
 				dev->slave_demod = SLAVE_DEMOD_NONE;
 				goto err_slave_demod_failed;
 			}
@@ -982,8 +982,8 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			info.addr = 0x18;
 			info.platform_data = &mn88473_config;
 			request_module(info.type);
-			client = i2c_new_device(&d->i2c_adap, &info);
-			if (client == NULL || client->dev.driver == NULL) {
+			client = i2c_new_client_device(&d->i2c_adap, &info);
+			if (!i2c_client_has_driver(client)) {
 				dev->slave_demod = SLAVE_DEMOD_NONE;
 				goto err_slave_demod_failed;
 			}
@@ -1025,8 +1025,8 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			info.addr = 0x64;
 			info.platform_data = &si2168_config;
 			request_module(info.type);
-			client = i2c_new_device(&d->i2c_adap, &info);
-			if (client == NULL || client->dev.driver == NULL) {
+			client = i2c_new_client_device(&d->i2c_adap, &info);
+			if (!i2c_client_has_driver(client)) {
 				dev->slave_demod = SLAVE_DEMOD_NONE;
 				goto err_slave_demod_failed;
 			}
@@ -1217,8 +1217,8 @@ static int rtl2832u_tuner_attach(struct dvb_usb_adapter *adap)
 			info.platform_data = &e4000_config;
 
 			request_module(info.type);
-			client = i2c_new_device(dev->demod_i2c_adapter, &info);
-			if (client == NULL || client->dev.driver == NULL)
+			client = i2c_new_client_device(dev->demod_i2c_adapter, &info);
+			if (!i2c_client_has_driver(client))
 				break;
 
 			if (!try_module_get(client->dev.driver->owner)) {
@@ -1240,9 +1240,9 @@ static int rtl2832u_tuner_attach(struct dvb_usb_adapter *adap)
 			board_info.addr = 0x56;
 			board_info.platform_data = &fc2580_pdata;
 			request_module("fc2580");
-			client = i2c_new_device(dev->demod_i2c_adapter,
+			client = i2c_new_client_device(dev->demod_i2c_adapter,
 						&board_info);
-			if (client == NULL || client->dev.driver == NULL)
+			if (!i2c_client_has_driver(client))
 				break;
 			if (!try_module_get(client->dev.driver->owner)) {
 				i2c_unregister_device(client);
@@ -1271,8 +1271,8 @@ static int rtl2832u_tuner_attach(struct dvb_usb_adapter *adap)
 		board_info.addr = 0x60;
 		board_info.platform_data = &tua9001_pdata;
 		request_module("tua9001");
-		client = i2c_new_device(dev->demod_i2c_adapter, &board_info);
-		if (client == NULL || client->dev.driver == NULL)
+		client = i2c_new_client_device(dev->demod_i2c_adapter, &board_info);
+		if (!i2c_client_has_driver(client))
 			break;
 		if (!try_module_get(client->dev.driver->owner)) {
 			i2c_unregister_device(client);
@@ -1316,8 +1316,8 @@ static int rtl2832u_tuner_attach(struct dvb_usb_adapter *adap)
 			info.addr = 0x60;
 			info.platform_data = &si2157_config;
 			request_module(info.type);
-			client = i2c_new_device(&d->i2c_adap, &info);
-			if (client == NULL || client->dev.driver == NULL)
+			client = i2c_new_client_device(&d->i2c_adap, &info);
+			if (!i2c_client_has_driver(client))
 				break;
 
 			if (!try_module_get(client->dev.driver->owner)) {
-- 
2.20.1

