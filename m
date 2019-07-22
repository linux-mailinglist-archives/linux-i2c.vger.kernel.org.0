Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA98706BD
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731294AbfGVR0E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:04 -0400
Received: from sauhun.de ([88.99.104.3]:42110 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731280AbfGVR0E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:04 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 75FFD4A1491;
        Mon, 22 Jul 2019 19:26:02 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] extcon: extcon-max77843: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:01 +0200
Message-Id: <20190722172601.3506-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172601.3506-1-wsa+renesas@sang-engineering.com>
References: <20190722172601.3506-1-wsa+renesas@sang-engineering.com>
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

 drivers/extcon/extcon-max77843.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index a343a6ef3506..e6b50ca83008 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -774,12 +774,12 @@ static int max77843_init_muic_regmap(struct max77693_dev *max77843)
 {
 	int ret;
 
-	max77843->i2c_muic = i2c_new_dummy(max77843->i2c->adapter,
+	max77843->i2c_muic = i2c_new_dummy_device(max77843->i2c->adapter,
 			I2C_ADDR_MUIC);
-	if (!max77843->i2c_muic) {
+	if (IS_ERR(max77843->i2c_muic)) {
 		dev_err(&max77843->i2c->dev,
 				"Cannot allocate I2C device for MUIC\n");
-		return -ENOMEM;
+		return PTR_ERR(max77843->i2c_muic);
 	}
 
 	i2c_set_clientdata(max77843->i2c_muic, max77843);
-- 
2.20.1

