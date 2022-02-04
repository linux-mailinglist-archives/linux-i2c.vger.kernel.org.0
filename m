Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA414A9BBD
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 16:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239024AbiBDPRP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 10:17:15 -0500
Received: from mga09.intel.com ([134.134.136.24]:36121 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232625AbiBDPRO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Feb 2022 10:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643987835; x=1675523835;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OjISzdfnvj1jAwYDN8F692e864PSEzq+N74DV4ogtKI=;
  b=YcM9Yfvuq+Tz1Dw6UWhoQ4hEHgYKugThySxavJVpIZBjGq7Ll61gtg7W
   +LRYOXQfYYt40JaqXnMF9IC8ulcIRXcK6+ZK2DaKWG9oEQVlBHOtKP2ys
   MwH6YiMMOaJJRwtN+MBaFf9JkOVHaIEXlvYSh5uyFoAxzhPBLehN4ra1S
   jAW+Rx/iePy1C0E+mmnuoBTuqPvAN2iCZdVMREqQv980FhN0JTuDS7knk
   mm+UgvACTSILHYxnIYdWPNAQgP3GsglmKKmE6Xrzn3TYLJG9u1RG6dqA0
   mD0ZjoGTXXXryakRO53sRa36WepEz3A6kjQlN1T6BKbRysi//bWMGHJ1i
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248143923"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="248143923"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 07:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="498504938"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 04 Feb 2022 07:17:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 66703204; Fri,  4 Feb 2022 17:17:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Johan Hovold <johan@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
Subject: [PATCH v1 1/1] i2c: robotfuzz-osif: Propagate parent device to I2C core
Date:   Fri,  4 Feb 2022 17:17:26 +0200
Message-Id: <20220204151726.8924-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C core might use parent device to retrieve properties of
the controller. Propagate parent device for that.

Fixes: 83e53a8f120f ("i2c: Add bus driver for for OSIF USB i2c device.")
Reported-by: syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-robotfuzz-osif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-robotfuzz-osif.c b/drivers/i2c/busses/i2c-robotfuzz-osif.c
index 66dfa211e736..bfbfa0d07bb2 100644
--- a/drivers/i2c/busses/i2c-robotfuzz-osif.c
+++ b/drivers/i2c/busses/i2c-robotfuzz-osif.c
@@ -128,6 +128,7 @@ MODULE_DEVICE_TABLE(usb, osif_table);
 static int osif_probe(struct usb_interface *interface,
 			     const struct usb_device_id *id)
 {
+	struct device *dev = &interface->dev;
 	int ret;
 	struct osif_priv *priv;
 	u16 version;
@@ -145,6 +146,7 @@ static int osif_probe(struct usb_interface *interface,
 	priv->adapter.class = I2C_CLASS_HWMON;
 	priv->adapter.algo = &osif_algorithm;
 	priv->adapter.algo_data = priv;
+	priv->adapter.dev.parent = dev;
 	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
 		 "OSIF at bus %03d device %03d",
 		 priv->usb_dev->bus->busnum, priv->usb_dev->devnum);
-- 
2.34.1

