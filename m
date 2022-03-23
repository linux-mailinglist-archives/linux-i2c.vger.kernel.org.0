Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 454334E4F19
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 10:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243134AbiCWJV3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 05:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243136AbiCWJV1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 05:21:27 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C626B75E56;
        Wed, 23 Mar 2022 02:19:57 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B7703E0002;
        Wed, 23 Mar 2022 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648027196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qyb8jvpxwlbhqFVGMSODHshsQVtt2WPMV1JsAacLn80=;
        b=bTFFDm3O/LGcE0NVRmZDSvmNxmTXjdLGnGo6URr+c43mYAyhQBM65TCTKpS0TCys3k075t
        nrlQRqdqxOZzPZeRY7oZWRNIIH1GhQJusjxTQhEuoxDJPOrfWhRkwxDSyRaD6ffxL1uNEi
        AY1GtuzjrY9Inqd+PsGi2R1cPZHqtVP1RF3aO7ZHPfIHAka5tGqZ/z4F1WGYdltg5NJGdV
        bcstzmhCO9CE+dATMfznlBTT+Ly8xw6S3ScZlefn48BQ0AbyQQL7qnf/9beEXtABHdvpmM
        +3Ic8KVqdG1ULzStJeSaNm43u0ngh+QWK/yx2KZcYnZLwpGPTeAg9z0uSuIDfQ==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Subject: [PATCH v2 2/7] of: property: implement .property_read_string_index callback
Date:   Wed, 23 Mar 2022 10:18:05 +0100
Message-Id: <20220323091810.329217-3-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323091810.329217-1-clement.leger@bootlin.com>
References: <20220323091810.329217-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implement .property_read_string_index callback using
of_property_read_string_index().

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/of/property.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 8e90071de6ed..573eea693bfa 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -915,6 +915,16 @@ of_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 		of_property_count_strings(node, propname);
 }
 
+static int
+of_fwnode_property_read_string_index(const struct fwnode_handle *fwnode,
+				     const char *propname, int index,
+				     const char **string)
+{
+	const struct device_node *node = to_of_node(fwnode);
+
+	return of_property_read_string_index(node, propname, index, string);
+}
+
 static const char *of_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	return kbasename(to_of_node(fwnode)->full_name);
@@ -1475,6 +1485,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.property_present = of_fwnode_property_present,
 	.property_read_int_array = of_fwnode_property_read_int_array,
 	.property_read_string_array = of_fwnode_property_read_string_array,
+	.property_read_string_index = of_fwnode_property_read_string_index,
 	.get_name = of_fwnode_get_name,
 	.get_name_prefix = of_fwnode_get_name_prefix,
 	.get_parent = of_fwnode_get_parent,
-- 
2.34.1

