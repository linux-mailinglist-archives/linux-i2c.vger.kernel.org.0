Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8257F20A8
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732792AbfKFVWH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:22:07 -0500
Received: from sauhun.de ([88.99.104.3]:59008 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728002AbfKFVV2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:28 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 004612C054A;
        Wed,  6 Nov 2019 22:21:24 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/17] media: pci: cx23885: cx23885-dvb: convert to use i2c_new_client_device()
Date:   Wed,  6 Nov 2019 22:21:07 +0100
Message-Id: <20191106212120.27983-8-wsa+renesas@sang-engineering.com>
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
 drivers/media/pci/cx23885/cx23885-dvb.c | 114 +++++++++++-------------
 1 file changed, 54 insertions(+), 60 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/cx23885/cx23885-dvb.c
index 4f386db33a11..494751a067a3 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -1159,8 +1159,8 @@ static int dvb_register_ci_mac(struct cx23885_tsport *port)
 		info.addr = 0x40;
 		info.platform_data = &sp2_config;
 		request_module(info.type);
-		client_ci = i2c_new_device(&i2c_bus->i2c_adap, &info);
-		if (client_ci == NULL || client_ci->dev.driver == NULL)
+		client_ci = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+		if (!i2c_client_has_driver(client_ci))
 			return -ENODEV;
 		if (!try_module_get(client_ci->dev.driver->owner)) {
 			i2c_unregister_device(client_ci);
@@ -1826,8 +1826,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x05;
 			info.platform_data = &tda10071_pdata;
 			request_module("tda10071");
-			client_demod = i2c_new_device(&i2c_bus->i2c_adap, &info);
-			if (!client_demod || !client_demod->dev.driver)
+			client_demod = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+			if (!i2c_client_has_driver(client_demod))
 				goto frontend_detach;
 			if (!try_module_get(client_demod->dev.driver->owner)) {
 				i2c_unregister_device(client_demod);
@@ -1843,8 +1843,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x0b;
 			info.platform_data = &a8293_pdata;
 			request_module("a8293");
-			client_sec = i2c_new_device(&i2c_bus->i2c_adap, &info);
-			if (!client_sec || !client_sec->dev.driver)
+			client_sec = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+			if (!i2c_client_has_driver(client_sec))
 				goto frontend_detach;
 			if (!try_module_get(client_sec->dev.driver->owner)) {
 				i2c_unregister_device(client_sec);
@@ -1864,9 +1864,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x64;
 			info.platform_data = &si2165_pdata;
 			request_module(info.type);
-			client_demod = i2c_new_device(&i2c_bus->i2c_adap, &info);
-			if (client_demod == NULL ||
-					client_demod->dev.driver == NULL)
+			client_demod = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+			if (!i2c_client_has_driver(client_demod))
 				goto frontend_detach;
 			if (!try_module_get(client_demod->dev.driver->owner)) {
 				i2c_unregister_device(client_demod);
@@ -1898,8 +1897,8 @@ static int dvb_register(struct cx23885_tsport *port)
 		info.addr = 0x05;
 		info.platform_data = &tda10071_pdata;
 		request_module("tda10071");
-		client_demod = i2c_new_device(&i2c_bus->i2c_adap, &info);
-		if (!client_demod || !client_demod->dev.driver)
+		client_demod = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+		if (!i2c_client_has_driver(client_demod))
 			goto frontend_detach;
 		if (!try_module_get(client_demod->dev.driver->owner)) {
 			i2c_unregister_device(client_demod);
@@ -1915,8 +1914,8 @@ static int dvb_register(struct cx23885_tsport *port)
 		info.addr = 0x0b;
 		info.platform_data = &a8293_pdata;
 		request_module("a8293");
-		client_sec = i2c_new_device(&i2c_bus->i2c_adap, &info);
-		if (!client_sec || !client_sec->dev.driver)
+		client_sec = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+		if (!i2c_client_has_driver(client_sec))
 			goto frontend_detach;
 		if (!try_module_get(client_sec->dev.driver->owner)) {
 			i2c_unregister_device(client_sec);
@@ -1948,9 +1947,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x60;
 			info.platform_data = &ts2020_config;
 			request_module(info.type);
-			client_tuner = i2c_new_device(adapter, &info);
-			if (client_tuner == NULL ||
-					client_tuner->dev.driver == NULL)
+			client_tuner = i2c_new_client_device(adapter, &info);
+			if (!i2c_client_has_driver(client_tuner))
 				goto frontend_detach;
 			if (!try_module_get(client_tuner->dev.driver->owner)) {
 				i2c_unregister_device(client_tuner);
@@ -1985,9 +1983,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x64;
 			info.platform_data = &si2168_config;
 			request_module(info.type);
-			client_demod = i2c_new_device(&i2c_bus->i2c_adap, &info);
-			if (client_demod == NULL ||
-					client_demod->dev.driver == NULL)
+			client_demod = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+			if (!i2c_client_has_driver(client_demod))
 				goto frontend_detach;
 			if (!try_module_get(client_demod->dev.driver->owner)) {
 				i2c_unregister_device(client_demod);
@@ -2004,9 +2001,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x60;
 			info.platform_data = &si2157_config;
 			request_module(info.type);
-			client_tuner = i2c_new_device(adapter, &info);
-			if (client_tuner == NULL ||
-					client_tuner->dev.driver == NULL)
+			client_tuner = i2c_new_client_device(adapter, &info);
+			if (!i2c_client_has_driver(client_tuner))
 				goto frontend_detach;
 
 			if (!try_module_get(client_tuner->dev.driver->owner)) {
@@ -2032,8 +2028,8 @@ static int dvb_register(struct cx23885_tsport *port)
 		info.addr = 0x64;
 		info.platform_data = &si2168_config;
 		request_module(info.type);
-		client_demod = i2c_new_device(&i2c_bus2->i2c_adap, &info);
-		if (client_demod == NULL || client_demod->dev.driver == NULL)
+		client_demod = i2c_new_client_device(&i2c_bus2->i2c_adap, &info);
+		if (!i2c_client_has_driver(client_demod))
 			goto frontend_detach;
 		if (!try_module_get(client_demod->dev.driver->owner)) {
 			i2c_unregister_device(client_demod);
@@ -2050,9 +2046,8 @@ static int dvb_register(struct cx23885_tsport *port)
 		info.addr = 0x60;
 		info.platform_data = &si2157_config;
 		request_module(info.type);
-		client_tuner = i2c_new_device(adapter, &info);
-		if (client_tuner == NULL ||
-				client_tuner->dev.driver == NULL)
+		client_tuner = i2c_new_client_device(adapter, &info);
+		if (!i2c_client_has_driver(client_tuner))
 			goto frontend_detach;
 		if (!try_module_get(client_tuner->dev.driver->owner)) {
 			i2c_unregister_device(client_tuner);
@@ -2080,8 +2075,8 @@ static int dvb_register(struct cx23885_tsport *port)
 		info.addr = 0x60;
 		info.platform_data = &ts2020_config;
 		request_module(info.type);
-		client_tuner = i2c_new_device(adapter, &info);
-		if (client_tuner == NULL || client_tuner->dev.driver == NULL)
+		client_tuner = i2c_new_client_device(adapter, &info);
+		if (!i2c_client_has_driver(client_tuner))
 			goto frontend_detach;
 		if (!try_module_get(client_tuner->dev.driver->owner)) {
 			i2c_unregister_device(client_tuner);
@@ -2129,8 +2124,8 @@ static int dvb_register(struct cx23885_tsport *port)
 		info.addr = 0x68;
 		info.platform_data = &m88ds3103_pdata;
 		request_module(info.type);
-		client_demod = i2c_new_device(&i2c_bus->i2c_adap, &info);
-		if (client_demod == NULL || client_demod->dev.driver == NULL)
+		client_demod = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+		if (!i2c_client_has_driver(client_demod))
 			goto frontend_detach;
 		if (!try_module_get(client_demod->dev.driver->owner)) {
 			i2c_unregister_device(client_demod);
@@ -2149,8 +2144,8 @@ static int dvb_register(struct cx23885_tsport *port)
 		info.addr = 0x60;
 		info.platform_data = &ts2020_config;
 		request_module(info.type);
-		client_tuner = i2c_new_device(adapter, &info);
-		if (client_tuner == NULL || client_tuner->dev.driver == NULL)
+		client_tuner = i2c_new_client_device(adapter, &info);
+		if (!i2c_client_has_driver(client_tuner))
 			goto frontend_detach;
 		if (!try_module_get(client_tuner->dev.driver->owner)) {
 			i2c_unregister_device(client_tuner);
@@ -2194,8 +2189,8 @@ static int dvb_register(struct cx23885_tsport *port)
 		info.addr = 0x64;
 		info.platform_data = &si2168_config;
 		request_module(info.type);
-		client_demod = i2c_new_device(&i2c_bus->i2c_adap, &info);
-		if (client_demod == NULL || client_demod->dev.driver == NULL)
+		client_demod = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+		if (!i2c_client_has_driver(client_demod))
 			goto frontend_detach;
 		if (!try_module_get(client_demod->dev.driver->owner)) {
 			i2c_unregister_device(client_demod);
@@ -2212,9 +2207,8 @@ static int dvb_register(struct cx23885_tsport *port)
 		info.addr = 0x60;
 		info.platform_data = &si2157_config;
 		request_module(info.type);
-		client_tuner = i2c_new_device(adapter, &info);
-		if (client_tuner == NULL ||
-				client_tuner->dev.driver == NULL)
+		client_tuner = i2c_new_client_device(adapter, &info);
+		if (!i2c_client_has_driver(client_tuner))
 			goto frontend_detach;
 		if (!try_module_get(client_tuner->dev.driver->owner)) {
 			i2c_unregister_device(client_tuner);
@@ -2245,8 +2239,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x0b;
 			info.platform_data = &a8293_pdata;
 			request_module("a8293");
-			client_sec = i2c_new_device(&i2c_bus->i2c_adap, &info);
-			if (!client_sec || !client_sec->dev.driver)
+			client_sec = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+			if (!i2c_client_has_driver(client_sec))
 				goto frontend_detach;
 			if (!try_module_get(client_sec->dev.driver->owner)) {
 				i2c_unregister_device(client_sec);
@@ -2262,8 +2256,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x21;
 			info.platform_data = &m88rs6000t_config;
 			request_module("%s", info.type);
-			client_tuner = i2c_new_device(adapter, &info);
-			if (!client_tuner || !client_tuner->dev.driver)
+			client_tuner = i2c_new_client_device(adapter, &info);
+			if (!i2c_client_has_driver(client_tuner))
 				goto frontend_detach;
 			if (!try_module_get(client_tuner->dev.driver->owner)) {
 				i2c_unregister_device(client_tuner);
@@ -2287,8 +2281,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x64;
 			info.platform_data = &si2168_config;
 			request_module("%s", info.type);
-			client_demod = i2c_new_device(&i2c_bus->i2c_adap, &info);
-			if (!client_demod || !client_demod->dev.driver)
+			client_demod = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
+			if (!i2c_client_has_driver(client_demod))
 				goto frontend_detach;
 			if (!try_module_get(client_demod->dev.driver->owner)) {
 				i2c_unregister_device(client_demod);
@@ -2305,8 +2299,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x60;
 			info.platform_data = &si2157_config;
 			request_module("%s", info.type);
-			client_tuner = i2c_new_device(&i2c_bus2->i2c_adap, &info);
-			if (!client_tuner || !client_tuner->dev.driver) {
+			client_tuner = i2c_new_client_device(&i2c_bus2->i2c_adap, &info);
+			if (!i2c_client_has_driver(client_tuner)) {
 				module_put(client_demod->dev.driver->owner);
 				i2c_unregister_device(client_demod);
 				port->i2c_client_demod = NULL;
@@ -2340,8 +2334,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x64;
 			info.platform_data = &si2168_config;
 			request_module("%s", info.type);
-			client_demod = i2c_new_device(&dev->i2c_bus[0].i2c_adap, &info);
-			if (!client_demod || !client_demod->dev.driver)
+			client_demod = i2c_new_client_device(&dev->i2c_bus[0].i2c_adap, &info);
+			if (!i2c_client_has_driver(client_demod))
 				goto frontend_detach;
 			if (!try_module_get(client_demod->dev.driver->owner)) {
 				i2c_unregister_device(client_demod);
@@ -2358,8 +2352,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x60;
 			info.platform_data = &si2157_config;
 			request_module("%s", info.type);
-			client_tuner = i2c_new_device(&dev->i2c_bus[1].i2c_adap, &info);
-			if (!client_tuner || !client_tuner->dev.driver) {
+			client_tuner = i2c_new_client_device(&dev->i2c_bus[1].i2c_adap, &info);
+			if (!i2c_client_has_driver(client_tuner)) {
 				module_put(client_demod->dev.driver->owner);
 				i2c_unregister_device(client_demod);
 				port->i2c_client_demod = NULL;
@@ -2387,8 +2381,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x66;
 			info.platform_data = &si2168_config;
 			request_module("%s", info.type);
-			client_demod = i2c_new_device(&dev->i2c_bus[0].i2c_adap, &info);
-			if (!client_demod || !client_demod->dev.driver)
+			client_demod = i2c_new_client_device(&dev->i2c_bus[0].i2c_adap, &info);
+			if (!i2c_client_has_driver(client_demod))
 				goto frontend_detach;
 			if (!try_module_get(client_demod->dev.driver->owner)) {
 				i2c_unregister_device(client_demod);
@@ -2405,8 +2399,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x62;
 			info.platform_data = &si2157_config;
 			request_module("%s", info.type);
-			client_tuner = i2c_new_device(&dev->i2c_bus[1].i2c_adap, &info);
-			if (!client_tuner || !client_tuner->dev.driver) {
+			client_tuner = i2c_new_client_device(&dev->i2c_bus[1].i2c_adap, &info);
+			if (!i2c_client_has_driver(client_tuner)) {
 				module_put(client_demod->dev.driver->owner);
 				i2c_unregister_device(client_demod);
 				port->i2c_client_demod = NULL;
@@ -2447,8 +2441,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x60;
 			info.platform_data = &si2157_config;
 			request_module("%s", info.type);
-			client_tuner = i2c_new_device(&dev->i2c_bus[1].i2c_adap, &info);
-			if (!client_tuner || !client_tuner->dev.driver) {
+			client_tuner = i2c_new_client_device(&dev->i2c_bus[1].i2c_adap, &info);
+			if (!i2c_client_has_driver(client_tuner)) {
 				module_put(client_demod->dev.driver->owner);
 				i2c_unregister_device(client_demod);
 				port->i2c_client_demod = NULL;
@@ -2483,8 +2477,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x62;
 			info.platform_data = &si2157_config;
 			request_module("%s", info.type);
-			client_tuner = i2c_new_device(&dev->i2c_bus[1].i2c_adap, &info);
-			if (!client_tuner || !client_tuner->dev.driver) {
+			client_tuner = i2c_new_client_device(&dev->i2c_bus[1].i2c_adap, &info);
+			if (!i2c_client_has_driver(client_tuner)) {
 				module_put(client_demod->dev.driver->owner);
 				i2c_unregister_device(client_demod);
 				port->i2c_client_demod = NULL;
@@ -2523,8 +2517,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			info.addr = 0x60;
 			info.platform_data = &si2157_config;
 			request_module("%s", info.type);
-			client_tuner = i2c_new_device(&dev->i2c_bus[1].i2c_adap, &info);
-			if (!client_tuner || !client_tuner->dev.driver)
+			client_tuner = i2c_new_client_device(&dev->i2c_bus[1].i2c_adap, &info);
+			if (!i2c_client_has_driver(client_tuner))
 				goto frontend_detach;
 
 			if (!try_module_get(client_tuner->dev.driver->owner)) {
-- 
2.20.1

