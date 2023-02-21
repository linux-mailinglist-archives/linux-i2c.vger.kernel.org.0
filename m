Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F70469E157
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 14:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234087AbjBUNco (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 08:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbjBUNcm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 08:32:42 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31C429150;
        Tue, 21 Feb 2023 05:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676986361; x=1708522361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ee5vJWxgBPi4uTSSHpnEtUYgGXBnSq9he55KJd+y654=;
  b=bk/axOm/sZ9uBJ/1oteEbxeC/D//y5mXrOPcQ0NyQKrdtVKj2P4IrgW4
   GTy8qVWZ0iyE6YUHkMxbm6E3pqeSJV755fw9qs1NfYxgNRxukFuCL1t8p
   DLVskihJT1YFN4oaWvFFeQAkBLMVPmr8YkpivrtDRr6USPvi9wiET0+Vm
   Uk5hk3p3Z76xvgqg5tVDrSM1zYJ7k9AQTeWeOqPRczgweA07/oY/g/OH/
   zTIpjb5y1X2FhfjYyMaHDKvC6+RQeHTzvCoz11CK5dKut50QHlcajCUn1
   6LXFkWfxDrg6VfIWjxTrxRgg10VIdvg3z7mFKLt+KQEFIk4qgeHtyEdA9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="333990938"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="333990938"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="649178422"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="649178422"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 05:32:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F184E354; Tue, 21 Feb 2023 15:33:09 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 3/3] i2c: Unexport i2c_of_match_device()
Date:   Tue, 21 Feb 2023 15:33:07 +0200
Message-Id: <20230221133307.20287-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_of_match_device() is not used anymore outside of I²C framework,
unexport it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-of.c |  1 -
 drivers/i2c/i2c-core.h    |  9 +++++++++
 include/linux/i2c.h       | 11 -----------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index bce6b796e04c..29102c882635 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -157,7 +157,6 @@ const struct of_device_id
 
 	return i2c_of_match_device_sysfs(matches, client);
 }
-EXPORT_SYMBOL_GPL(i2c_of_match_device);
 
 #if IS_ENABLED(CONFIG_OF_DYNAMIC)
 static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 1247e6e6e975..3e22a0645e2f 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -82,8 +82,17 @@ static inline void i2c_acpi_remove_space_handler(struct i2c_adapter *adapter) {
 
 #ifdef CONFIG_OF
 void of_i2c_register_devices(struct i2c_adapter *adap);
+const struct of_device_id *i2c_of_match_device(const struct of_device_id *matches,
+					       struct i2c_client *client);
+
 #else
 static inline void of_i2c_register_devices(struct i2c_adapter *adap) { }
+static inline
+const struct of_device_id *i2c_of_match_device(const struct of_device_id *matches,
+					       struct i2c_client *client)
+{
+	return NULL;
+}
 #endif
 extern struct notifier_block i2c_of_notifier;
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 500404d85141..17b2cbb40a55 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -993,10 +993,6 @@ static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node
 	return i2c_get_adapter_by_fwnode(of_fwnode_handle(node));
 }
 
-const struct of_device_id
-*i2c_of_match_device(const struct of_device_id *matches,
-		     struct i2c_client *client);
-
 int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 			  struct i2c_board_info *info);
 
@@ -1017,13 +1013,6 @@ static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node
 	return NULL;
 }
 
-static inline const struct of_device_id
-*i2c_of_match_device(const struct of_device_id *matches,
-		     struct i2c_client *client)
-{
-	return NULL;
-}
-
 static inline int of_i2c_get_board_info(struct device *dev,
 					struct device_node *node,
 					struct i2c_board_info *info)
-- 
2.39.1

