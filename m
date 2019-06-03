Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0AB332AB7
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 10:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfFCIZm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 04:25:42 -0400
Received: from sauhun.de ([88.99.104.3]:35876 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727463AbfFCIZl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 04:25:41 -0400
Received: from localhost (unknown [88.128.80.57])
        by pokefinder.org (Postfix) with ESMTPSA id D40A93E6009;
        Mon,  3 Jun 2019 10:25:39 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 1/5] i2c: headers: don't use 'dev' as adapter variable
Date:   Mon,  3 Jun 2019 10:25:31 +0200
Message-Id: <20190603082535.1566-2-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190603082535.1566-1-wsa@the-dreams.de>
References: <20190603082535.1566-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is not a struct device, so 'dev' is confusing. Use 'adap', the most
common name.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 include/linux/i2c.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e982b8913b73..6bd199cfe61f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -703,14 +703,14 @@ struct i2c_adapter {
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-static inline void *i2c_get_adapdata(const struct i2c_adapter *dev)
+static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
-	return dev_get_drvdata(&dev->dev);
+	return dev_get_drvdata(&adap->dev);
 }
 
-static inline void i2c_set_adapdata(struct i2c_adapter *dev, void *data)
+static inline void i2c_set_adapdata(struct i2c_adapter *adap, void *data)
 {
-	dev_set_drvdata(&dev->dev, data);
+	dev_set_drvdata(&adap->dev, data);
 }
 
 static inline struct i2c_adapter *
-- 
2.19.1

