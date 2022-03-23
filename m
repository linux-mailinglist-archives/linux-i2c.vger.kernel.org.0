Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1F04E4F15
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 10:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243152AbiCWJVe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 05:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243144AbiCWJV2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 05:21:28 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2690874DD2;
        Wed, 23 Mar 2022 02:19:58 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 72F0DE0010;
        Wed, 23 Mar 2022 09:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648027197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cICvQx2VKeX9fxChlYZQ7+y007LmLSMNhcKdMqcVDIA=;
        b=LIWhl7Yee+it6/kRd+Y5X/8B6QozydisfINYYSoHM6PKm8xgRqDx7gR7ktA0M1NRjxWMWH
        /NFTcwwUezvBPX2K0Uio/AO46YutnkRJc5gVGHR1/eqKCIPaZpXj0u4YEWFpZyb0pj0QPG
        a0aHRxRBl0s/y5N0D6WAffqMLLmxqLB+Pb6/ooi/YuWxul0viTEOeWcddjQOArwLBW/C8R
        CbpqKfzIjptXZow9RjHj0709VwpzGNSQeShLaBQvwasmnNCFOaGHgq7bkEQK49TsyNlq3B
        lIF6FOTOK+mgciDwePzLY8mMBNXjMUVdiGrM2rbI4GzwOB9bF5HrfDZiXx8ntQ==
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
Subject: [PATCH v2 3/7] software node: implement .property_read_string_index callback
Date:   Wed, 23 Mar 2022 10:18:06 +0100
Message-Id: <20220323091810.329217-4-clement.leger@bootlin.com>
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

Implement .property_read_string_index callback by fetching the strings
pointers from the software node property and getting the one at the
requested index.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/base/swnode.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 0a482212c7e8..91cefc62adb3 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -182,6 +182,34 @@ static int property_entry_read_int_array(const struct property_entry *props,
 	return 0;
 }
 
+static int property_entry_read_string_index(const struct property_entry *props,
+					    const char *propname, int index,
+					    const char **string)
+{
+	const char * const *strings;
+	size_t length;
+	int array_len;
+
+	/* Find out the array length. */
+	array_len = property_entry_count_elems_of_size(props, propname,
+						       sizeof(const char *));
+	if (array_len < 0)
+		return array_len;
+
+	if (index >= array_len)
+		return -EINVAL;
+
+	length = array_len * sizeof(const char *);
+
+	strings = property_entry_find(props, propname, length);
+	if (IS_ERR(strings))
+		return PTR_ERR(strings);
+
+	*string = strings[index];
+
+	return 0;
+}
+
 static int property_entry_read_string_array(const struct property_entry *props,
 					    const char *propname,
 					    const char **strings, size_t nval)
@@ -408,6 +436,17 @@ static int software_node_read_string_array(const struct fwnode_handle *fwnode,
 						propname, val, nval);
 }
 
+static int
+software_node_read_string_index(const struct fwnode_handle *fwnode,
+				const char *propname, int index,
+				const char **string)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+
+	return property_entry_read_string_index(swnode->node->properties,
+						propname, index, string);
+}
+
 static const char *
 software_node_get_name(const struct fwnode_handle *fwnode)
 {
@@ -665,6 +704,7 @@ static const struct fwnode_operations software_node_ops = {
 	.property_present = software_node_property_present,
 	.property_read_int_array = software_node_read_int_array,
 	.property_read_string_array = software_node_read_string_array,
+	.property_read_string_index = software_node_read_string_index,
 	.get_name = software_node_get_name,
 	.get_name_prefix = software_node_get_name_prefix,
 	.get_parent = software_node_get_parent,
-- 
2.34.1

