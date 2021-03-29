Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A72A34CE35
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbhC2KvQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:49552 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232741AbhC2Ku4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:56 -0400
IronPort-SDR: CSLVAVjaldjfHB6cB+TfCMCQgPFVtBroqzlEfjVVDxKpIkHvYZJLGzeMW9QHtXigPVp6+tFnOp
 ewfC7K8f9N/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653680"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653680"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:55 -0700
IronPort-SDR: MytefdG5msTQLBfkpejKuD6BpJnoEAMkY0R0BcXmGf8HwDZFb6SK8WsyIWOZApMgrH3n2ASWQ7
 w35EJsvd46iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955915"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:53 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 11/12] Input: elantech - Prepare a complete software node for the device
Date:   Mon, 29 Mar 2021 13:50:46 +0300
Message-Id: <20210329105047.51033-12-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Creating a software node and supplying that for the device
instead of only the device properties in it. A software
node was always created in any case to hold the additional
device properties, so this change does not have any real
effect.

This change makes it possible to remove support for the
problematic "dangling" device properties from i2c subsystem,
i.e. the "properties" member from struct i2c_board_info. The
problems caused by them are not related to this driver.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/elantech.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 97381e2e03bae..2d0bc029619ff 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1885,8 +1885,6 @@ static int elantech_create_smbus(struct psmouse *psmouse,
 	};
 	unsigned int idx = 0;
 
-	smbus_board.properties = i2c_props;
-
 	i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-size-x",
 						   info->x_max + 1);
 	i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-size-y",
@@ -1918,6 +1916,10 @@ static int elantech_create_smbus(struct psmouse *psmouse,
 	if (elantech_is_buttonpad(info))
 		i2c_props[idx++] = PROPERTY_ENTRY_BOOL("elan,clickpad");
 
+	smbus_board.fwnode = fwnode_create_software_node(i2c_props, NULL);
+	if (IS_ERR(smbus_board.fwnode))
+		return PTR_ERR(smbus_board.fwnode);
+
 	return psmouse_smbus_init(psmouse, &smbus_board, NULL, 0, false,
 				  leave_breadcrumbs);
 }
-- 
2.30.2

