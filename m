Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B3DF20B7
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfKFVVX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:21:23 -0500
Received: from sauhun.de ([88.99.104.3]:58976 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727949AbfKFVVW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:22 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 0C5FC2C054A;
        Wed,  6 Nov 2019 22:21:21 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 01/17] i2c: add helper to check if a client has a driver attached
Date:   Wed,  6 Nov 2019 22:21:01 +0100
Message-Id: <20191106212120.27983-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106212120.27983-1-wsa+renesas@sang-engineering.com>
References: <20191106212120.27983-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factoring out something used in the media subsystem. As an improvement,
it bails out on both, NULL and ERRPTR.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i2c.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index aaf57d9b41db..93b315c9a062 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -850,6 +850,11 @@ extern void i2c_del_driver(struct i2c_driver *driver);
 #define i2c_add_driver(driver) \
 	i2c_register_driver(THIS_MODULE, driver)
 
+static inline bool i2c_client_has_driver(struct i2c_client *client)
+{
+	return !IS_ERR_OR_NULL(client) && client->dev.driver;
+}
+
 extern struct i2c_client *i2c_use_client(struct i2c_client *client);
 extern void i2c_release_client(struct i2c_client *client);
 
-- 
2.20.1

