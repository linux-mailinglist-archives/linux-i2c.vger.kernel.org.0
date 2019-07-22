Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F9B7072F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731366AbfGVR0P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:15 -0400
Received: from sauhun.de ([88.99.104.3]:42206 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731354AbfGVR0O (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:14 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id E7C254A1493;
        Mon, 22 Jul 2019 19:26:12 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwmon: w83781d: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:10 +0200
Message-Id: <20190722172611.3797-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172611.3797-1-wsa+renesas@sang-engineering.com>
References: <20190722172611.3797-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
ERRPTR which we use in error handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.

 drivers/hwmon/w83781d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index d2c04b6a3f2b..015f1ea31966 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -894,12 +894,12 @@ w83781d_detect_subclients(struct i2c_client *new_client)
 	}
 
 	for (i = 0; i < num_sc; i++) {
-		data->lm75[i] = i2c_new_dummy(adapter, sc_addr[i]);
-		if (!data->lm75[i]) {
+		data->lm75[i] = i2c_new_dummy_device(adapter, sc_addr[i]);
+		if (IS_ERR(data->lm75[i])) {
 			dev_err(&new_client->dev,
 				"Subclient %d registration at address 0x%x failed.\n",
 				i, sc_addr[i]);
-			err = -ENOMEM;
+			err = PTR_ERR(data->lm75[i]);
 			if (i == 1)
 				goto ERROR_SC_3;
 			goto ERROR_SC_2;
-- 
2.20.1

