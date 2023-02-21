Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 578F169E154
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 14:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234045AbjBUNcn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 08:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233863AbjBUNck (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 08:32:40 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8307A29146;
        Tue, 21 Feb 2023 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676986353; x=1708522353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gAs7mmCUMTX3mc/WGDDKZyUzsOVaQDT07IZYG1MzAGI=;
  b=TrU6pYmM8FfBW2VuPud+pk/QZsysvTks1MJpl1Oy/Ll+pswcJy7z9tzR
   R+W2tbLyV0bIuZzEIRvASrYbnCYpjJtTnZEsaj6GZXLat7YnZQrQLXwl0
   a1H1+JHJuWIxsBTEC0wKra0nZbwEZTUxdN4msVXgJxZLrMMHIWv0iL2g4
   Fc0bZCjarZQpJ9aVUREkkqeUNxdYTGIV1qgYlafdmPxKfXnbdXE2kXD1S
   25UGhWPP0HZbQTxpd2xxoG0QFDokvLrF+k2TySZoIkdRxoNRcpNyb6YCP
   5GOgc9uGcQf+WbEs7789JgwOMzU4WqZno6hngGLmtB4WqHgrRUc6DLxKS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="360101507"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="360101507"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:32:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="671656027"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="671656027"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 21 Feb 2023 05:32:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EBD06367; Tue, 21 Feb 2023 15:33:09 +0200 (EET)
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
Subject: [PATCH v1 2/3] auxdisplay: ht16k33: Make use of device_get_match_data()
Date:   Tue, 21 Feb 2023 15:33:06 +0200
Message-Id: <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
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
 drivers/auxdisplay/ht16k33.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 02425991c159..8e2fd2291ea4 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -60,7 +60,8 @@
 #define HT16K33_FB_SIZE		(HT16K33_MATRIX_LED_MAX_COLS * BYTES_PER_ROW)
 
 enum display_type {
-	DISP_MATRIX = 0,
+	DISP_UNKNOWN = 0,
+	DISP_MATRIX,
 	DISP_QUAD_7SEG,
 	DISP_QUAD_14SEG,
 };
@@ -675,6 +676,7 @@ static int ht16k33_seg_probe(struct device *dev, struct ht16k33_priv *priv,
 		return err;
 
 	switch (priv->type) {
+	default:
 	case DISP_MATRIX:
 		/* not handled here */
 		err = -EINVAL;
@@ -713,7 +715,6 @@ static int ht16k33_seg_probe(struct device *dev, struct ht16k33_priv *priv,
 static int ht16k33_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	const struct of_device_id *id;
 	struct ht16k33_priv *priv;
 	uint32_t dft_brightness;
 	int err;
@@ -728,9 +729,8 @@ static int ht16k33_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->client = client;
-	id = i2c_of_match_device(dev->driver->of_match_table, client);
-	if (id)
-		priv->type = (uintptr_t)id->data;
+	priv->type = (uintptr_t)device_get_match_data(dev);
+
 	i2c_set_clientdata(client, priv);
 
 	err = ht16k33_initialize(priv);
@@ -771,6 +771,9 @@ static int ht16k33_probe(struct i2c_client *client)
 		/* Segment Display */
 		err = ht16k33_seg_probe(dev, priv, dft_brightness);
 		break;
+	default:
+		/* Unknown display; enumerated via user space? */
+		err = 0;
 	}
 	return err;
 }
@@ -795,6 +798,8 @@ static void ht16k33_remove(struct i2c_client *client)
 		device_remove_file(&client->dev, &dev_attr_map_seg7);
 		device_remove_file(&client->dev, &dev_attr_map_seg14);
 		break;
+	default:
+		break;
 	}
 }
 
-- 
2.39.1

