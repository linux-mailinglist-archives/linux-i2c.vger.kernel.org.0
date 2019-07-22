Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75C3A70717
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730899AbfGVR2h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:28:37 -0400
Received: from sauhun.de ([88.99.104.3]:42188 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731403AbfGVR0W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:22 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id B25334A1498;
        Mon, 22 Jul 2019 19:26:20 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] rtc: s35390a: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:17 +0200
Message-Id: <20190722172618.4061-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172618.4061-1-wsa+renesas@sang-engineering.com>
References: <20190722172618.4061-1-wsa+renesas@sang-engineering.com>
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

 drivers/rtc/rtc-s35390a.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 84806ff763cf..5826209a3f30 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -450,12 +450,12 @@ static int s35390a_probe(struct i2c_client *client,
 
 	/* This chip uses multiple addresses, use dummy devices for them */
 	for (i = 1; i < 8; ++i) {
-		s35390a->client[i] = i2c_new_dummy(client->adapter,
+		s35390a->client[i] = i2c_new_dummy_device(client->adapter,
 					client->addr + i);
-		if (!s35390a->client[i]) {
+		if (IS_ERR(s35390a->client[i])) {
 			dev_err(dev, "Address %02x unavailable\n",
 				client->addr + i);
-			err = -EBUSY;
+			err = PTR_ERR(s35390a->client[i]);
 			goto exit_dummy;
 		}
 	}
-- 
2.20.1

