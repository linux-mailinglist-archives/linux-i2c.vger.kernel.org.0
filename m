Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D94E46C0AB
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 17:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239622AbhLGQan (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 11:30:43 -0500
Received: from mga09.intel.com ([134.134.136.24]:48362 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239616AbhLGQam (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 11:30:42 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237424854"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="237424854"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 08:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="462349287"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 07 Dec 2021 08:24:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7F6A8144; Tue,  7 Dec 2021 18:25:02 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: core: Do not dereference fwnode in struct device
Date:   Tue,  7 Dec 2021 18:24:57 +0200
Message-Id: <20211207162457.18450-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In order to make the underneath API easier to change in the future,
prevent users from dereferencing fwnode from struct device.
Instead, use the specific device_set_node() API for that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 80f36709e36a..e685a46fd07a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1049,12 +1049,13 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.parent = &client->adapter->dev;
 	client->dev.bus = &i2c_bus_type;
 	client->dev.type = &i2c_client_type;
-	client->dev.of_node = of_node_get(info->of_node);
-	client->dev.fwnode = info->fwnode;
 
 	device_enable_async_suspend(&client->dev);
 	i2c_dev_set_name(adap, client, info);
 
+	device_set_node(&client->dev, info->fwnode);
+	client->dev.of_node = of_node_get(info->of_node);
+
 	if (info->swnode) {
 		status = device_add_software_node(&client->dev, info->swnode);
 		if (status) {
-- 
2.33.0

