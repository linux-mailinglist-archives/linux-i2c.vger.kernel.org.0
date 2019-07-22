Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 580EC70725
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731374AbfGVR0Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:16 -0400
Received: from sauhun.de ([88.99.104.3]:42138 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731363AbfGVR0Q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:16 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 9B19E4A1495;
        Mon, 22 Jul 2019 19:26:14 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kevin Tsai <ktsai@capellamicro.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] iio: light: cm36651: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:11 +0200
Message-Id: <20190722172613.3890-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172613.3890-1-wsa+renesas@sang-engineering.com>
References: <20190722172613.3890-1-wsa+renesas@sang-engineering.com>
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

 drivers/iio/light/cm36651.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/light/cm36651.c b/drivers/iio/light/cm36651.c
index 7702c2bcbcfa..1019d625adb1 100644
--- a/drivers/iio/light/cm36651.c
+++ b/drivers/iio/light/cm36651.c
@@ -646,18 +646,18 @@ static int cm36651_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, indio_dev);
 
 	cm36651->client = client;
-	cm36651->ps_client = i2c_new_dummy(client->adapter,
+	cm36651->ps_client = i2c_new_dummy_device(client->adapter,
 						     CM36651_I2C_ADDR_PS);
-	if (!cm36651->ps_client) {
+	if (IS_ERR(cm36651->ps_client)) {
 		dev_err(&client->dev, "%s: new i2c device failed\n", __func__);
-		ret = -ENODEV;
+		ret = PTR_ERR(cm36651->ps_client);
 		goto error_disable_reg;
 	}
 
-	cm36651->ara_client = i2c_new_dummy(client->adapter, CM36651_ARA);
-	if (!cm36651->ara_client) {
+	cm36651->ara_client = i2c_new_dummy_device(client->adapter, CM36651_ARA);
+	if (IS_ERR(cm36651->ara_client)) {
 		dev_err(&client->dev, "%s: new i2c device failed\n", __func__);
-		ret = -ENODEV;
+		ret = PTR_ERR(cm36651->ara_client);
 		goto error_i2c_unregister_ps;
 	}
 
-- 
2.20.1

