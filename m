Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7B9706F1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731490AbfGVR0e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:34 -0400
Received: from sauhun.de ([88.99.104.3]:42398 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731478AbfGVR0d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:33 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id E94D44A1497;
        Mon, 22 Jul 2019 19:26:31 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Tony Lindgren <tony@atomide.com>,
        Lee Jones <lee.jones@linaro.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] mfd: twl-core: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:21 +0200
Message-Id: <20190722172623.4166-15-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
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

 drivers/mfd/twl-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index 448d9397ff04..20cf8cfe4f3b 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -1141,12 +1141,12 @@ twl_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		if (i == 0) {
 			twl->client = client;
 		} else {
-			twl->client = i2c_new_dummy(client->adapter,
+			twl->client = i2c_new_dummy_device(client->adapter,
 						    client->addr + i);
-			if (!twl->client) {
+			if (IS_ERR(twl->client)) {
 				dev_err(&client->dev,
 					"can't attach client %d\n", i);
-				status = -ENOMEM;
+				status = PTR_ERR(twl->client);
 				goto fail;
 			}
 		}
-- 
2.20.1

