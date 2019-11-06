Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36769F208C
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732651AbfKFVV2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:21:28 -0500
Received: from sauhun.de ([88.99.104.3]:59014 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732608AbfKFVV1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:27 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 9DDF52C0558;
        Wed,  6 Nov 2019 22:21:25 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/17] media: pci: saa7164: saa7164-dvb: convert to use i2c_new_client_device()
Date:   Wed,  6 Nov 2019 22:21:08 +0100
Message-Id: <20191106212120.27983-9-wsa+renesas@sang-engineering.com>
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
 drivers/media/pci/saa7164/saa7164-dvb.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-dvb.c b/drivers/media/pci/saa7164/saa7164-dvb.c
index 05ab4734ea67..6a527dbc1daf 100644
--- a/drivers/media/pci/saa7164/saa7164-dvb.c
+++ b/drivers/media/pci/saa7164/saa7164-dvb.c
@@ -116,8 +116,8 @@ static int si2157_attach(struct saa7164_port *port, struct i2c_adapter *adapter,
 
 	request_module(bi.type);
 
-	tuner = i2c_new_device(adapter, &bi);
-	if (tuner == NULL || tuner->dev.driver == NULL)
+	tuner = i2c_new_client_device(adapter, &bi);
+	if (!i2c_client_has_driver(tuner))
 		return -ENODEV;
 
 	if (!try_module_get(tuner->dev.driver->owner)) {
@@ -637,9 +637,9 @@ int saa7164_dvb_register(struct saa7164_port *port)
 			info.addr = 0xc8 >> 1;
 			info.platform_data = &si2168_config;
 			request_module(info.type);
-			client_demod = i2c_new_device(&dev->i2c_bus[2].i2c_adap,
+			client_demod = i2c_new_client_device(&dev->i2c_bus[2].i2c_adap,
 						      &info);
-			if (!client_demod || !client_demod->dev.driver)
+			if (!i2c_client_has_driver(client_demod))
 				goto frontend_detach;
 
 			if (!try_module_get(client_demod->dev.driver->owner)) {
@@ -657,9 +657,9 @@ int saa7164_dvb_register(struct saa7164_port *port)
 			info.addr = 0xc0 >> 1;
 			info.platform_data = &si2157_config;
 			request_module(info.type);
-			client_tuner = i2c_new_device(&dev->i2c_bus[0].i2c_adap,
+			client_tuner = i2c_new_client_device(&dev->i2c_bus[0].i2c_adap,
 						      &info);
-			if (!client_tuner || !client_tuner->dev.driver) {
+			if (!i2c_client_has_driver(client_tuner)) {
 				module_put(client_demod->dev.driver->owner);
 				i2c_unregister_device(client_demod);
 				goto frontend_detach;
@@ -682,9 +682,9 @@ int saa7164_dvb_register(struct saa7164_port *port)
 			info.addr = 0xcc >> 1;
 			info.platform_data = &si2168_config;
 			request_module(info.type);
-			client_demod = i2c_new_device(&dev->i2c_bus[2].i2c_adap,
+			client_demod = i2c_new_client_device(&dev->i2c_bus[2].i2c_adap,
 						      &info);
-			if (!client_demod || !client_demod->dev.driver)
+			if (!i2c_client_has_driver(client_demod))
 				goto frontend_detach;
 
 			if (!try_module_get(client_demod->dev.driver->owner)) {
@@ -702,9 +702,9 @@ int saa7164_dvb_register(struct saa7164_port *port)
 			info.addr = 0xc0 >> 1;
 			info.platform_data = &si2157_config;
 			request_module(info.type);
-			client_tuner = i2c_new_device(&dev->i2c_bus[1].i2c_adap,
+			client_tuner = i2c_new_client_device(&dev->i2c_bus[1].i2c_adap,
 						      &info);
-			if (!client_tuner || !client_tuner->dev.driver) {
+			if (!i2c_client_has_driver(client_tuner)) {
 				module_put(client_demod->dev.driver->owner);
 				i2c_unregister_device(client_demod);
 				goto frontend_detach;
-- 
2.20.1

