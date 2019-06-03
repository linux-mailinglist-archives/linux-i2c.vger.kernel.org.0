Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46DD933433
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 17:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbfFCPvI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 11:51:08 -0400
Received: from foss.arm.com ([217.140.101.70]:53578 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728391AbfFCPvI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 11:51:08 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7E1E1688;
        Mon,  3 Jun 2019 08:51:07 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BCFD3F246;
        Mon,  3 Jun 2019 08:51:06 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com, Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c@vger.kernel.org
Subject: [RFC PATCH 06/57] drivers: i2c: i2c-core: Use bus_find_device_by_of_node helper
Date:   Mon,  3 Jun 2019 16:49:32 +0100
Message-Id: <1559577023-558-7-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch to using the bus_find_device_by_of_node helper.

Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/i2c/i2c-core-of.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 406e5f6..b0b3fe1 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -112,11 +112,6 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	of_node_put(bus);
 }
 
-static int of_dev_node_match(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int of_dev_or_parent_node_match(struct device *dev, void *data)
 {
 	if (dev->of_node == data)
@@ -134,7 +129,7 @@ struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
 	struct device *dev;
 	struct i2c_client *client;
 
-	dev = bus_find_device(&i2c_bus_type, NULL, node, of_dev_node_match);
+	dev = bus_find_device_by_of_node(&i2c_bus_type, NULL, node);
 	if (!dev)
 		return NULL;
 
-- 
2.7.4

