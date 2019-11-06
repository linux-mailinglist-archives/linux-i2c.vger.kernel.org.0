Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 935ABF2093
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732699AbfKFVVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:21:32 -0500
Received: from sauhun.de ([88.99.104.3]:59092 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732677AbfKFVVb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:31 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id B64DE2C0570;
        Wed,  6 Nov 2019 22:21:29 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/17] media: usb: dvb-usb: dib0700_devices: convert to use i2c_new_client_device()
Date:   Wed,  6 Nov 2019 22:21:15 +0100
Message-Id: <20191106212120.27983-16-wsa+renesas@sang-engineering.com>
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
 drivers/media/usb/dvb-usb/dib0700_devices.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index ab7a100ec84f..4ef3fa98d20f 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -3772,8 +3772,8 @@ static int xbox_one_attach(struct dvb_usb_adapter *adap)
 	info.addr = 0x18;
 	info.platform_data = &mn88472_config;
 	request_module(info.type);
-	client_demod = i2c_new_device(&d->i2c_adap, &info);
-	if (client_demod == NULL || client_demod->dev.driver == NULL)
+	client_demod = i2c_new_client_device(&d->i2c_adap, &info);
+	if (!i2c_client_has_driver(client_demod))
 		goto fail_demod_device;
 	if (!try_module_get(client_demod->dev.driver->owner))
 		goto fail_demod_module;
@@ -3800,8 +3800,8 @@ static int xbox_one_attach(struct dvb_usb_adapter *adap)
 	info.platform_data = &tda18250_config;
 
 	request_module(info.type);
-	client_tuner = i2c_new_device(&adap->dev->i2c_adap, &info);
-	if (client_tuner == NULL || client_tuner->dev.driver == NULL)
+	client_tuner = i2c_new_client_device(&adap->dev->i2c_adap, &info);
+	if (!i2c_client_has_driver(client_tuner))
 		goto fail_tuner_device;
 	if (!try_module_get(client_tuner->dev.driver->owner))
 		goto fail_tuner_module;
-- 
2.20.1

