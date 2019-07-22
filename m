Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A569E706F4
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731666AbfGVR1k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:27:40 -0400
Received: from sauhun.de ([88.99.104.3]:42386 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731476AbfGVR0c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:32 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 600C84A1496;
        Mon, 22 Jul 2019 19:26:31 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Tony Lindgren <tony@atomide.com>,
        Lee Jones <lee.jones@linaro.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/14] mfd: palmas: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:20 +0200
Message-Id: <20190722172623.4166-14-wsa+renesas@sang-engineering.com>
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

 drivers/mfd/palmas.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index 6818ff34837c..f5b3fa973b13 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -549,12 +549,12 @@ static int palmas_i2c_probe(struct i2c_client *i2c,
 			palmas->i2c_clients[i] = i2c;
 		else {
 			palmas->i2c_clients[i] =
-					i2c_new_dummy(i2c->adapter,
+					i2c_new_dummy_device(i2c->adapter,
 							i2c->addr + i);
-			if (!palmas->i2c_clients[i]) {
+			if (IS_ERR(palmas->i2c_clients[i])) {
 				dev_err(palmas->dev,
 					"can't attach client %d\n", i);
-				ret = -ENOMEM;
+				ret = PTR_ERR(palmas->i2c_clients[i]);
 				goto err_i2c;
 			}
 			palmas->i2c_clients[i]->dev.of_node = of_node_get(node);
-- 
2.20.1

