Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7A969E152
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 14:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbjBUNcm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 08:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234062AbjBUNck (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 08:32:40 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6802F29166;
        Tue, 21 Feb 2023 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676986352; x=1708522352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CbTLdq9gpOZ1tlC0WjzeLsvTuFT+CtH0G4OwvkjX+2Q=;
  b=n3dEja3/d/nTs3FAheMIwcGJLxSZ8WKclHqxUC2QaKrXNuBAHh9lBuvD
   RYsEOJ3GdGEeYKWBsmR+qSckzRmVYfOwKZ01v5thGWRIYWZoSwA1cUkOs
   l7VJ6w3hovcJZ7ef6dh2424AwCkDf4iRqJUxWDzN3bIGzEEQ+k8DYn8W1
   lB8bGeC5TkHHI5q7C3BxakQQEQzU2KC0DpHVxuQlX1VUfq97YGJ7JJDWb
   P0++L1qL06vCNf7lWV6sqLPljdXcfSGRMTjOuUjCInWxASNTALMSWSwh6
   W3sAfLGhrJBwm5gnvHSQ0A+FkTHurLB8P0eVVRoYuBrlAAtTcyC8EzFUD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="333990931"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="333990931"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="649178421"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="649178421"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 05:32:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D7F3014F; Tue, 21 Feb 2023 15:33:09 +0200 (EET)
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
Subject: [PATCH v1 1/3] usb: typec: stusb160x: Make use of device_get_match_data()
Date:   Tue, 21 Feb 2023 15:33:05 +0200
Message-Id: <20230221133307.20287-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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

Switching to use device_get_match_data() helps getting of
i2c_of_match_device() API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/typec/stusb160x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index 494b371151e0..70d9f68d99c9 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -11,6 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/role.h>
@@ -633,9 +634,8 @@ MODULE_DEVICE_TABLE(of, stusb160x_of_match);
 
 static int stusb160x_probe(struct i2c_client *client)
 {
+	const struct regmap_config *regmap_config;
 	struct stusb160x *chip;
-	const struct of_device_id *match;
-	struct regmap_config *regmap_config;
 	struct fwnode_handle *fwnode;
 	int ret;
 
@@ -645,8 +645,8 @@ static int stusb160x_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, chip);
 
-	match = i2c_of_match_device(stusb160x_of_match, client);
-	regmap_config = (struct regmap_config *)match->data;
+	regmap_config = device_get_match_data(&client->dev);
+
 	chip->regmap = devm_regmap_init_i2c(client, regmap_config);
 	if (IS_ERR(chip->regmap)) {
 		ret = PTR_ERR(chip->regmap);
-- 
2.39.1

