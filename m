Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3C85193E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2019 19:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbfFXREV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jun 2019 13:04:21 -0400
Received: from sauhun.de ([88.99.104.3]:35462 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726920AbfFXREV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jun 2019 13:04:21 -0400
Received: from localhost (p54B33083.dip0.t-ipconnect.de [84.179.48.131])
        by pokefinder.org (Postfix) with ESMTPSA id 373442C7A26;
        Mon, 24 Jun 2019 19:04:19 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: add newly exported functions to the header, too
Date:   Mon, 24 Jun 2019 19:04:02 +0200
Message-Id: <20190624170402.6944-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Nobody (including me) noticed that these functions were exported but not
added to the header :/

Fixes: 7159dbdae3c5 ("i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 5 ++---
 include/linux/i2c.h         | 6 ++++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9e43508d4567..4ef44fa7e36b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -721,7 +721,7 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
  * This returns the new i2c client, which may be saved for later use with
  * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
-static struct i2c_client *
+struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
 	struct i2c_client	*client;
@@ -887,8 +887,7 @@ static struct i2c_driver dummy_driver = {
  * This returns the new i2c client, which should be saved for later use with
  * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
-static struct i2c_client *
-i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
+struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
 {
 	struct i2c_board_info info = {
 		I2C_BOARD_INFO("dummy", address),
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 1308126fc384..79f0d4fd5036 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -436,6 +436,9 @@ struct i2c_board_info {
 extern struct i2c_client *
 i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
 
+extern struct i2c_client *
+i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
+
 /* If you don't know the exact address of an I2C device, use this variant
  * instead, which can probe for device presence in a list of possible
  * addresses. The "probe" callback function is optional. If it is provided,
@@ -457,6 +460,9 @@ extern int i2c_probe_func_quick_read(struct i2c_adapter *, unsigned short addr);
 extern struct i2c_client *
 i2c_new_dummy(struct i2c_adapter *adap, u16 address);
 
+extern struct i2c_client *
+i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address);
+
 extern struct i2c_client *
 devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap, u16 address);
 
-- 
2.19.1

